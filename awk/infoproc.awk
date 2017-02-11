BEGIN{
        RS="\n\n"       #separateur d'enregistrement
        FS="\n"         #separateur de ligne
        #en-tete et debut de page HTML
        print "<html>"
        print "<head>"
print "<title>informations cpu et m&eacute;moire</title>"
        print "<style type=\"text/css\">"
        print "table {border: solid thin; padding 10px; margin 5px}"
        print "table.proc {color: DarkSlateBlue; border-color: DarkSlateBlue}"
        print "table.proc caption {color: white; background: DarkSlateBlue; text-align: center}"
        print "table.mem {color: DarkGreen; border-color: DarkGreen}"
        print "table.mem caption {color: white; background: DarkGreen; text-align: center}"
        print "</style>"
        print "</head>"
        print "<body>"
        print "<table><tr>"
}
FILENAME ~ /cpuinfo$/ { print "<td valign=\"top\"><table class=\"proc\">"}
FILENAME ~ /meminfo$/ { print "<td valign=\"top\"><table class=\"mem\">"}
{     
        for(i=1; i<=NF; i++){
                split($i,cpu,":")
                if(i==1) print "<caption>", cpu[1], cpu[2], "</caption>"
                else print "<tr><td>", cpu[1], "</td><td>", cpu[2], "</td></tr>"
}
        print "</table></td>"
}
END{
        #fin de page HTML
        print "</tr></table>"
        print "</body>"
print "</html>"
}
