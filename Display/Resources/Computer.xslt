<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <HTML>
      <title>
        <xsl:value-of select="Overview/Machine/ComputerName"/> Computer Report
      </title>
      <link rel="stylesheet" type="text/css" href="Style.css"/>
      <BODY>
        <TABLE border="0" cellpadding="0" cellspacing="0" width="100%">
          <TR class="resultHeader">
            <TD colspan="2" align="center">
              Details for Computer <xsl:value-of select="Overview/Machine/ComputerName"/>
            </TD>
          </TR>
        </TABLE>
        <TABLE border="0" cellPadding="0" cellSpacing="0" COLS="2" width="100%">
          <TBODY>
            <TR>
              <TD Width="50%" valign="top">
                <TABLE>
                  <TR class="resultDetailHeader" valign="top">
                    <TD colspan="2">System Information</TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Trident</TD>
                    <TD class="resultDetail">
                      <xsl:if test="Overview/Assigned/AssignedCount != '0'">
                        Yes
                      </xsl:if>
                      <xsl:if test="Overview/Assigned/AssignedCount = '0'">
                        No
                      </xsl:if>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">IP Address</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/IPAddress"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">MAC Address</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/Macaddress"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">OS Login</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/OSLogin"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">OS</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/OperatingSystem"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Screen Resolution</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/ScreenResolution"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Temp Dir Size</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/TempDirSize"/>
                    </TD>
                  </TR>
                </TABLE>
              </TD>
              <TD Width="50%" valign="top">
                <TABLE width="100%">
                  <TR class="resultDetailHeader"  valign="top">
                    <TD colspan="2">Hardware</TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Manufacturer</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/Manufacturer"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Model</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/Product"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">RAM</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/Memory"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">SerialNumber</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/SerialNumber"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="resultDetailLabel">Processor</TD>
                    <TD class="resultDetail">
                      <xsl:value-of select="Overview/Machine/ProcessorVersion"/>
                    </TD>
                  </TR>
                </TABLE>
              </TD>
            </TR>
          </TBODY>
        </TABLE>
        <TABLE border="0" cellPadding="0" cellSpacing="0" COLS="2" width="100%">
          <TBODY>
            <TR>
              <TD Width="50%" align="left" valign="top">
                <!-- Drives -->
                <TABLE border="0" cellPadding="1" cellSpacing="1" COLS="5" width="100%">
                  <TBODY>
                    <TR class="resultDetailHeader">
                      <TD colspan="5">Drives</TD>
                    </TR>
                    <TR>
                      <TD class="resultDetailLabel" width="5%">Volume</TD>
                      <TD class="resultDetailLabel" width="7%">Type</TD>
                      <TD class="resultDetailLabel" width="10%" align="RIGHT">Free</TD>
                      <TD class="resultDetailLabel" width="10%" align="RIGHT">Total</TD>
                    </TR>
                    <xsl:for-each select="Overview/Drives">
                      <TR>
                        <TD class="resultDetail">
                          <xsl:value-of select="Volume"/>:
                        </TD>
                        <TD class="resultDetail">
                          <xsl:value-of select="DriveTypeDesc"/>
                        </TD>
                        <TD align="RIGHT" class="resultDetail">
                          <xsl:value-of select="FreeSpace"/>
                        </TD>
                        <TD align="RIGHT" class="resultDetail">
                          <xsl:value-of select="TotalSpace"/>
                        </TD>
                        <TD></TD>
                      </TR>
                    </xsl:for-each>
                  </TBODY>
                </TABLE>
              </TD>
              <TD Width="50%" align="right" valign="top">
                <!-- Printers -->
                <TABLE border="0" cellPadding="1" cellSpacing="1" COLS="1" width="100%">
                  <TBODY>
                    <TR>
                      <TD class="resultDetailHeader">Printers</TD>
                    </TR>
                    <xsl:for-each select="Overview/Printers">
                      <TR>
                        <TD  class="resultDetail">
                          <xsl:value-of select="Name"/>:
                        </TD>
                      </TR>
                    </xsl:for-each>
                  </TBODY>
                </TABLE>
              </TD>
            </TR>
          </TBODY>
        </TABLE>
        <TABLE border="0" cellPadding="0" cellSpacing="0" COLS="2" width="100%">
          <TBODY>
            <TR class="resultDetailHeader">
              <TD colspan="2">Missing OS Patches</TD>
              <TR>
                <TD class="resultDetailLabel" width="10%">Q Number</TD>
                <TD class="resultDetailLabel">Title</TD>
              </TR>
            </TR>
            <xsl:for-each select="Overview/MissingPatches">
              <TR>
                <TD class="resultDetail">
                  <xsl:value-of select="QNumber"/>
                </TD>
                <TD class="resultDetail">
                  <xsl:value-of select="Title"/>
                </TD>
              </TR>
            </xsl:for-each>
          </TBODY>
        </TABLE>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
