using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;
using System.Xml.Xsl;
using System.Threading.Tasks;
using System.Collections.Concurrent;


namespace Display
{
    class ConvertXMLtoHTML
    {
       static IEnumerable<string> files;

        //set tuple with 2 values, xml file name and the content of the respective xml file
       static  ConcurrentQueue<Tuple<string, string[]>> cq = new ConcurrentQueue<Tuple<string, string[]>>();
       
       #region  Get the list of all xml files from the folder i.e. \Data\Computers
       internal static void ReadAllXMLFiles()
       {
           const string searchPattern = "*.xml";
            //read the path of xml files
            string xmlFilePath = Environment.CurrentDirectory + @"\Data\Computers";
           try
           {
               //get all the file with searchPattern as *.xml
               files = Directory.EnumerateFiles(xmlFilePath, searchPattern);

               IterateFiles(files, xmlFilePath);
           }
           catch (NullReferenceException e)
           {
               //Handle no File found...   
           }
       }

       #endregion

       internal static int TransformXMLToHTML()
       {
           int i = cq.Count;
           //assign the Computer.xsl file path
           string xslFile = Environment.CurrentDirectory + @"\Resources\Computer.xsl";

           //Declare and create a new XSLT processor object that implements the XSLT
           XslCompiledTransform transform = new XslCompiledTransform();
           try
           {
               //Load the XSL 
               transform.Load(xslFile);

               //create and HTML folder by calling GetHTMLfilePath() method
               string htmlFilePath = GetHTMLfilePath();

               Tuple<string, string[]> tpl;

               while (!cq.IsEmpty)
               {
                   // dequeue the value from tuple and creating unique html files
                   cq.TryDequeue(out tpl);

                   //Call the transform method to transform the xml to an html output
                   transform.Transform(tpl.Item1, htmlFilePath + @"\result" + i + ".html");
                   i--;
               }
           }
           catch (Exception ex)
           {
               //Handle exception
           }
               return i;
       }


       #region Read all files and its contents & store in queue
       internal static ConcurrentQueue<Tuple<string, string[]>> IterateFiles(IEnumerable<string> files, string directory)
       {
           string[] contents = null;
           foreach (var file in files)
           {
               //for verification if dirctory and file are 
               Console.WriteLine("{0}", Path.Combine(directory, file));
               try
               {
                   //reading all the content of xml file
                   contents = File.ReadAllLines(file);
                   //putting the tuple pair values on queue
                   cq.Enqueue(new Tuple<string, string[]>(file, contents));
               }
               catch (IOException ex)
               {
                   //Handle File may be in use...                    
               }
           }
           return cq;
       }
       #endregion

       #region Creates HTML folder at root if does not exist and deleting all the files within
       internal static string GetHTMLfilePath()
       {
           // your set HTML folder path
           string htmlFilePath = Environment.CurrentDirectory + @"\HTML";

           bool isExists = System.IO.Directory.Exists(htmlFilePath);
           // if no HTML folder if does not exist
           if (!isExists)
               System.IO.Directory.CreateDirectory(htmlFilePath);
           else
               Array.ForEach(Directory.GetFiles(htmlFilePath), File.Delete);
           return htmlFilePath;
       }
       #endregion

    }
}
