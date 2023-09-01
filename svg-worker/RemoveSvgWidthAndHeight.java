import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class RemoveSvgWidthAndHeight {
    public static void main(String[] args) throws Throwable {
        File svg = new File(args[0]);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(svg.getAbsolutePath());

        Element rooElement = document.getDocumentElement();
        rooElement.removeAttribute("width");
        rooElement.removeAttribute("height");

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        DOMSource source = new DOMSource(document);
        BufferedWriter writer =
                new BufferedWriter(new OutputStreamWriter(new FileOutputStream(svg)));
        StreamResult result = new StreamResult(writer);
        transformer.transform(source, result);
    }
}
