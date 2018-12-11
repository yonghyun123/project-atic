package com.keb.actic.common.evaluation;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.keb.atic.company.domain.Company;
import com.keb.atic.company.mapper.CompanyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class EvaluationModel {
	@Inject
	private CompanyMapper companyMapper;
	
	private int monthAvg = 20; //criteria1 평균적금 기간
	private float avgEmployee = 0.944f; //criteria2 월평균 임직원 수

	
	/* 첫번째 기준 결과값 */
	public float firstCriteria(Company comp) {
		float result = 0;
		log.info(comp);

		// 적금 받은 날짜가 있다면
		if (comp.getFirstDate().length() > 1) {
			String create = comp.getCreateDate();
			String first = comp.getFirstDate();
			int diffMonth = getDiffDate(create,first);
			
			if(diffMonth < monthAvg){
				result = 10;
			} else if(diffMonth == monthAvg){
				result = 8;
			} else if(diffMonth > monthAvg && diffMonth > 40){
				result = 4;
			} else if(diffMonth > monthAvg && diffMonth < 40){
				//20개월 부터 40개월 사이
				result = 5;
			}

		} else{
			result = 4;
		}
		// return fund;
		return result;
	}
	
	/*두번째 기준 */
	public float secondCriteria(Company comp){
		Date curDate = new Date(); //현재날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String curDateStr = format.format(curDate);
		String createDateStr = comp.getCreateDate();
		int diffMonth = getDiffDate(curDateStr, createDateStr);
		
		float diffEmpAvg = Float.parseFloat(comp.getEmpCount())/(float)diffMonth;
		float result = 0;
		
		if(diffEmpAvg > avgEmployee+0.1){
			result = 10;
		} else if( avgEmployee-0.1 <= diffEmpAvg && diffEmpAvg <= avgEmployee+0.1){
			result = 8;
		} else if(diffEmpAvg < avgEmployee-0.1){
			result = 6;
		}
		return result;
	}
	/*세번째 기준 결과값 */
	public float thirdCriteria(Company comp){
		String createYear = getStringYear(comp.getCreateDate());
		float result = 0;
		switch (createYear) {
		case "1999": result = 0.2f; break;
		case "2005": result = 0.2f; break;
		case "2006": result = 0.2f; break;
		case "2007": result = 0.2f; break;
		case "2008": result = 1.74f; break;
		case "2009": result = 0.75f; break;
		case "2010": result = 4.48f; break;
		case "2011": result = 7.22f; break;
		case "2012": result = 9.2f; break;
		case "2013": result = 8.2f; break;
		case "2014": result = 10.0f; break;
		case "2015": result = 6.47f; break;
		default:
			result = 0.1f;
			break;
		}
		return result;
	}
	/*네번째 기준 */
	public double fourthCriteria(Company comp) {
		int categoryId = Integer.parseInt(comp.getCategoryId());
		double result = 0;
		if(categoryId<43) {
	         result = 1;
		}else if(categoryId <=48) {
	         result = 2.7;
	    }else if(categoryId <= 50) {
	         result = 8.2;
	    }else if(categoryId == 51) {
	         result = 9.2;
	    }else if(categoryId == 52) {
	         result = 9.95;
	    }
		
		return result;
	}
	
	/*5번째 기준 */
	public double fifthCriteria(Company comp) {
	      double result = 0;
	      String firstDate = comp.getFirstDate();
	      String year = null;
	      if(comp.getFundHistory().equals("2") ||comp.getFundHistory().equals("3")) {
	       year = firstDate.substring(0, 4);
	      }else {
	    	  return 4;
	      }
	      String category = "";
	      String first = comp.getFirstFund();
	      if(first == null) {
	         return 4;
	      }
	      double firstFund = Double.parseDouble(first);
	      firstFund = firstFund/100000000;
	      int categoryId = Integer.parseInt(comp.getCategoryId());
	      if(categoryId<43) {
	         category = "비IT";
	      }else if(categoryId <=48) {
	         category = "platForm";
	      }else if(categoryId <= 50) {
	         category = "ITdevelope";
	      }else if(categoryId == 51) {
	         category = "game";
	      }else if(categoryId == 52) {
	         category = "security";
	      }
	      switch (category) {
	      case "비IT":
	         result = 1;
	         break;
	      case "platForm":
	         if(year.equals("2010")) {
	            if(firstFund < 14) {
	               result = 6;
	               break;
	            }else if(firstFund == 14) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }else if(year.equals("2011")) {
	            if(firstFund < 17) {
	               result = 6;
	               break;
	            }else if(firstFund == 17) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }else if(year.equals("2012")) {
	            if(firstFund < 8.2) {
	               result = 6;
	               break;
	            }else if(firstFund == 8.2) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2013")) {
	            if(firstFund < 6.3) {
	               result = 6;
	               break;
	            }else if(firstFund == 6.3) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2014")) {
	            if(firstFund < 17.5) {
	               result = 6;
	               break;
	            }else if(firstFund == 17.5) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2015")) {
	            if(firstFund < 24) {
	               result = 6;
	               break;
	            }else if(firstFund == 24) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2016")) {
	            if(firstFund < 9.8) {
	               result = 6;
	               break;
	            }else if(firstFund == 9.8) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2017")) {
	            if(firstFund < 24) {
	               result = 6;
	               break;
	            }else if(firstFund == 24) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2018")) {
	            if(firstFund < 65) {
	               result = 6;
	               break;
	            }else if(firstFund == 65) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         break;
	      case "ITdevelope":
	         if(year.equals("2011")) {
	            if(firstFund < 9.6) {
	               result = 6;
	               break;
	            }else if(firstFund == 9.6) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }else if(year.equals("2012")) {
	            if(firstFund < 6) {
	               result = 6;
	               break;
	            }else if(firstFund == 6) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2013")) {
	            if(firstFund < 4.5) {
	               result = 6;
	               break;
	            }else if(firstFund == 4.5) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2014")) {
	            if(firstFund < 5) {
	               result = 6;
	               break;
	            }else if(firstFund == 5) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2015")) {
	            if(firstFund < 7.4) {
	               result = 6;
	               break;
	            }else if(firstFund == 7.4) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2016")) {
	            if(firstFund < 16.3) {
	               result = 6;
	               break;
	            }else if(firstFund == 16.3) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         break;
	      case "game":
	         if(year.equals("2009")) {
	            if(firstFund < 40) {
	               result = 6;
	               break;
	            }else if(firstFund == 40) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }else if(year.equals("2012")) {
	            if(firstFund < 5) {
	               result = 6;
	               break;
	            }else if(firstFund == 5) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2013")) {
	            if(firstFund < 4.7) {
	               result = 6;
	               break;
	            }else if(firstFund == 4.7) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2014")) {
	            if(firstFund < 9.8) {
	               result = 6;
	               break;
	            }else if(firstFund == 9.8) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2015")) {
	            if(firstFund < 17.3) {
	               result = 6;
	               break;
	            }else if(firstFund == 17.3) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2016")) {
	            if(firstFund < 100) {
	               result = 6;
	               break;
	            }else if(firstFund == 100) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         else if(year.equals("2018")) {
	            if(firstFund < 200) {
	               result = 6;
	               break;
	            }else if(firstFund == 200) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         break;
	      case "security":
	         if(year.equals("2015")) {
	            if(firstFund < 15) {
	               result = 6;
	               break;
	            }else if(firstFund == 15) {
	               result = 8;
	               break;
	            } else {
	               result = 10;
	            }
	         }
	         break;

	      default:
	         break;
	      }
	      return result;
	}
	/*6번째 기준 */
	public int sixthCriteria(Company comp) {
	      // 모기업들이 처음 받은 월별 평균 적금 금액
	      double avgFirstFund = 0.8748601932;
	      // 모기업들이 두번째로 받은 월별 평균 적금 금액
	      double avgSecondFund = 1.061047619;
	      
	      int result=0;
	      
	      String createDate = comp.getCreateDate();
	      String firstDate = comp.getFirstDate();
	      String secondDate = comp.getSecondDate();
	      
	      double firstDiff ;
	      double secondDiff ;
	      
	      
	      if(comp.getFundHistory().equals("1")) {
	         result=0;
	      }else if(comp.getFundHistory().equals("2")) {
	    	  firstDiff = (Double.parseDouble(comp.getFirstFund())/10000000) /getDiffDate(createDate, firstDate);  
	    	  if (firstDiff < avgFirstFund) {
	 	         result = 3;
	 	      } else if (firstDiff == avgFirstFund) {
	 	         result = 4;
	 	      } else {
	 	         result = 5;
	 	      }
	      }else if(comp.getFundHistory().equals("3")) {
	    	  firstDiff = (Double.parseDouble(comp.getFirstFund())/10000000) /getDiffDate(createDate, firstDate);
	    	  if (firstDiff < avgFirstFund) {
		 	         result = 3;
		 	      } else if (firstDiff == avgFirstFund) {
		 	         result = 4;
		 	      } else {
		 	         result = 5;
		 	      }
	    	  secondDiff = (Double.parseDouble(comp.getFirstFund())/10000000) /getDiffDate(firstDate, secondDate);
	    	  if(secondDiff < avgSecondFund) {
	 	         result += 3;
	 	      } else if (secondDiff == avgSecondFund) {
	 	         result += 4;
	 	      } else if (secondDiff > avgSecondFund) {
	 	         result += 5;
	 	      }
	      }
	            return result;
	}
	
	/* 7번째 기준 */
	public float seventhCriteria(Company comp) {
	      String createDate = comp.getCreateDate();
	      String firstDate = comp.getFirstDate();
	      float result = 0;
	      if(!comp.getFundHistory().equals("1")) {
	      int diffMonth = getDiffDate(createDate, firstDate);
	      if(diffMonth <= 6) {
	         result = 10;
	      } else if (diffMonth <= 12) {
	         result = 8;
	      } else if (diffMonth <= 18) {
	         result = 6;
	      } else {
	         result = 4;
	      }
	      }
	      return result;
	}
	
	
	/*8번째 기준 */
	public float eighthCriteria(Company comp) {
	      Date curDate = new Date(); // 현재날짜
	      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	      String curDateStr = format.format(curDate);
	      String createDateStr = comp.getCreateDate();
	      int diffMonth = getDiffDate(curDateStr, createDateStr);
	      float result = 0;
	      if (diffMonth <= 6) {
	         result = 10;
	      } else if (diffMonth <= 12) {
	         result = 9;
	      } else if (diffMonth <= 18) {
	         result = 8;
	      } else if (diffMonth <= 24) {
	         result = 7;
	      } else if (diffMonth <= 30) {
	         result = 6;
	      } else if (diffMonth <= 36) {
	         result = 5;
	      } else if (diffMonth <= 42) {
	         result = 4;
	      } else if (diffMonth <= 48) {
	         result = 3;
	      } else if (diffMonth < 60) {
	         result = 2;
	      }
	      return result;
	}
	

	
	/* 회사별 뉴스기사 개수 확인을 위한 크롤링 */
	public ArrayList<Integer> ninethCriteria(Company company) {
		Date date = new Date();
		SimpleDateFormat year = new SimpleDateFormat("YYYY");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat day = new SimpleDateFormat("dd");
		Document document = null;
		int count = 0, point = 0, preStatus = 0;
		ArrayList<Integer> countList = new ArrayList<Integer>();
		String url = null;
		String startDate = null;
		String endDate = null;
		String todayDate = "." + month.format(date) + "." + day.format(date);
		
		String companyName = company.getName();
		String createDate = company.getCreateDate();
		
		
		// 설립된지 3년 이상된 기업 크롤링
		if(Integer.parseInt(year.format(date) + todayDate.replace(".", "")) - Integer.parseInt(createDate.replace("-", "")) > 30000) {
			for(int i = 3; i >= 1; i--) {
				startDate = (Integer.parseInt(year.format(date)) - i) + todayDate;
				endDate = (Integer.parseInt(year.format(date)) - i + 1) + todayDate;
				
				url = "https://search.naver.com/search.naver?where=news&query=\"" 
				    + companyName + "\"&ds=" + startDate + "&de=" + endDate 
				    + "&nso=so%3Ar%2Cp%3Afrom" + startDate.replace(".", "") + "to"
				    + endDate.replace(".", "") + "%2Ca%3Aall";
				try {
					document = Jsoup.connect(url).get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Elements elements = document.select(".title_desc span");
				String firstParse = elements.toString().split("/ ")[1].split("<")[0];
				count = Integer.parseInt(firstParse.substring(0, firstParse.length() - 1).replace(",", ""));
				countList.add(count);
				
				if(i == 2) {
					// 3년 전과 2년 전 비교
					if(countList.get(0) < countList.get(1)) {
						preStatus = 1;
					} else {
						preStatus = -1;
					}
				} else if (i == 1) {
					// 2년 전과 1년 전 비교
					if(countList.get(1) < countList.get(2)) {
						if(preStatus == 1) {
							point = 10;
						} else {
							point = 6;
						}
					} else {
						if(preStatus == 1) {
							point = 5;
						} else {
							point = 3;
						}
					}
					countList.add(point);
				}
			}
		} else {
			// 설립 3년 이하로 설립일부터 현재 날짜까지 뉴스 개수 크롤링
			url = "https://search.naver.com/search.naver?where=news&query=" 
			    + companyName + "&ds=" + createDate.replace("-", ".") + "&de=" 
				+ todayDate + "&nso=so%3Ar%2Cp%3Afrom" + createDate.replace("-", "") 
				+ "to" + todayDate.replace(".", "") + "%2Ca%3Aall";
			
			try {
				document = Jsoup.connect(url).get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Elements elements = document.select(".title_desc span");
			String firstParse = elements.toString().split("/ ")[1].split("<")[0];
			count = Integer.parseInt(firstParse.substring(0, firstParse.length() - 1).replace(",", ""));
			System.out.println("count : " + count);
	
			if(count != 0) {
				point = 4;
			}
			
			countList.add(point);
		}
		// 3년차 이상은 size 4, 3년차 이하는 size 2
		// 각 size의 마지막 인덱스는 평가 점수!
		return countList;
	}
	
	
	
	/* 년도 파싱하는 메서드 */
	public String getStringYear(String date){
		String[] token = date.split("-");
		return token[0];
	}
	
	public int getDiffDate(String start, String end){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		long calDateDays = 0;
		
		try {
			Date startDate = format.parse(start);
			Date endDate = format.parse(end);
			long calDate = endDate.getTime() - startDate.getTime();

			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를
			// 반환해준다.
			// 이제 30 * 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 월수가 나온다.
			calDateDays = calDate / (30 * 24 * 60 * 60 * 1000);

			calDateDays = Math.abs(calDateDays);

			System.out.println("두 날짜의 월수 날짜 차이: " + calDateDays);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (int)calDateDays;
	}
}
