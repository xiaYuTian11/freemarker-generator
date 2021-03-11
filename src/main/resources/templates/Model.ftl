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

    private static final long serialVersionUID = ${serialVersionUID};

<#if model_column??>
    <#list model_column as model>
    /**
    *${model.columnComment!}
    */
<#if (model.primaryKey = true)>
    @TableId("${model.columnName}")
    private String ${model.changeColumnName?uncap_first};
<#else>
    @TableField("${model.columnName}")
    <#if (model.columnType = 'varchar' || model.columnType = 'text')>
    private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType = 'timestamp' >
    private Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType = 'smallint' || model.columnType = 'int2'>
    private Integer ${model.changeColumnName?uncap_first};
    </#if>
</#if>
    </#list>
</#if>

    @TableLogic
    @TableField(value = "is_delete", fill = FieldFill.INSERT)
    private Integer isDelete;
}
