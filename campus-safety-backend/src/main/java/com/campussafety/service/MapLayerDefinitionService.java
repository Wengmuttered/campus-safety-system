package com.campussafety.service;

import com.campussafety.dto.MapLayerDefinitionDto;
import com.campussafety.dto.MapLayerUpdateRequest;
import com.campussafety.entity.MapLayerDefinition;
import com.campussafety.repository.MapLayerDefinitionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MapLayerDefinitionService {

    private final MapLayerDefinitionRepository repository;

    @Value("${tianditu.tk:}")
    private String tiandituTk;

    public List<MapLayerDefinitionDto> listForViewer() {
        return repository.findAll().stream()
                .filter(MapLayerDefinition::getEnabled)
                .sorted(Comparator.comparingInt(MapLayerDefinition::getZOrder))
                .map(this::toDto)
                .toList();
    }

    @Transactional
    public Optional<MapLayerDefinitionDto> patch(Long id, MapLayerUpdateRequest req) {
        return repository.findById(id).map(entity -> {
            if (req.getVisible() != null) {
                entity.setVisible(req.getVisible());
            }
            if (req.getOpacity() != null) {
                double o = req.getOpacity();
                entity.setOpacity(Math.max(0, Math.min(1, o)));
            }
            return toDto(repository.save(entity));
        });
    }

    private MapLayerDefinitionDto toDto(MapLayerDefinition e) {
        String url = e.getUrlTemplate() == null ? "" : e.getUrlTemplate().replace("__TK__", tiandituTk != null ? tiandituTk : "");
        return MapLayerDefinitionDto.builder()
                .id(e.getId())
                .layerKey(e.getLayerKey())
                .name(e.getName())
                .urlTemplate(url)
                .subdomains(e.getSubdomains())
                .minZoom(e.getMinZoom())
                .maxZoom(e.getMaxZoom())
                .zOrder(e.getZOrder())
                .defaultVisible(e.getDefaultVisible())
                .defaultOpacity(e.getDefaultOpacity())
                .enabled(e.getEnabled())
                .credit(e.getCredit())
                .visible(e.getVisible())
                .opacity(e.getOpacity())
                .build();
    }
}
