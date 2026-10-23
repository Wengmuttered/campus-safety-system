package com.campussafety.repository;

import com.campussafety.entity.MapLayerDefinition;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MapLayerDefinitionRepository extends JpaRepository<MapLayerDefinition, Long> {
    Optional<MapLayerDefinition> findByLayerKey(String layerKey);
}
