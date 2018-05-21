package services;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.Color;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import tablePojos.Report;
import tablePojos.Report_Revision;
import tablePojos.User;


public class PdfService {

    // Tabellen Object fuer den Zugriff der Hilfsmethode "tableAddCell"
    private PdfPTable table;
    // Hintergrundfarben
    public static final Color bgColorGray = new Color(192,192,192);
    public static final Color bgColorBrightGray = new Color(240, 240, 240);
    // Hoehen von Zellen
    public static final Float textFliedMiddleHigh = 20f;
    public static final Float textFliedHigh = 120f;



    public PdfService() {
    }

    public PdfService(User user,Report report,Report_Revision reportRevision) throws FileNotFoundException, DocumentException {


        //<editor-fold desc="Initiale Einstellungen">
        // Neues Document erstellen mit Ausmasen einer DIN A4 Seite und Abstandsangaben fuer oben,unten,links,rechts
        Document document = new Document(PageSize.A4, 20f, 20f, 20f, 20f);
        // Format fuer die Datums festlegen
        DateFormat dateFormat = new SimpleDateFormat("dd.mm.yyyy");
        String startDateStr = dateFormat.format(report.getDate());
        // Name der PDF erstellen und speicherort /code angeben
        String fileName = "/code/Berichtsheft-" + user.getEmail() + "-" + startDateStr  +".pdf";

        // Neue Instanz eines PdfWriters welcher das Document und speichertOrt bzw FileOutStream bekommt
        PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(fileName));

        document.open();
        //</editor-fold>

        //<editor-fold desc="Ueberschrift der PDF erstellen">
        Chunk chunk1 = new Chunk("Systemgenerierter Ausbildungsnachweis nach IHK Vorlage");
        chunk1.setUnderline(1.0f, -1.4f);
        chunk1.setFont(FontFactory.getFont("Arial", 13, Font.BOLD));
        Paragraph p = new Paragraph(chunk1);
        p.setAlignment(Element.ALIGN_CENTER);
        document.add(p);
        //</editor-fold>

        document.add(new Paragraph(Chunk.NEWLINE));

        //<editor-fold desc="Azubi Infos">
        // Tabelle mit den Azubi Daten erstllen das Float Array beschreibt die Anzahl und Breite der Spalten
        table = new PdfPTable(new float[]{35, 15, 10, 15, 20});
        table.setWidthPercentage(85);

        // Calender zum hochzaehlen eines Datums fuer Wochenendtag
        Calendar cal = Calendar.getInstance();
        cal.setTime(report.getDate());
        cal.add(Calendar.DATE,6);
        Date endDate = cal.getTime();

        String endDateStr = dateFormat.format(endDate);

        // Tablle der Azubi Daten befuellen
        tableAddCell("Name des/der Auszubildenden:", null,null, bgColorBrightGray);
        tableAddCell(user.getFirst_name() + " " + user.getLast_name(), textFliedMiddleHigh, 2, bgColorBrightGray);
        tableAddCell("Bericht Nr.:", null,null, bgColorBrightGray);
        tableAddCell(report.getReportCount() + "", null,null, null);
        tableAddCell("Ausbildungsjahr:", textFliedMiddleHigh, null, bgColorBrightGray);
        tableAddCell(user.getEducational_year() + "", textFliedMiddleHigh, null, null);
        tableAddCell("Ausbildungs Abt.:", textFliedMiddleHigh, 2, bgColorBrightGray);
        tableAddCell(user.getJob() + "", null, null, null);
        tableAddCell("Ausbildungswoche von:", textFliedMiddleHigh, null, bgColorBrightGray);
        tableAddCell(startDateStr + "", textFliedMiddleHigh, null, null);
        tableAddCell("bis:", textFliedMiddleHigh, null, bgColorBrightGray);
        tableAddCell(endDateStr + "", textFliedMiddleHigh, 2, null);

        document.add(table);
        //</editor-fold>

        document.add(new Paragraph(Chunk.NEWLINE));

        //<editor-fold desc="Berichte und Stunden">
        // Tabelle fuer den Bericht und Stunden erstellen das Float Array beschreibt die Anzahl und Breite der Spalten
        table = new PdfPTable(new float[]{80,20});
        table.setWidthPercentage(85);

        // Tabelle mit Bericht Stunden fuellen
        tableAddCell("Betriebliche Tätigkeiten",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell("Stunden",textFliedMiddleHigh,null,null);
        tableAddCell(reportRevision.getTextOperationalActivities() + "",textFliedHigh,null,null);
        tableAddCell(reportRevision.getHoursOperationalActivities() + "",null,null,null);
        tableAddCell("Unterweisungen, betrieblicher Unterricht, sonstige Schulungen",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell("Stunden",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell(reportRevision.getTextOperationalGuidance() +"",textFliedHigh,null,null);
        tableAddCell(reportRevision.getHoursOperationalGuidance() + "",null,null,null);
        tableAddCell("Themen des Berufsschulunterrichts",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell("Stunden",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell(reportRevision.getTextVocationalTeaching() + "",textFliedHigh,null,null);
        tableAddCell(reportRevision.getHoursVocationalTeaching() + "",null,null,null);


        document.add(table);
        //</editor-fold>

        document.add(new Paragraph(Chunk.NEWLINE));

        //<editor-fold desc="Ausbilder Kommentar">
        // Ausbilder Kommenatar Tabelle erstellen das Float Array beschreibt die Anzahl und Breite der Spalten
        table = new PdfPTable(new float[]{100});
        table.setWidthPercentage(85);

        // Kommeantar einfuegen
        tableAddCell("Kommentar des Ausbilders",textFliedMiddleHigh,null,bgColorGray);
        tableAddCell(reportRevision.getComment() + "",textFliedHigh,null,null);
        document.add(table);
        //</editor-fold>

        // Schlussnedlich Document schliessen und damit PDF Gennerierung abschließssen. Datei erstellt
        document.close();

    }



    // Hilfsmethode welche den zu schreibenden Text, die hoehe einer Zelle,
    // die horizontal zu verbindenden Zellen und die Hintergrundfarbe als Parameter bekommt
    // und dem entsprechend, wenn jene Parameter uebergeben wurden die noetigen Transformationen durchfuehrt,
    // und dann die Zelle der aktuellen Tabelle hinzufuegt
    public void tableAddCell(String text, Float hohe, Integer colspan, Color color)
    {
        PdfPCell cell = new PdfPCell();

        if (text!=null) {
            cell = new PdfPCell(new Phrase(text));
        }
        if (hohe!=null) {
            cell.setFixedHeight(hohe);
        }
        if (colspan!=null) {
            cell.setColspan(colspan);
        }
        if (color!=null) {
            cell.setBackgroundColor(color);
        }

        table.addCell(cell);
    }
}
