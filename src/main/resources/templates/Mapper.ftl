package ${package_name};

import com.zenith.core.base.BaseDao;
import ${entity_package_name}.${table_name};
import org.apache.ibatis.annotations.Mapper;

/**
* @author ${author}
* @date ${date}
*/
@Mapper
public interface ${table_name}Mapper extends BaseDao<${table_name}> {


}
