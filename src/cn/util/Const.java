package cn.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class Const {
   
    public static final String ROOT="/professionHealth/";

    public static String getCurrentDay(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(new Date());
    }
    
    public static String getCurrentTime(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return sdf.format(new Date());
    }
    
    public static String getFileId(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	return sdf.format(new Date());
    }
    
    public static Map<String,String> results=new HashMap<String,String>();
    
    static{
    	results.put("D", "<h4>Dominance－支配型/控制者 </h4><p>描述性词语： 积级进取、争强好胜、强势、爱追根究底、直截了当、主动的开拓者、坚持意见、自信、直率 </p> <h6 style='color:#F00'>合适的职业：政治家、律师、法官、创业者、高级主管 </h6>");
    	results.put("I", "<h4>Influence－活泼型/社交者 </h4><p>描述性词语： 有影响力、有说服力、友好、善于言辞、健谈、乐观积极、善于交际 </p> <h6 style='color:#F00'>合适的职业：传媒工作者、广告宣传、设计师、公关、营销企划 </h6>");
    	results.put("S", "<h4>Steadiness－稳定型/支持者 </h4><p>描述性词语： 可靠、深思熟虑、亲切友好、有毅力、坚持不懈、善倾听者、全面周到、自制力强 </p> <h6 style='color:#F00'>合适的职业：老师、社工、接待、顾问、行政、秘书、会计师、公务人员 </h6>");
    	results.put("C", "<h4>Compliance－完美型/服从者 </h4><p>描述性词语： 遵从、仔细、有条不紊、严谨、准确、完美主义者、逻辑性强 </p> <h6 style='color:#F00'>合适的职业：艺术家、作家、导演、程式设计师、投资理财人员、学者、编辑 </h6>");
    }
}
