package ${package_name};

import ${dto_package_name}.${table_name}DTO;
import ${entity_package_name}.${table_name};
import ${vo_package_name}.${table_name}VO;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* @author ${author}
* @date ${date}
*/
@Mapper(componentModel = "spring")
public interface ${table_name}Converter {

    ${table_name}Converter INSTANCE = Mappers.getMapper(${table_name}Converter.class);

    @Mappings({})
    ${table_name} dto2Entity(${table_name}DTO dto);

    @Mappings({})
    ${table_name}VO entity2Vo(${table_name} entity);

}
