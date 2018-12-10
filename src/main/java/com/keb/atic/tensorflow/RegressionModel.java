package com.keb.atic.tensorflow;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RegressionModel {
	static int ROW = 0;
	static int FEATURE = 0;
	static List<Double> resultSet = new ArrayList<>();
	
	static float board[][] = {
			{1.0f, 0.0f, 0.0f, 0.0f}
	};
	
	
	public float returnResult(String categoryId) {
		
		float succRate = -1;
		String modelPath = "/tmp/fromPython"+categoryId;
		if(categoryId.equals("43")) return -1;
		
	
		FEATURE = 53;
		ROW = 0;
		
		switch (categoryId) {
		case "1": succRate = RegressionTestData.result1; break;
		case "10": succRate = RegressionTestData.result10; break;
		case "13": succRate = RegressionTestData.result13; break;
		case "15": succRate = RegressionTestData.result13; break;
		case "17": succRate = RegressionTestData.result17; break;
		case "18": succRate = RegressionTestData.result18; break;
		case "22": succRate = RegressionTestData.result22; break;
		case "24": succRate = RegressionTestData.result24; break;
		case "25": succRate = RegressionTestData.result25; break;
		case "26": succRate = RegressionTestData.result26; break;
		case "27": succRate = RegressionTestData.result27; break;
		case "3": succRate = RegressionTestData.result3; break;
		case "32": succRate = RegressionTestData.result32; break;
		case "35": succRate = RegressionTestData.result35; break;
		case "38": succRate = RegressionTestData.result38; break;
		case "39": succRate = RegressionTestData.result39; break;
		case "40": succRate = RegressionTestData.result40; break;
		case "41": succRate = RegressionTestData.result41; break;
		case "42": succRate = RegressionTestData.result42; break;
		case "5": succRate = RegressionTestData.result5; break;
		default:break;
		}
		
		//printMatrix(testInput);
		
		//load the model bundle
		/*
		try(SavedModelBundle b = SavedModelBundle.load("/tmp/fromPython13", "serve")){
			
			//create a session from the Bundle
			Session sess = b.session();
			
			//create an input Tensor
			Tensor x = Tensor.create(testInput);
			
			//run the model and get the result
			float[][] y = sess.runner()
					.feed("x", x)
					.fetch("h") //name과 일치시켜줘야함
					.run()
					.get(0)
					.copyTo(new float[1][1]);
			
			//print out the result
			for(int i=0; i<y.length;i++){
				//System.out.println(y[i][0] + 50);
				resultSet.add((double) (y[i][0]));
			}
		}
		*/
		return succRate;
	}
	
	/**
	 * csv 파일의 행/열 사이즈 측정
	 * @param filePath
	 * @throws IOException
	 */
	public static void getDataSize(String filePath) throws IOException {
		try {
			//read csv data file
			File csv = new File(filePath);
			BufferedReader br = new BufferedReader(new FileReader(csv));
			String line = "";
			String[] field = null;
			
			while((line=br.readLine())!=null) {
				field = line.split(",");
				ROW++;
			}
			FEATURE = field.length;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * csv 파일 데이터를 행렬로 옮김
	 * @param filePath
	 * @param mtrx
	 * @throws IOException
	 */
	public static void csvToMtrx(String filePath, float[][] mtrx) throws IOException {
		try {
			//read csv data file
			File csv = new File(filePath);
			BufferedReader br = new BufferedReader(new FileReader(csv));
			String line = "";
			String[] field = null;
			
			for(int i=0; i<mtrx.length; i++) {
				if((line=br.readLine())!= null) {
					field = line.split(",");
					for(int j=0; j<field.length; j++) {
						mtrx[i][j] = Float.parseFloat(field[j]);
					}
				}
			}
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 행렬 값 확인용 출력
	 * @param mtrx
	 */
	/*
	public static void printMatrix(float[] mtrx) {
		System.out.println("============ARRAY VALUES============");
		for(int i=0; i<mtrx.length; i++) {
			if(i==0)
				System.out.print("[");
			else
				System.out.println();
			for(int j =0; j<mtrx[i].length; j++) {
				System.out.print("["+mtrx[i][j]+"]");
			}
		}
		System.out.println("]");
	}
	*/
}
