#pragma once
#include <string>

#include <Core/EigenTypedef.h>

class Mesh;

namespace AttributeUtils {
    VectorF convert_to_vertex_attribute(
            Mesh& mesh, const VectorF& attribute);

    VectorF convert_to_vertex_attribute(
            Mesh& mesh, const std::string& attribute_name);

    VectorF convert_to_face_attribute(
            Mesh& mesh, const VectorF& attribute);

    VectorF convert_to_face_attribute(
            Mesh& mesh, const std::string& attribute_name);

    VectorF convert_to_voxel_attribute(
            Mesh& mesh, const VectorF& attribute);

    VectorF convert_to_voxel_attribute(
            Mesh& mesh, const std::string& attribute_name);
}
