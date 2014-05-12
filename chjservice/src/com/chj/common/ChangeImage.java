package com.chj.common;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.json.BaseBean;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class ChangeImage {
	
	
	
	 public static BufferedImage makeRoundedCorner(BufferedImage image, 
	            int cornerRadius) { 
	        int w = image.getWidth(); 
	        int h = image.getHeight(); 
	        BufferedImage output = new BufferedImage(w, h, 
	                BufferedImage.TYPE_INT_ARGB); 

	        Graphics2D g2 = output.createGraphics(); 

	        // This is what we want, but it only does hard-clipping, i.e. aliasing 
	        // g2.setClip(new RoundRectangle2D ...) 

	        // so instead fake soft-clipping by first drawing the desired clip shape 
	        // in fully opaque white with antialiasing enabled... 
	        g2.setComposite(AlphaComposite.Src); 
	        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, 
	                RenderingHints.VALUE_ANTIALIAS_ON); 
	        g2.setColor(Color.WHITE); 
	        g2.fill(new RoundRectangle2D.Float(0, 0, w, h, cornerRadius, 
	                cornerRadius)); 

	        // ... then compositing the image on top, 
	        // using the white shape from above as alpha source 
	        g2.setComposite(AlphaComposite.SrcAtop); 
	        g2.drawImage(image, 0, 0, null); 

	        g2.dispose(); 

	        return output; 
	    } 

	    public static BufferedImage createResizedCopy(Image originalImage, int scaledWidth, 
	            int scaledHeight, boolean preserveAlpha) { 
	        int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB 
	                : BufferedImage.TYPE_INT_ARGB; 
	        BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, 
	                imageType); 
	        Graphics2D g = scaledBI.createGraphics(); 
	        if (preserveAlpha) { 
	            g.setComposite(AlphaComposite.Src); 
	        } 
	        g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null); 
	        g.dispose(); 
	        return scaledBI; 
	    } 

	    public static void main(String[] args) throws IOException { 
	        BufferedImage icon = ImageIO.read(new File("d://dd.jpg")); 
	        BufferedImage rounded = makeRoundedCorner(icon, icon.getWidth()); 
	        ImageIO.write(rounded, "png", new File("d://dd.png")); 
	         
//	        BufferedImage pic = ImageIO.read(new File("/home/june/桌面/zhang.jpg")); 
//	        BufferedImage resized = createResizedCopy(pic, 250, 250*768/1024, true); 
//	        ImageIO.write(resized, "jpg", new File("/home/june/桌面/zhang_small.jpg")); 
	    } 

}
