package top.tanmw.generator;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.io.*;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * @author TMW
 * @date 2021/2/26 9:01
 */
public class Test01 {
    private static  String TEMPLATE_PATH = "/src/main/resources/test";
    private static  String CLASS_PATH = "/src/test/java/top/tanmw/generator/create";

    @BeforeAll
    public static void init(){
        final String property = System.getProperty("user.dir");
        TEMPLATE_PATH = property + TEMPLATE_PATH;
        CLASS_PATH = property + CLASS_PATH;
    }

    @Test
    public void test01() {
        // step1 创建freeMarker配置实例
        Configuration configuration = new Configuration(new Version("2.3.30"));
        Writer out = null;
        try {
            // step2 获取模版路径
            // configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH));
            configuration.setClassForTemplateLoading(this.getClass(),"/test");
            // step3 创建数据模型
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("classPath", "top.tanmw.generator.create");
            dataMap.put("className", "AutoCodeDemo");
            dataMap.put("helloWorld", "通过简单的 <代码自动生产程序> 演示 FreeMarker的HelloWorld！");
            // step4 加载模版文件
            Template template = configuration.getTemplate("hello.ftl");
            // step5 生成数据
            File docFile = new File(CLASS_PATH + "\\" + "AutoCodeDemo.java");
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
            // step6 输出文件
            template.process(dataMap, out);
            System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^AutoCodeDemo.java 文件创建成功 !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != out) {
                    out.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

}
