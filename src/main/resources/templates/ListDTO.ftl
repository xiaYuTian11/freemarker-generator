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
public class ${table_name}ListDTO extends BasePageDTO {
    private static final long serialVersionUID = ${serialVersionUID};

}
