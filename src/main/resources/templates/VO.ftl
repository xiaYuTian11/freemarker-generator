package ${package_name};

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
* @author ${author}
* @date ${date}
*/
@Data
@EqualsAndHashCode(callSuper = true)
public class ${table_name}VO extends BaseVO {

    private static final long serialVersionUID = -3842211355647092752L;

<#if model_column??>
<#list model_column as model>
    /**
    *${model.columnComment!}
    */
    <#if (model.columnType = 'BIGINT' || model.columnType = 'int8')>
    private Long ${model.changeColumnName?uncap_first};
    </#if>
    <#if (model.columnType = 'varchar' || model.columnType = 'text')>
    private String ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType = 'timestamp' >
    private Date ${model.changeColumnName?uncap_first};
    </#if>
    <#if model.columnType = 'smallint' || model.columnType = 'int2'>
    private Integer ${model.changeColumnName?uncap_first};
    </#if>
</#list>
</#if>
}
