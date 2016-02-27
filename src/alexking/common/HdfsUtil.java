package alexking.common;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
public class HdfsUtil {

	public static final String HDFS_PATH="hdfs://hadoop0:9000";
	
	public void makeDiretory(String dirPath) throws IllegalArgumentException, IOException, URISyntaxException{
		FileSystem fileSystem = FileSystem.get(new URI(HDFS_PATH), new Configuration());
		fileSystem.mkdirs(new Path(dirPath));
	}
	public void deleteFile(String filePath) throws IOException, URISyntaxException{
		FileSystem fileSystem = FileSystem.get(new URI(HDFS_PATH), new Configuration());
		fileSystem.delete(new Path(filePath), true);
	}
	public void downloadFile(String sourcePath ,String distPath) throws IOException, URISyntaxException{
		FileSystem fileSystem = FileSystem.get(new URI(HDFS_PATH), new Configuration());
		FSDataInputStream in =fileSystem.open(new Path(sourcePath));
		final FileOutputStream out= new FileOutputStream(distPath);
		IOUtils.copyBytes(in, out, 1024*1024,true);
	}
	public void uploadFile(String sourcePath ,String distPath) throws IOException, URISyntaxException{
		FileSystem fileSystem = FileSystem.get(new URI(HDFS_PATH), new Configuration());
		FileInputStream in= new FileInputStream(sourcePath);
		FSDataOutputStream out= fileSystem.create(new Path(distPath));
		IOUtils.copyBytes(in, out,1024*1024,true);
	}
	public void rename(String oldName, String newName) throws IOException, URISyntaxException{
	    FileSystem fileSystem = FileSystem.get(new URI(HDFS_PATH), new Configuration());
	    Path oldPath = new Path(oldName);
	    Path newPath = new Path(newName);
	    fileSystem.rename(oldPath, newPath);
	}
}
