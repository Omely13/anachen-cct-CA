<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- this XSL stylesheet matches the <JavacoTea> tag in an associated XML
	file and replaces it with the HTML contents of the template. -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Ana's Bookstore</title>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                <link href="AnaBookstoreStyles.css" rel="stylesheet" type="text/css" />
                <!-- Include the JavaScript code for processing the XML data -->
                <script src="AnaBookstoreCode.js"></script>
                <script>
			        window.addEventListener("load", function() {
			            document.forms[0].txtBillAmt.value = calculateBill('bookTable');
			            document.querySelector("#calcBill").addEventListener("click", function() {
			                document.forms[0].txtBillAmt.value = calculateBill('bookTable');
			            });
			            document.querySelector("#showAva").addEventListener("click", function() {
			                highlightAvailable('bookTable', this.checked);
			            });
			        });
			    </script>
            </head>
            <body>
                <h2>
                    <img src="bookstore.png" alt="Javaco Tea Logo" width="58" height="100" />Welcome to Ana's Book Store</h2>
                <p>Select your entrees from the menu below. To calculate the amount of the bill, click the Calculate Bill button. Check the "Highlight Available" box to highlight availables books in the store.</p>
                <table id="bookTable" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">Ana's Book Store</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Item</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/bookstore/book">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="section">
                                <tr>
                                    <xsl:attribute name="available">
                                        <xsl:value-of select="boolean(./@available)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="item" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="price" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
                <form class="indent">
                    <p>
                        <input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill" />
				Total: €
				<input type="text" name="txtBillAmt" /><input type="checkbox" name="cbOpts" value="isAva" id="showAva" /><label for="showAva">Highlight Available Books</label></p>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
