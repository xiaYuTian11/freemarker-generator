package ${package_name};

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
* @author ${author}
* @date ${date}
*/
@Data
@TableName("${table_name_small}")
public class ${table_name} implements Serializable {

    private static final long serialVersionUID = 8459650260047931206L;

    @TableId
    private Long id;

<#if model_column??>
    <#list model_column as model>
    /**
    *${model.columnComment!}
    */
    @TableField("${model.columnName}")
<#if (model.columnType = 'varchar' || model.columnType = 'text')>
    private String ${model.changeColumnName?uncap_first};

</#if>
<#if model.columnType = 'timestamp' >
    private Date ${model.changeColumnName?uncap_first};
</#if>
<#if model.columnType = 'smallint' >
    private Integer ${model.changeColumnName?uncap_first};
</#if>
    </#list>
</#if>


    @TableField(value = "is_delete", fill = FieldFill.INSERT)
    private Integer isDelete;
}
