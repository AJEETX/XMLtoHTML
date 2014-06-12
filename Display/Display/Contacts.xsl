<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <table width="500px" border="1px" style="text-align:left;border-collapse:collapse">
      <tr backcolor="blue">
        <td>
          <strong>Name</strong>
        </td>
        <td>
          <strong>
            Mobile Number
          </strong>
        </td>
        <td>
          <strong>
            eMail ID
          </strong>
        </td>
        <td>
          <strong>
            Address
          </strong>
        </td>
      </tr>
      <xsl:for-each select="Contacts/Contact">
        <tr>
          <td>
            <xsl:value-of select="Name"/>
          </td>
          <td>
            <xsl:value-of select="MobileNumber"/>
          </td>
          <td>
            <xsl:value-of select="email"/>
          </td>
          <td>
            <xsl:value-of select="address"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>

