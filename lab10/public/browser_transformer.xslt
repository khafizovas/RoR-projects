<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Клиентское преобразование</title>
      </head>

      <body>
        <table>
          <caption>Найденные палиндромы</caption>

          <thead>
            <tr>
              <th>Десятичное число</th>
              <th>Двоичное число</th>
            </tr>
          </thead>

          <tbody>
            <xsl:for-each select="objects/object">
              <tr>
                <td>
                  <xsl:value-of select="dec"/>
                </td>
                <td>
                  <xsl:value-of select="bin"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>