--
-- PostgreSQL database dump
--

\restrict YCPXArUjVHuZAwnxRFhKQCJQgIacPs2pjRyQdMSOPXt5jYq80kvHWyDvHVNuMIF

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.wc_species_detail DROP CONSTRAINT IF EXISTS wc_species_detail_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_species_detail DROP CONSTRAINT IF EXISTS wc_species_detail_catalog_species_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS wc_special_population_task_fk;
ALTER TABLE IF EXISTS ONLY public.wc_normalization_parameter DROP CONSTRAINT IF EXISTS wc_normalization_parameter_task_fk;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS wc_forest_resource_survey_raw_unit_fk;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS wc_forest_resource_survey_raw_task_fk;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS wc_forest_resource_survey_raw_source_fk;
ALTER TABLE IF EXISTS ONLY public.wc_fire_weather_month DROP CONSTRAINT IF EXISTS wc_fire_weather_month_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_weather_month DROP CONSTRAINT IF EXISTS wc_fire_weather_month_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_event DROP CONSTRAINT IF EXISTS wc_fire_use_event_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_event DROP CONSTRAINT IF EXISTS wc_fire_use_event_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_event DROP CONSTRAINT IF EXISTS wc_fire_use_event_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_category_dictionary DROP CONSTRAINT IF EXISTS wc_fire_use_category_dictionary_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_task_source DROP CONSTRAINT IF EXISTS wc_fire_task_source_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_task_source DROP CONSTRAINT IF EXISTS wc_fire_task_source_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_spatial_unit DROP CONSTRAINT IF EXISTS wc_fire_spatial_unit_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_spatial_unit DROP CONSTRAINT IF EXISTS wc_fire_spatial_unit_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_type_dictionary DROP CONSTRAINT IF EXISTS wc_fire_source_type_dictionary_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS wc_fire_source_point_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS wc_fire_source_point_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS wc_fire_source_point_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_rule_definition DROP CONSTRAINT IF EXISTS wc_fire_rule_definition_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_rule_definition DROP CONSTRAINT IF EXISTS wc_fire_rule_definition_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS wc_fire_result_layer_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS wc_fire_result_layer_output_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_quality_dictionary DROP CONSTRAINT IF EXISTS wc_fire_quality_dictionary_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS wc_fire_population_grid_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS wc_fire_population_grid_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS wc_fire_population_grid_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_input DROP CONSTRAINT IF EXISTS wc_fire_output_input_upstream_output_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_input DROP CONSTRAINT IF EXISTS wc_fire_output_input_output_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_input DROP CONSTRAINT IF EXISTS wc_fire_output_input_indicator_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS wc_fire_indicator_value_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS wc_fire_indicator_value_indicator_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_definition DROP CONSTRAINT IF EXISTS wc_fire_indicator_definition_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_level_dictionary DROP CONSTRAINT IF EXISTS wc_fire_history_level_dictionary_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS wc_fire_history_event_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS wc_fire_history_event_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS wc_fire_history_event_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_cause_dictionary DROP CONSTRAINT IF EXISTS wc_fire_history_cause_dictionary_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS wc_fire_fuel_unit_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS wc_fire_fuel_unit_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS wc_fire_fuel_unit_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS wc_fire_fuel_sample_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS wc_fire_fuel_sample_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS wc_fire_fuel_sample_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS wc_fire_forest_resource_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS wc_fire_forest_resource_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS wc_fire_forest_resource_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS wc_fire_economy_grid_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS wc_fire_economy_grid_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS wc_fire_economy_grid_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_equipment DROP CONSTRAINT IF EXISTS wc_fire_capacity_team_equipment_p03_attribute_dict_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_equipment DROP CONSTRAINT IF EXISTS wc_fire_capacity_team_equipme_task_id_configuration_rule_i_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_detail DROP CONSTRAINT IF EXISTS wc_fire_capacity_team_detail_task_id_configuration_rule_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS wc_fire_capacity_resource_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS wc_fire_capacity_resource_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS wc_fire_building_exposure_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS wc_fire_building_exposure_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_task_unit_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_task_id_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_source_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_source_batch_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_quality_code_fkey;
ALTER TABLE IF EXISTS ONLY public.wc_compartment_weather DROP CONSTRAINT IF EXISTS wc_compartment_weather_task_fk;
ALTER TABLE IF EXISTS ONLY public.wc_compartment_weather DROP CONSTRAINT IF EXISTS wc_compartment_weather_spatial_fk;
ALTER TABLE IF EXISTS ONLY public.wc_biomass_conversion_parameter DROP CONSTRAINT IF EXISTS wc_biomass_conversion_parameter_source_fk;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS fk_survey_raw_detail;
ALTER TABLE IF EXISTS ONLY public.wc_species_dictionary DROP CONSTRAINT IF EXISTS fk_species_dictionary_source;
ALTER TABLE IF EXISTS ONLY public.wc_species_detail DROP CONSTRAINT IF EXISTS fk_species_detail_parent;
ALTER TABLE IF EXISTS ONLY public.wc_species_combustibility DROP CONSTRAINT IF EXISTS fk_species_combustibility_source;
ALTER TABLE IF EXISTS ONLY public.wc_species_combustibility DROP CONSTRAINT IF EXISTS fk_species_combustibility_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS fk_special_population_town;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS fk_special_population_source;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS fk_special_population_quality;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS fk_special_population_batch;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS fk_r18_zone_parent;
ALTER TABLE IF EXISTS ONLY public.wc_forest_compartment DROP CONSTRAINT IF EXISTS fk_r15_unit;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS fk_r15_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS fk_r15_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_r15_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS fk_r15_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_forest_compartment DROP CONSTRAINT IF EXISTS fk_r15_task;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS fk_r15_species;
ALTER TABLE IF EXISTS ONLY public.wc_biomass_conversion_parameter DROP CONSTRAINT IF EXISTS fk_r15_species;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS fk_r15_source_batch;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS fk_r15_source_batch;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_r15_source_batch;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS fk_r15_source_batch;
ALTER TABLE IF EXISTS ONLY public.wc_forest_compartment DROP CONSTRAINT IF EXISTS fk_r15_source;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS fk_r15_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS fk_r15_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_r15_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS fk_r15_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_code_dictionary DROP CONSTRAINT IF EXISTS fk_r15_parent_code;
ALTER TABLE IF EXISTS ONLY public.wc_forest_compartment DROP CONSTRAINT IF EXISTS fk_r15_batch;
ALTER TABLE IF EXISTS ONLY public.wc_normalization_parameter DROP CONSTRAINT IF EXISTS fk_normalization_indicator;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS fk_indicator_value_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS fk_indicator_value_score_rule;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS fk_indicator_value_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS fk_indicator_value_parameter;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS fk_history_event_quality_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS fk_history_event_level_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS fk_history_event_cause_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS fk_fuel_unit_combustibility_mapping;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS fk_fuel_sample_task_plot;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS fk_fuel_sample_species_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_fuel_sample_plot_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_fuel_sample_plot_task;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_fuel_sample_plot_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS fk_fuel_sample_detail;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS fk_fuel_plot_task_parent;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_code_dictionary DROP CONSTRAINT IF EXISTS fk_fuel_code_dictionary_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS fk_forest_resource_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS fk_forest_resource_species_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS fk_forest_resource_detail;
ALTER TABLE IF EXISTS ONLY public.wc_fire_weather_month DROP CONSTRAINT IF EXISTS fk_fire_weather_month_quality_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_event DROP CONSTRAINT IF EXISTS fk_fire_use_event_category_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS fk_fire_source_point_type_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS fk_fire_source_point_quality_dictionary;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS fk_fire_result_upstream;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS fk_fire_result_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS fk_fire_result_task_rule;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_information_detail DROP CONSTRAINT IF EXISTS fk_f06_9_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_road_detail DROP CONSTRAINT IF EXISTS fk_f06_8_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warning_detail DROP CONSTRAINT IF EXISTS fk_f06_7_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_lookout_detail DROP CONSTRAINT IF EXISTS fk_f06_6_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_barrier_detail DROP CONSTRAINT IF EXISTS fk_f06_5_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_detail DROP CONSTRAINT IF EXISTS fk_f06_4_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_ranger_detail DROP CONSTRAINT IF EXISTS fk_f06_3_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_detail DROP CONSTRAINT IF EXISTS fk_f06_2_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_command_detail DROP CONSTRAINT IF EXISTS fk_f06_1_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_item DROP CONSTRAINT IF EXISTS fk_f06_13_owner;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_equipment DROP CONSTRAINT IF EXISTS fk_f06_12_owner;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_other_facility_detail DROP CONSTRAINT IF EXISTS fk_f06_11_header;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_communication_detail DROP CONSTRAINT IF EXISTS fk_f06_10_header;
ALTER TABLE IF EXISTS ONLY public.wc_compartment_weather DROP CONSTRAINT IF EXISTS fk_compartment_weather_source;
ALTER TABLE IF EXISTS ONLY public.wc_compartment_weather DROP CONSTRAINT IF EXISTS fk_compartment_weather_quality;
ALTER TABLE IF EXISTS ONLY public.wc_species_combustibility DROP CONSTRAINT IF EXISTS fk_combustibility_detail;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS fk_capacity_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS fk_capacity_task_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS fk_capacity_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS fk_building_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS fk_building_task_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_survey_raw DROP CONSTRAINT IF EXISTS fk_building_raw_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS fk_building_quality;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS fk_building_exposure_raw_source;
ALTER TABLE IF EXISTS ONLY public.wc_biomass_conversion_parameter DROP CONSTRAINT IF EXISTS fk_biomass_detail;
DROP TRIGGER IF EXISTS zz_wc_f06_adoption_snapshot ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_wc_special_population_prerequisites ON public.wc_special_population;
DROP TRIGGER IF EXISTS trg_wc_p03_county_parent ON public.wc_fire_spatial_unit;
DROP TRIGGER IF EXISTS trg_wc_normalization_parameter_prerequisites ON public.wc_normalization_parameter;
DROP TRIGGER IF EXISTS trg_wc_fire_rule_prerequisites ON public.wc_fire_rule_definition;
DROP TRIGGER IF EXISTS trg_wc_fire_result_prerequisites ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_wc_fire_indicator_value_prerequisites ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_wc_fire_indicator_rule_adoption ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_wc_fire_capacity_prerequisites ON public.wc_fire_capacity_resource;
DROP TRIGGER IF EXISTS trg_wc_fire_building_prerequisites ON public.wc_fire_building_exposure;
DROP TRIGGER IF EXISTS trg_wc_f06_header ON public.wc_fire_capacity_resource;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_warning_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_warehouse_item;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_warehouse_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_team_equipment;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_team_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_road_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_ranger_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_other_facility_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_lookout_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_information_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_communication_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_command_detail;
DROP TRIGGER IF EXISTS trg_wc_f06_detail ON public.wc_fire_capacity_barrier_detail;
DROP TRIGGER IF EXISTS trg_wc_biomass_model_contract ON public.wc_biomass_conversion_parameter;
DROP TRIGGER IF EXISTS trg_survey_raw_species_detail ON public.wc_forest_resource_survey_raw;
DROP TRIGGER IF EXISTS trg_species_detail_20_history ON public.wc_species_detail;
DROP TRIGGER IF EXISTS trg_species_detail_10_hierarchy ON public.wc_species_detail;
DROP TRIGGER IF EXISTS trg_r18_zoning_structure ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_r15_task_guard ON public.wc_fire_assessment_task;
DROP TRIGGER IF EXISTS trg_r15_source_guard ON public.wc_fire_task_source;
DROP TRIGGER IF EXISTS trg_r15_input_guard ON public.wc_fire_output_input;
DROP TRIGGER IF EXISTS trg_r15_indicator_delete ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_species_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_use_category_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_source_type_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_quality_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_history_level_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_history_cause_dictionary;
DROP TRIGGER IF EXISTS trg_r15_dictionary_guard ON public.wc_fire_fuel_code_dictionary;
DROP TRIGGER IF EXISTS trg_r15_definition_guard ON public.wc_fire_indicator_definition;
DROP TRIGGER IF EXISTS trg_r15_catalog_guard ON public.wc_fire_output_catalog;
DROP TRIGGER IF EXISTS trg_fuel_sample_species_detail ON public.wc_fire_fuel_sample;
DROP TRIGGER IF EXISTS trg_fuel_plot_parent_guard ON public.wc_fire_fuel_sample_plot;
DROP TRIGGER IF EXISTS trg_fuel_measurement_sample_restrict ON public.wc_fire_fuel_sample;
DROP TRIGGER IF EXISTS trg_fuel_measurement_sample_guard ON public.wc_fire_fuel_sample_plot;
DROP TRIGGER IF EXISTS trg_forest_resource_species_detail ON public.wc_fire_forest_resource;
DROP TRIGGER IF EXISTS trg_combustibility_species_detail ON public.wc_species_combustibility;
DROP TRIGGER IF EXISTS trg_biomass_species_detail ON public.wc_biomass_conversion_parameter;
DROP TRIGGER IF EXISTS trg_04_wc_p03_downstream_source ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_03_wc_p05_pair ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_03_wc_p05_capacity_source ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_03_wc_p03_rule_source ON public.wc_fire_rule_definition;
DROP TRIGGER IF EXISTS trg_02_wc_p03_value ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_02_wc_p03_resource_source ON public.wc_fire_capacity_resource;
DROP TRIGGER IF EXISTS trg_02_wc_p03_parameter ON public.wc_normalization_parameter;
DROP TRIGGER IF EXISTS trg_02_wc_p03_boundary_source ON public.wc_fire_spatial_unit;
DROP TRIGGER IF EXISTS trg_01_wc_local_parameter ON public.wc_normalization_parameter;
DROP TRIGGER IF EXISTS trg_01_wc_local_boundary ON public.wc_fire_spatial_unit;
DROP TRIGGER IF EXISTS trg_01_wc_local_adoption ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_01_composite_result_parent ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_01_composite_indicator_parent ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_00_special_risk_h_parent ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_00_special_risk_h_linkage ON public.wc_fire_result_layer;
DROP TRIGGER IF EXISTS trg_00_special_risk_h_linkage ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS trg_00_r18_indicator ON public.wc_fire_indicator_value;
DROP TRIGGER IF EXISTS ck_wc_f06_header_complete ON public.wc_fire_capacity_resource;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_warning_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_warehouse_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_team_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_road_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_ranger_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_other_facility_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_lookout_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_information_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_communication_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_command_detail;
DROP TRIGGER IF EXISTS ck_wc_f06_detail_complete ON public.wc_fire_capacity_barrier_detail;
DROP INDEX IF EXISTS public.uq_r15_output_input;
DROP INDEX IF EXISTS public.uq_normalization_task_indicator_version;
DROP INDEX IF EXISTS public.uq_fire_result_other_outputs;
DROP INDEX IF EXISTS public.uq_fire_result_hazard_run;
DROP INDEX IF EXISTS public.uq_combustibility_detail;
DROP INDEX IF EXISTS public.uq_combustibility_catalog_only;
DROP INDEX IF EXISTS public.ix_species_detail_parent;
DROP INDEX IF EXISTS public.ix_f06_13_owner;
DROP INDEX IF EXISTS public.ix_f06_12_owner;
DROP INDEX IF EXISTS public.idx_wc_forest_resource_survey_raw_task_unit;
DROP INDEX IF EXISTS public.idx_wc_forest_resource_survey_raw_geom;
DROP INDEX IF EXISTS public.idx_wc_fire_use_event_geom;
DROP INDEX IF EXISTS public.idx_wc_fire_spatial_unit_task_type;
DROP INDEX IF EXISTS public.idx_wc_fire_source_point_geom;
DROP INDEX IF EXISTS public.idx_wc_fire_result_layer_task_output;
DROP INDEX IF EXISTS public.idx_wc_fire_result_layer_geom;
DROP INDEX IF EXISTS public.idx_wc_fire_indicator_value_task_unit;
ALTER TABLE IF EXISTS ONLY public.wc_species_dictionary DROP CONSTRAINT IF EXISTS wc_species_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_species_detail DROP CONSTRAINT IF EXISTS wc_species_detail_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_species_combustibility DROP CONSTRAINT IF EXISTS wc_species_combustibility_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS wc_special_population_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_normalization_parameter DROP CONSTRAINT IF EXISTS wc_normalization_parameter_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_forest_resource_survey_raw DROP CONSTRAINT IF EXISTS wc_forest_resource_survey_raw_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_forest_compartment DROP CONSTRAINT IF EXISTS wc_forest_compartment_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_weather_month DROP CONSTRAINT IF EXISTS wc_fire_weather_month_task_id_weather_unit_id_stat_year_sta_key;
ALTER TABLE IF EXISTS ONLY public.wc_fire_weather_month DROP CONSTRAINT IF EXISTS wc_fire_weather_month_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_event DROP CONSTRAINT IF EXISTS wc_fire_use_event_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_use_category_dictionary DROP CONSTRAINT IF EXISTS wc_fire_use_category_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_task_source DROP CONSTRAINT IF EXISTS wc_fire_task_source_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_spatial_unit DROP CONSTRAINT IF EXISTS wc_fire_spatial_unit_task_id_unit_id_key;
ALTER TABLE IF EXISTS ONLY public.wc_fire_spatial_unit DROP CONSTRAINT IF EXISTS wc_fire_spatial_unit_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_type_dictionary DROP CONSTRAINT IF EXISTS wc_fire_source_type_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_registry DROP CONSTRAINT IF EXISTS wc_fire_source_registry_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_source_point DROP CONSTRAINT IF EXISTS wc_fire_source_point_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_rule_definition DROP CONSTRAINT IF EXISTS wc_fire_rule_definition_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS wc_fire_result_layer_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_quality_dictionary DROP CONSTRAINT IF EXISTS wc_fire_quality_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_population_grid DROP CONSTRAINT IF EXISTS wc_fire_population_grid_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_input DROP CONSTRAINT IF EXISTS wc_fire_output_input_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_catalog DROP CONSTRAINT IF EXISTS wc_fire_output_catalog_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_catalog DROP CONSTRAINT IF EXISTS wc_fire_output_catalog_output_name_key;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_value DROP CONSTRAINT IF EXISTS wc_fire_indicator_value_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_indicator_definition DROP CONSTRAINT IF EXISTS wc_fire_indicator_definition_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_level_dictionary DROP CONSTRAINT IF EXISTS wc_fire_history_level_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_event DROP CONSTRAINT IF EXISTS wc_fire_history_event_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_history_cause_dictionary DROP CONSTRAINT IF EXISTS wc_fire_history_cause_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS wc_fire_fuel_unit_task_id_unit_id_key;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_unit DROP CONSTRAINT IF EXISTS wc_fire_fuel_unit_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS wc_fire_fuel_sample_plot_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample DROP CONSTRAINT IF EXISTS wc_fire_fuel_sample_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_code_dictionary DROP CONSTRAINT IF EXISTS wc_fire_fuel_code_dictionary_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_forest_resource DROP CONSTRAINT IF EXISTS wc_fire_forest_resource_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_economy_grid DROP CONSTRAINT IF EXISTS wc_fire_economy_grid_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS wc_fire_capacity_resource_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_survey_raw DROP CONSTRAINT IF EXISTS wc_fire_building_survey_raw_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_exposure DROP CONSTRAINT IF EXISTS wc_fire_building_exposure_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_base_terrain DROP CONSTRAINT IF EXISTS wc_fire_base_terrain_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_fire_assessment_task DROP CONSTRAINT IF EXISTS wc_fire_assessment_task_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_compartment_weather DROP CONSTRAINT IF EXISTS wc_compartment_weather_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_biomass_conversion_parameter DROP CONSTRAINT IF EXISTS wc_biomass_conversion_parameter_pkey;
ALTER TABLE IF EXISTS ONLY public.wc_species_detail DROP CONSTRAINT IF EXISTS uq_species_detail_catalog_id;
ALTER TABLE IF EXISTS ONLY public.wc_special_population DROP CONSTRAINT IF EXISTS uq_special_population_delivery;
ALTER TABLE IF EXISTS ONLY public.wc_fire_output_input DROP CONSTRAINT IF EXISTS uq_r20_dependency_identity;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_code_dictionary DROP CONSTRAINT IF EXISTS uq_r15_fuel_code;
ALTER TABLE IF EXISTS ONLY public.wc_normalization_parameter DROP CONSTRAINT IF EXISTS uq_normalization_indicator_param;
ALTER TABLE IF EXISTS ONLY public.wc_fire_fuel_sample_plot DROP CONSTRAINT IF EXISTS uq_fuel_plot_task_plot;
ALTER TABLE IF EXISTS ONLY public.wc_fire_rule_definition DROP CONSTRAINT IF EXISTS uq_fire_rule_task_rule;
ALTER TABLE IF EXISTS ONLY public.wc_fire_result_layer DROP CONSTRAINT IF EXISTS uq_fire_result_task_id;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_information_detail DROP CONSTRAINT IF EXISTS uq_f06_9;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_road_detail DROP CONSTRAINT IF EXISTS uq_f06_8;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warning_detail DROP CONSTRAINT IF EXISTS uq_f06_7;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_lookout_detail DROP CONSTRAINT IF EXISTS uq_f06_6;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_barrier_detail DROP CONSTRAINT IF EXISTS uq_f06_5;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_detail DROP CONSTRAINT IF EXISTS uq_f06_4;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_ranger_detail DROP CONSTRAINT IF EXISTS uq_f06_3;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_detail DROP CONSTRAINT IF EXISTS uq_f06_2;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_item DROP CONSTRAINT IF EXISTS uq_f06_13_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_equipment DROP CONSTRAINT IF EXISTS uq_f06_12_source;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_other_facility_detail DROP CONSTRAINT IF EXISTS uq_f06_11;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_communication_detail DROP CONSTRAINT IF EXISTS uq_f06_10;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_command_detail DROP CONSTRAINT IF EXISTS uq_f06_1;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_resource DROP CONSTRAINT IF EXISTS uq_cap_f06_identity;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_survey_raw DROP CONSTRAINT IF EXISTS uq_building_raw_source_record;
ALTER TABLE IF EXISTS ONLY public.wc_fire_building_survey_raw DROP CONSTRAINT IF EXISTS uq_building_raw_lineage;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_information_detail DROP CONSTRAINT IF EXISTS pk_f06_9;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_road_detail DROP CONSTRAINT IF EXISTS pk_f06_8;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warning_detail DROP CONSTRAINT IF EXISTS pk_f06_7;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_lookout_detail DROP CONSTRAINT IF EXISTS pk_f06_6;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_barrier_detail DROP CONSTRAINT IF EXISTS pk_f06_5;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_detail DROP CONSTRAINT IF EXISTS pk_f06_4;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_ranger_detail DROP CONSTRAINT IF EXISTS pk_f06_3;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_detail DROP CONSTRAINT IF EXISTS pk_f06_2;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_warehouse_item DROP CONSTRAINT IF EXISTS pk_f06_13;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_team_equipment DROP CONSTRAINT IF EXISTS pk_f06_12;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_other_facility_detail DROP CONSTRAINT IF EXISTS pk_f06_11;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_communication_detail DROP CONSTRAINT IF EXISTS pk_f06_10;
ALTER TABLE IF EXISTS ONLY public.wc_fire_capacity_command_detail DROP CONSTRAINT IF EXISTS pk_f06_1;
ALTER TABLE IF EXISTS public.wc_species_combustibility ALTER COLUMN mapping_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.wc_special_population ALTER COLUMN pop_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.wc_normalization_parameter ALTER COLUMN param_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.wc_fire_output_input ALTER COLUMN mapping_id DROP DEFAULT;
DROP TABLE IF EXISTS public.wc_species_dictionary;
DROP TABLE IF EXISTS public.wc_species_detail;
DROP SEQUENCE IF EXISTS public.wc_species_combustibility_mapping_id_seq;
DROP TABLE IF EXISTS public.wc_species_combustibility;
DROP SEQUENCE IF EXISTS public.wc_special_population_pop_id_seq;
DROP TABLE IF EXISTS public.wc_special_population;
DROP SEQUENCE IF EXISTS public.wc_normalization_parameter_param_id_seq;
DROP TABLE IF EXISTS public.wc_forest_resource_survey_raw;
DROP TABLE IF EXISTS public.wc_forest_compartment;
DROP TABLE IF EXISTS public.wc_fire_weather_month;
DROP TABLE IF EXISTS public.wc_fire_use_event;
DROP TABLE IF EXISTS public.wc_fire_use_category_dictionary;
DROP TABLE IF EXISTS public.wc_fire_task_source;
DROP TABLE IF EXISTS public.wc_fire_source_type_dictionary;
DROP TABLE IF EXISTS public.wc_fire_source_point;
DROP TABLE IF EXISTS public.wc_fire_quality_dictionary;
DROP TABLE IF EXISTS public.wc_fire_population_grid;
DROP SEQUENCE IF EXISTS public.wc_fire_output_input_mapping_id_seq;
DROP TABLE IF EXISTS public.wc_fire_output_input;
DROP TABLE IF EXISTS public.wc_fire_output_catalog;
DROP TABLE IF EXISTS public.wc_fire_history_level_dictionary;
DROP TABLE IF EXISTS public.wc_fire_history_event;
DROP TABLE IF EXISTS public.wc_fire_history_cause_dictionary;
DROP TABLE IF EXISTS public.wc_fire_fuel_unit;
DROP TABLE IF EXISTS public.wc_fire_fuel_sample_plot;
DROP TABLE IF EXISTS public.wc_fire_fuel_sample;
DROP TABLE IF EXISTS public.wc_fire_fuel_code_dictionary;
DROP TABLE IF EXISTS public.wc_fire_forest_resource;
DROP TABLE IF EXISTS public.wc_fire_economy_grid;
DROP TABLE IF EXISTS public.wc_fire_capacity_warning_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_warehouse_item;
DROP TABLE IF EXISTS public.wc_fire_capacity_warehouse_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_team_equipment;
DROP TABLE IF EXISTS public.wc_fire_capacity_team_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_road_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_resource;
DROP TABLE IF EXISTS public.wc_fire_capacity_ranger_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_other_facility_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_lookout_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_information_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_communication_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_command_detail;
DROP TABLE IF EXISTS public.wc_fire_capacity_barrier_detail;
DROP TABLE IF EXISTS public.wc_fire_building_survey_raw;
DROP TABLE IF EXISTS public.wc_fire_building_exposure;
DROP TABLE IF EXISTS public.wc_fire_base_terrain;
DROP TABLE IF EXISTS public.wc_fire_assessment_task;
DROP TABLE IF EXISTS public.wc_compartment_weather;
DROP VIEW IF EXISTS public.vw_wc_fire_field_source_matrix;
DROP TABLE IF EXISTS public.wc_fire_source_registry;
DROP TABLE IF EXISTS public.wc_fire_indicator_definition;
DROP FUNCTION IF EXISTS public.fn_wc_species_detail_reference_guard();
DROP FUNCTION IF EXISTS public.fn_wc_species_detail_guard();
DROP FUNCTION IF EXISTS public.fn_wc_species_detail_assert(detail text, catalog text);
DROP FUNCTION IF EXISTS public.fn_wc_special_population_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_special_population_density(population_id bigint);
DROP FUNCTION IF EXISTS public.fn_wc_p05_pair_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p05_investment(r numeric, capacity_code text);
DROP FUNCTION IF EXISTS public.fn_wc_p05_capacity_source_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_weighted_score(s jsonb);
DROP FUNCTION IF EXISTS public.fn_wc_p03_value_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_township_inputs_validate(v public.wc_fire_indicator_value);
DROP FUNCTION IF EXISTS public.fn_wc_p03_source_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_score(code text, x numeric, area_class text);
DROP FUNCTION IF EXISTS public.fn_wc_p03_sample_validate(p public.wc_normalization_parameter);
DROP FUNCTION IF EXISTS public.fn_wc_p03_rule_source_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_raw_hash(v public.wc_fire_indicator_value);
DROP FUNCTION IF EXISTS public.fn_wc_p03_parameter_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_grade(x numeric, samples jsonb);
DROP FUNCTION IF EXISTS public.fn_wc_p03_downstream_source_guard();
DROP FUNCTION IF EXISTS public.fn_wc_p03_county_parent_guard();
DROP FUNCTION IF EXISTS public.fn_wc_normalization_source_refs(refs jsonb, adoption_task character varying, require_complete boolean);
DROP FUNCTION IF EXISTS public.fn_wc_normalization_parameter_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_normalization_adoption(parameter_id bigint, adoption_task character varying, indicator character varying, actual_unit character varying, actual_raw numeric, actual_normalized numeric, require_complete boolean);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_run(p_task text, p_unit text, p_period text, p_rule text, p_result text, p_batch text, p_on date);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_result_adoption(v public.wc_fire_result_layer);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_input_adoption(v public.wc_fire_indicator_value);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_evaluate(p_rule_id character varying, p_input jsonb);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_context(p_task text, p_unit text, p_rule text, p_on date, p_ready boolean);
DROP FUNCTION IF EXISTS public.fn_wc_lyt1063_2025_calculate(p_task text, p_unit text, p_period text, p_rule text, p_on date);
DROP FUNCTION IF EXISTS public.fn_wc_local_sample_validate(p public.wc_normalization_parameter);
DROP TABLE IF EXISTS public.wc_normalization_parameter;
DROP FUNCTION IF EXISTS public.fn_wc_local_raw_hash(v public.wc_fire_indicator_value);
DROP FUNCTION IF EXISTS public.fn_wc_local_parameter_guard();
DROP FUNCTION IF EXISTS public.fn_wc_local_boundary_hash(u public.wc_fire_spatial_unit);
DROP TABLE IF EXISTS public.wc_fire_spatial_unit;
DROP FUNCTION IF EXISTS public.fn_wc_local_boundary_guard();
DROP FUNCTION IF EXISTS public.fn_wc_local_adoption_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fuel_measurements_valid(details jsonb);
DROP FUNCTION IF EXISTS public.fn_wc_fuel_measurement_sample_restrict();
DROP FUNCTION IF EXISTS public.fn_wc_fuel_measurement_sample_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_weather_composition(adoption_task character varying, target_unit character varying, weather_ids text[], adoption_rule character varying, calculated_on date);
DROP FUNCTION IF EXISTS public.fn_wc_fire_task_source_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_task_history_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_special_risk_h_reference(p_task_id text, p_unit_id text, p_period_key text, p_refs jsonb, p_require_formal boolean, p_geom public.geometry);
DROP FUNCTION IF EXISTS public.fn_wc_fire_special_risk_h_parent_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_special_risk_h_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_spatial_index_adoption(result_record public.wc_fire_result_layer, rule_record public.wc_fire_rule_definition);
DROP TABLE IF EXISTS public.wc_fire_rule_definition;
DROP FUNCTION IF EXISTS public.fn_wc_fire_source_record(ref jsonb, adoption_task text);
DROP FUNCTION IF EXISTS public.fn_wc_fire_rule_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_fire_result_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_fire_result_date(value_text text);
DROP FUNCTION IF EXISTS public.fn_wc_fire_receipt_assert(receipt jsonb);
DROP FUNCTION IF EXISTS public.fn_wc_fire_r18_zoning_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_r18_indicator_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_output_input_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_indicator_value_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_fire_indicator_rule_adoption();
DROP FUNCTION IF EXISTS public.fn_wc_fire_indicator_history_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_fuel_plot_parent_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_direct_adoption(v public.wc_fire_indicator_value);
DROP TABLE IF EXISTS public.wc_fire_indicator_value;
DROP FUNCTION IF EXISTS public.fn_wc_fire_dictionary_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_composite_parent_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_composite_linkage(a public.wc_fire_result_layer);
DROP TABLE IF EXISTS public.wc_fire_result_layer;
DROP FUNCTION IF EXISTS public.fn_wc_fire_catalog_guard();
DROP FUNCTION IF EXISTS public.fn_wc_fire_capacity_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_fire_building_prerequisites();
DROP FUNCTION IF EXISTS public.fn_wc_fire_batch_adoption(adoption_task text, source text, batch text);
DROP FUNCTION IF EXISTS public.fn_wc_f06_source_hash(id text);
DROP FUNCTION IF EXISTS public.fn_wc_f06_header_guard();
DROP FUNCTION IF EXISTS public.fn_wc_f06_detail_table(form_code text);
DROP FUNCTION IF EXISTS public.fn_wc_f06_detail_guard();
DROP FUNCTION IF EXISTS public.fn_wc_f06_complete_guard();
DROP FUNCTION IF EXISTS public.fn_wc_f06_adoption_snapshot();
DROP FUNCTION IF EXISTS public.fn_wc_biomass_wenchang_parameter(p_species_code character varying, p_dbh_cm numeric);
DROP TABLE IF EXISTS public.wc_biomass_conversion_parameter;
DROP FUNCTION IF EXISTS public.fn_wc_biomass_model_contract_guard();
DROP EXTENSION IF EXISTS postgis;
--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: fn_wc_biomass_model_contract_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_biomass_model_contract_guard() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'pg_catalog', 'public'
    AS $_$
DECLARE j jsonb; st text; expected_name text; lo numeric; hi numeric;
BEGIN
 j:=NEW.model_contract_json;
 IF j IS NULL THEN RETURN NEW; END IF;
 IF jsonb_typeof(j)<>'object' OR j->>'contract_version' IS DISTINCT FROM 'WC_BIOMASS_V1'
    OR j->>'standard_no' IS DISTINCT FROM 'GB/T 43648-2024' THEN
   RAISE EXCEPTION 'BIOMASS_CONTRACT: unsupported or incomplete model contract';
 END IF;
 SELECT species_name_cn INTO expected_name FROM public.wc_species_dictionary
 WHERE species_code=NEW.species_code AND status='ACTIVE';
 IF expected_name IS NULL OR expected_name IS DISTINCT FROM j->>'standard_species_name' THEN
   RAISE EXCEPTION 'BIOMASS_SPECIES: model and confirmed catalog species do not match';
 END IF;
 st:=j#>>'{local_applicability,status}';
 IF st IS NULL OR st NOT IN ('CONDITIONAL','APPROVED_UNIVARIATE','PENDING_SCALE')
 OR j#>>'{local_applicability,province}' IS DISTINCT FROM '海南省'
 OR j#>'{local_applicability,scales}' IS DISTINCT FROM '["COUNTY","TOWNSHIP"]'::jsonb
 OR NEW.component_type IS DISTINCT FROM 'ABOVEGROUND_LIVE'
 OR NEW.unit_out IS DISTINCT FROM 'kg/tree'
 OR j#>>'{output,component}' IS DISTINCT FROM 'ABOVEGROUND_LIVE'
 OR j#>>'{output,basis}' IS DISTINCT FROM 'SINGLE_TREE'
 OR j#>>'{output,unit}' IS DISTINCT FROM 'kg'
 OR j#>>'{input_variables,D,unit}' IS DISTINCT FROM 'cm' THEN
   RAISE EXCEPTION 'BIOMASS_CONTRACT: invalid local status, component, input or output';
 END IF;
 IF NEW.source_code IS DISTINCT FROM 'SRC_GBT_43648_2024'
 OR coalesce(j->>'source_sha256','')!~'^[0-9a-f]{64}$'
 OR NEW.source_document IS NULL OR NEW.applicable_condition IS NULL OR NEW.applicable_region IS NULL
 OR j->>'source_table' IS NULL OR j->>'source_row' IS NULL OR j->>'source_pdf_page' IS NULL
 OR jsonb_typeof(j#>'{dbh,min_inclusive}') IS DISTINCT FROM 'boolean'
 OR jsonb_typeof(j#>'{dbh,max_inclusive}') IS DISTINCT FROM 'boolean'
 OR j#>'{dbh,max_cm}' IS NULL THEN
   RAISE EXCEPTION 'BIOMASS_EVIDENCE: missing source or diameter boundary';
 END IF;
 lo:=(j#>>'{dbh,min_cm}')::numeric; hi:=(j#>>'{dbh,max_cm}')::numeric;
 IF lo IS NULL OR lo<0 OR lo IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
 OR (hi IS NOT NULL AND (hi<=lo OR hi IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)))
 OR NEW.parameter_a IS NULL OR NEW.parameter_b IS NULL OR NEW.parameter_a<=0 OR NEW.parameter_b<=0 THEN
   RAISE EXCEPTION 'BIOMASS_RANGE: invalid diameter range or coefficients';
 END IF;
 IF st='CONDITIONAL' THEN
  IF NEW.equation_type IS DISTINCT FROM 'POWER_DBH_HEIGHT' OR NEW.parameter_c IS NULL
  OR NEW.unit_in IS DISTINCT FROM 'D:cm;h:m'
  OR j#>>'{input_variables,h,unit}' IS DISTINCT FROM 'm'
  OR j->>'formula_expression' IS DISTINCT FROM 'MA = a * D^b * h^c' THEN
   RAISE EXCEPTION 'BIOMASS_SCALE: local eligible model must be the documented two-variable model';
  END IF;
 ELSIF st='APPROVED_UNIVARIATE' THEN
  IF NEW.equation_type IS DISTINCT FROM 'POWER_DBH' OR NEW.parameter_c IS NOT NULL
  OR NEW.unit_in IS DISTINCT FROM 'D:cm'
  OR j->>'formula_expression' IS DISTINCT FROM 'MA = a * D^b' THEN
   RAISE EXCEPTION 'BIOMASS_UNIVARIATE: approved one-variable model contract is inconsistent';
  END IF;
 ELSE
  IF NEW.equation_type IS DISTINCT FROM 'POWER_DBH' OR NEW.parameter_c IS NOT NULL
  OR NEW.unit_in IS DISTINCT FROM 'D:cm'
  OR j->>'formula_expression' IS DISTINCT FROM 'MA = a * D^b' THEN
   RAISE EXCEPTION 'BIOMASS_PENDING: pending one-variable model contract is inconsistent';
  END IF;
 END IF;
 RETURN NEW;
END $_$;


ALTER FUNCTION public.fn_wc_biomass_model_contract_guard() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: wc_biomass_conversion_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_biomass_conversion_parameter (
    parameter_id character varying(80) NOT NULL,
    species_code character varying(60),
    forest_type_code character varying(60),
    component_type character varying(30) NOT NULL,
    equation_type character varying(30) NOT NULL,
    parameter_a numeric(24,10),
    parameter_b numeric(24,10),
    parameter_c numeric(24,10),
    conversion_factor numeric(24,10),
    unit_in character varying(40),
    unit_out character varying(40),
    applicable_region character varying(120),
    valid_from date,
    valid_to date,
    source_code character varying(60),
    source_document character varying(300),
    applicable_condition text,
    note text,
    species_detail_id character varying(80),
    model_contract_json jsonb,
    CONSTRAINT ck_biomass_detail_catalog CHECK (((species_detail_id IS NULL) OR (species_code IS NOT NULL))),
    CONSTRAINT ck_biomass_model_contract_object CHECK (((model_contract_json IS NULL) OR (jsonb_typeof(model_contract_json) = 'object'::text))),
    CONSTRAINT ck_biomass_model_text_nonblank CHECK ((((component_type)::text ~ '[^[:space:]]'::text) AND ((equation_type)::text ~ '[^[:space:]]'::text) AND ((unit_in IS NULL) OR ((unit_in)::text ~ '[^[:space:]]'::text)) AND ((unit_out IS NULL) OR ((unit_out)::text ~ '[^[:space:]]'::text)) AND ((applicable_region IS NULL) OR ((applicable_region)::text ~ '[^[:space:]]'::text)) AND ((source_document IS NULL) OR ((source_document)::text ~ '[^[:space:]]'::text)) AND ((applicable_condition IS NULL) OR (applicable_condition ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_finite CHECK ((((parameter_a IS NULL) OR (parameter_a <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((parameter_b IS NULL) OR (parameter_b <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((parameter_c IS NULL) OR (parameter_c <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((conversion_factor IS NULL) OR (conversion_factor <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_r15_identity_text CHECK ((((parameter_id IS NULL) OR ((parameter_id)::text ~ '[^[:space:]]'::text)) AND ((species_code IS NULL) OR ((species_code)::text ~ '[^[:space:]]'::text)) AND ((forest_type_code IS NULL) OR ((forest_type_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_biomass_conversion_parameter_date_ck CHECK (((valid_to IS NULL) OR (valid_from IS NULL) OR (valid_to >= valid_from)))
);


ALTER TABLE public.wc_biomass_conversion_parameter OWNER TO postgres;

--
-- Name: TABLE wc_biomass_conversion_parameter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_biomass_conversion_parameter IS '生物量换算参数表';


--
-- Name: COLUMN wc_biomass_conversion_parameter.parameter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.parameter_id IS '生物量参数记录编号';


--
-- Name: COLUMN wc_biomass_conversion_parameter.species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.species_code IS '树种代码';


--
-- Name: COLUMN wc_biomass_conversion_parameter.forest_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.forest_type_code IS '林型代码';


--
-- Name: COLUMN wc_biomass_conversion_parameter.component_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.component_type IS '生物量组成类型';


--
-- Name: COLUMN wc_biomass_conversion_parameter.equation_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.equation_type IS '生物量模型类型';


--
-- Name: COLUMN wc_biomass_conversion_parameter.parameter_a; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.parameter_a IS '模型参数a';


--
-- Name: COLUMN wc_biomass_conversion_parameter.parameter_b; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.parameter_b IS '模型参数b';


--
-- Name: COLUMN wc_biomass_conversion_parameter.parameter_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.parameter_c IS '模型参数c';


--
-- Name: COLUMN wc_biomass_conversion_parameter.conversion_factor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.conversion_factor IS '转换系数';


--
-- Name: COLUMN wc_biomass_conversion_parameter.unit_in; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.unit_in IS '模型输入单位';


--
-- Name: COLUMN wc_biomass_conversion_parameter.unit_out; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.unit_out IS '模型输出单位';


--
-- Name: COLUMN wc_biomass_conversion_parameter.applicable_region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.applicable_region IS '适用地区';


--
-- Name: COLUMN wc_biomass_conversion_parameter.valid_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.valid_from IS '适用起始日期';


--
-- Name: COLUMN wc_biomass_conversion_parameter.valid_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.valid_to IS '适用结束日期';


--
-- Name: COLUMN wc_biomass_conversion_parameter.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_biomass_conversion_parameter.source_document; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.source_document IS '原始文件定位';


--
-- Name: COLUMN wc_biomass_conversion_parameter.applicable_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.applicable_condition IS '适用条件';


--
-- Name: COLUMN wc_biomass_conversion_parameter.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.note IS '备注';


--
-- Name: COLUMN wc_biomass_conversion_parameter.species_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.species_detail_id IS '树种细分记录编号';


--
-- Name: COLUMN wc_biomass_conversion_parameter.model_contract_json; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_biomass_conversion_parameter.model_contract_json IS '模型公式、输入输出、树种、胸径分档、地区尺度与采用状态的结构化约定；NULL表示未登记此约定，不自动具备文昌取参资格。';


--
-- Name: fn_wc_biomass_wenchang_parameter(character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_biomass_wenchang_parameter(p_species_code character varying, p_dbh_cm numeric) RETURNS public.wc_biomass_conversion_parameter
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE ids text[]; result public.wc_biomass_conversion_parameter;
BEGIN
 IF p_species_code IS NULL OR btrim(p_species_code)='' THEN
   RAISE EXCEPTION 'BIOMASS_INPUT: confirmed project species code is required';
 END IF;
 IF p_dbh_cm IS NULL OR p_dbh_cm<=0 OR p_dbh_cm IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN
   RAISE EXCEPTION 'BIOMASS_INPUT: diameter must be a finite positive number in cm';
 END IF;
 SELECT array_agg(p.parameter_id::text ORDER BY p.parameter_id) INTO ids
 FROM public.wc_biomass_conversion_parameter p
 JOIN public.wc_species_dictionary d ON d.species_code=p.species_code AND d.status='ACTIVE'
 JOIN public.wc_fire_source_registry s ON s.source_code=p.source_code AND s.evidence_status='VERIFIED_PUBLIC'
 WHERE p.species_code=p_species_code
 AND p.species_detail_id IS NULL
 AND p.model_contract_json->>'contract_version'='WC_BIOMASS_V1'
 AND p.model_contract_json#>>'{local_applicability,province}'='海南省'
 AND CASE WHEN (p.model_contract_json#>>'{dbh,min_inclusive}')::boolean
          THEN p_dbh_cm >= (p.model_contract_json#>>'{dbh,min_cm}')::numeric
          ELSE p_dbh_cm > (p.model_contract_json#>>'{dbh,min_cm}')::numeric END
 AND CASE WHEN p.model_contract_json#>>'{dbh,max_cm}' IS NULL THEN true
          WHEN (p.model_contract_json#>>'{dbh,max_inclusive}')::boolean
          THEN p_dbh_cm <= (p.model_contract_json#>>'{dbh,max_cm}')::numeric
          ELSE p_dbh_cm < (p.model_contract_json#>>'{dbh,max_cm}')::numeric END;
 IF coalesce(cardinality(ids),0)=0 THEN
   RAISE EXCEPTION 'BIOMASS_NO_MODEL: no registered applicable model for this species and diameter';
 END IF;
 IF cardinality(ids)<>1 THEN
   RAISE EXCEPTION 'BIOMASS_AMBIGUOUS: multiple models match; select and verify the adopted model version';
 END IF;
 SELECT p.* INTO STRICT result FROM public.wc_biomass_conversion_parameter p WHERE p.parameter_id=ids[1];
 IF result.model_contract_json#>>'{local_applicability,status}' NOT IN ('CONDITIONAL', 'APPROVED_UNIVARIATE') THEN
   RAISE EXCEPTION 'BIOMASS_PENDING_SCALE: this model is registered for reference; county/township applicability is pending';
 END IF;
 RETURN result;
END $$;


ALTER FUNCTION public.fn_wc_biomass_wenchang_parameter(p_species_code character varying, p_dbh_cm numeric) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_biomass_wenchang_parameter(p_species_code character varying, p_dbh_cm numeric); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_biomass_wenchang_parameter(p_species_code character varying, p_dbh_cm numeric) IS '文昌县乡范围的参数查询：输入已确认的项目树种代码和胸径厘米；唯一匹配且适用状态通过才返回。不是原始代码自动映射、树种清单确认、地块推算或生物量自动计算。';


--
-- Name: fn_wc_f06_adoption_snapshot(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_adoption_snapshot() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $$
DECLARE id text; h text; snaps jsonb:='[]';
BEGIN
 IF NEW.value_status='VALID' AND NEW.indicator_code IN ('P11','P12','P13','P14','P15','P21','P22','P23','P31','P32','P33','P41','P42') THEN
  FOR id IN SELECT jsonb_array_elements_text(NEW.input_refs#>'{p03,resource_ids}') LOOP
   h:=fn_wc_f06_source_hash(id);
   IF h IS NOT NULL THEN snaps:=snaps||jsonb_build_array(jsonb_build_object('capacity_id',id,'source_hash',h,'schema_version','WC_F06_DETAIL_20261020'));END IF;
  END LOOP;
  NEW.input_refs:=jsonb_set(NEW.input_refs,'{f06_detail_snapshot}',snaps,true);
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_f06_adoption_snapshot() OWNER TO postgres;

--
-- Name: fn_wc_f06_complete_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_complete_guard() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $_$
DECLARE j jsonb; id text; r wc_fire_capacity_resource%ROWTYPE; d jsonb; t text; u text;
BEGIN
 j:=CASE WHEN TG_OP='DELETE' THEN to_jsonb(OLD) ELSE to_jsonb(NEW) END;id:=j->>'capacity_id';
 SELECT * INTO r FROM wc_fire_capacity_resource WHERE capacity_id=id;
 IF NOT FOUND OR r.survey_form_code IS NULL OR r.record_status<>'VALID' THEN RETURN NULL;END IF;
 t:=fn_wc_f06_detail_table(r.survey_form_code);
 EXECUTE format('SELECT to_jsonb(d) FROM %I d WHERE capacity_id=$1 AND task_id=$2 AND period_key=$3',t) INTO d USING id,r.task_id,r.period_key;
 IF d IS NULL OR d->>'as_of_date' IS NULL OR r.unit_id IS NULL THEN
  RAISE EXCEPTION 'F06_COMPLETE: 有效台账必须有对应唯一明细、统计时点和空间单元' USING ERRCODE='23514';END IF;
 SELECT unit_type INTO u FROM wc_fire_spatial_unit WHERE task_id=r.task_id AND unit_id=r.unit_id;
 IF r.survey_form_code='A.3' AND (u<>'TOWNSHIP' OR r.resource_attributes->>'record_scope' IS DISTINCT FROM 'UNIT_STATISTIC') THEN
  RAISE EXCEPTION 'F06_SCOPE: 护林员原表每行是乡镇统计，不能挂县级总量冒充乡镇行' USING ERRCODE='23514';END IF;
 IF r.survey_form_code='A.6' THEN
  IF d->>'record_kind'='AREA_SUMMARY' AND (u<>'TOWNSHIP' OR r.resource_attributes->>'record_scope' IS DISTINCT FROM 'UNIT_STATISTIC'
   OR d->>'effective_coverage_ha' IS NULL OR d->>'coverage_scope_ref' IS NULL) THEN
   RAISE EXCEPTION 'F06_SCOPE: 总体覆盖须单独的乡镇统计记录及有效覆盖范围依据' USING ERRCODE='23514';END IF;
  IF d->>'record_kind'='FACILITY' AND r.resource_attributes->>'record_scope' IS DISTINCT FROM 'RESOURCE' THEN
   RAISE EXCEPTION 'F06_SCOPE: 单设施记录不得冒充乡镇覆盖汇总' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NULL;
END $_$;


ALTER FUNCTION public.fn_wc_f06_complete_guard() OWNER TO postgres;

--
-- Name: fn_wc_f06_detail_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_detail_guard() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $$
DECLARE j jsonb; oldj jsonb; tid text; id text; owner_field text; dict wc_fire_fuel_code_dictionary%ROWTYPE;
 r wc_fire_capacity_resource%ROWTYPE;
BEGIN
 j:=CASE WHEN TG_OP='DELETE' THEN to_jsonb(OLD) ELSE to_jsonb(NEW) END;
 owner_field:=CASE TG_TABLE_NAME WHEN 'wc_fire_capacity_team_equipment' THEN 'team_capacity_id'
 WHEN 'wc_fire_capacity_warehouse_item' THEN 'warehouse_capacity_id' ELSE 'capacity_id' END;
 tid:=j->>'task_id';id:=j->>owner_field;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=tid FOR UPDATE;
 SELECT * INTO r FROM wc_fire_capacity_resource WHERE task_id=tid AND capacity_id=id FOR UPDATE;
 IF (EXISTS(SELECT 1 FROM wc_fire_indicator_value v WHERE v.task_id=tid AND v.value_status='VALID'
  AND v.input_refs#>'{p03,resource_ids}' ? id) OR EXISTS(SELECT 1 FROM wc_fire_indicator_value v JOIN wc_normalization_parameter p
   ON p.task_id=v.task_id AND p.indicator_code=v.indicator_code
   AND p.source_refs#>>'{sample_set,period_key}'=v.period_key
   WHERE v.task_id=tid AND v.indicator_code IN('P14','P15') AND p.approval_status='APPROVED'
    AND v.input_refs#>'{p03,resource_ids}' ? id
    AND EXISTS(SELECT 1 FROM jsonb_array_elements(p.source_refs#>'{sample_set,members}') e WHERE e->>'unit_id'=v.unit_id))) THEN
  IF TG_OP<>'UPDATE' OR to_jsonb(NEW) IS DISTINCT FROM to_jsonb(OLD) THEN
   RAISE EXCEPTION 'F06_SOURCE: 明细所属台账已被有效P03计算采用，不可新增、改写或删除明细' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF TG_OP='UPDATE' THEN
  oldj:=to_jsonb(OLD);
  IF j->>'task_id' IS DISTINCT FROM oldj->>'task_id' OR j->>'period_key' IS DISTINCT FROM oldj->>'period_key'
   OR j->>owner_field IS DISTINCT FROM oldj->>owner_field
   OR j->>'detail_id' IS DISTINCT FROM oldj->>'detail_id' THEN
   RAISE EXCEPTION 'F06_IDENTITY: 明细任务、所属对象、期间及主键不得原位换挂' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_TABLE_NAME='wc_fire_capacity_team_equipment' AND j->>'p03_attribute_dict_id' IS NOT NULL THEN
  SELECT * INTO dict FROM wc_fire_fuel_code_dictionary WHERE dictionary_id=j->>'p03_attribute_dict_id';
  IF NOT FOUND OR dict.dict_type<>'CAP_P03_ATTRIBUTE' OR dict.dict_code NOT LIKE 'P03_EQUIP_%' THEN
   RAISE EXCEPTION 'F06_MAPPING: P23设备映射必须引用P03设备属性字典，不能引用任意分类' USING ERRCODE='23514';END IF;
 END IF;
 IF j ? 'configuration_item_ref' AND ((j->>'configuration_item_ref' IS NULL)<>(j->>'configuration_rule_id' IS NULL)) THEN
  RAISE EXCEPTION 'F06_TARGET: 实际配置目标规则与具体条目定位须同时填写' USING ERRCODE='23514';END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_f06_detail_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_f06_detail_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_f06_detail_guard() IS 'F06所属关系、P23分类映射及已被有效P03计算采用的原始明细保护';


--
-- Name: fn_wc_f06_detail_table(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_detail_table(form_code text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
 SELECT CASE form_code
 WHEN 'A.1' THEN 'wc_fire_capacity_command_detail' WHEN 'A.2' THEN 'wc_fire_capacity_team_detail'
 WHEN 'A.3' THEN 'wc_fire_capacity_ranger_detail' WHEN 'A.4' THEN 'wc_fire_capacity_warehouse_detail'
 WHEN 'A.5' THEN 'wc_fire_capacity_barrier_detail' WHEN 'A.6' THEN 'wc_fire_capacity_lookout_detail'
 WHEN 'A.7' THEN 'wc_fire_capacity_warning_detail' WHEN 'A.8' THEN 'wc_fire_capacity_road_detail'
 WHEN 'A.9' THEN 'wc_fire_capacity_information_detail' WHEN 'A.10' THEN 'wc_fire_capacity_communication_detail'
 WHEN 'A.11' THEN 'wc_fire_capacity_other_facility_detail' END
$$;


ALTER FUNCTION public.fn_wc_f06_detail_table(form_code text) OWNER TO postgres;

--
-- Name: fn_wc_f06_header_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_header_guard() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $$
BEGIN
 IF NEW.survey_form_code IS NOT NULL THEN
  IF NEW.period_key IS NULL OR btrim(NEW.period_key)='' THEN RAISE EXCEPTION 'F06_IDENTITY: 采用调查表式必须同时填写统计期间' USING ERRCODE='23514';END IF;
  IF NEW.resource_attributes#>>'{p03,period_key}' IS NOT NULL
   AND NEW.resource_attributes#>>'{p03,period_key}' IS DISTINCT FROM NEW.period_key THEN
   RAISE EXCEPTION 'F06_PERIOD: 总表期间与既有P03采用期间不一致' USING ERRCODE='23514';END IF;
  IF NEW.geom IS NOT NULL AND NEW.survey_form_code IN ('A.5','A.8') AND GeometryType(NEW.geom) NOT IN ('LINESTRING','MULTILINESTRING') THEN
   RAISE EXCEPTION 'F06_GEOMETRY: 道路、阻隔设施需要线几何' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_f06_header_guard() OWNER TO postgres;

--
-- Name: fn_wc_f06_source_hash(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_f06_source_hash(id text) RETURNS text
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $_$
DECLARE r wc_fire_capacity_resource%ROWTYPE; d jsonb; children jsonb:='[]'; t text;
BEGIN
 SELECT * INTO r FROM wc_fire_capacity_resource WHERE capacity_id=id;
 IF NOT FOUND OR r.survey_form_code IS NULL THEN RETURN NULL; END IF;
 t:=fn_wc_f06_detail_table(r.survey_form_code);
 EXECUTE format('SELECT to_jsonb(d) FROM %I d WHERE capacity_id=$1',t) INTO d USING id;
 IF d IS NULL THEN RAISE EXCEPTION 'F06_SOURCE: 缺少对应表式明细' USING ERRCODE='23514';END IF;
 IF r.survey_form_code='A.2' THEN
  SELECT coalesce(jsonb_agg(to_jsonb(e) ORDER BY detail_id),'[]') INTO children FROM wc_fire_capacity_team_equipment e WHERE team_capacity_id=id;
 ELSIF r.survey_form_code='A.4' THEN
  SELECT coalesce(jsonb_agg(to_jsonb(e) ORDER BY detail_id),'[]') INTO children FROM wc_fire_capacity_warehouse_item e WHERE warehouse_capacity_id=id;
 END IF;
 RETURN md5(jsonb_build_object('header',to_jsonb(r),'detail',d,'children',children)::text);
END $_$;


ALTER FUNCTION public.fn_wc_f06_source_hash(id text) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_f06_source_hash(id text); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_f06_source_hash(id text) IS 'F06总表、对应明细及下属装备/物资的整体采用快照；按明细主键排序';


--
-- Name: fn_wc_fire_batch_adoption(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_batch_adoption(adoption_task text, source text, batch text) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE row_data jsonb;
BEGIN
 SELECT to_jsonb(t) INTO row_data FROM public.wc_fire_task_source t WHERE task_id=adoption_task AND source_code=source AND source_batch=batch;
 IF NOT FOUND THEN RAISE EXCEPTION '来源批次未关联任务' USING ERRCODE='23503';END IF;
 PERFORM public.fn_wc_fire_receipt_assert(row_data);RETURN row_data;
END $$;


ALTER FUNCTION public.fn_wc_fire_batch_adoption(adoption_task text, source text, batch text) OWNER TO postgres;

--
-- Name: fn_wc_fire_building_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_building_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
 u public.wc_fire_spatial_unit%ROWTYPE;
 batch public.wc_fire_task_source%ROWTYPE;
 qstatus text; refs jsonb; part record; env jsonb; ref jsonb; k text;
 applied date; forest_id jsonb; method text; metadata jsonb; self_ref boolean;
BEGIN
 IF (NEW.spatial_relation_refs IS NOT NULL AND jsonb_typeof(NEW.spatial_relation_refs)<>'object')
    OR (NEW.assessment_refs IS NOT NULL AND jsonb_typeof(NEW.assessment_refs)<>'object') THEN
   RAISE EXCEPTION '空间及派生依据须为JSON对象' USING ERRCODE='23514';
 END IF;
 IF NEW.unit_id IS NOT NULL THEN
   SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;
   IF NOT FOUND THEN RAISE EXCEPTION '房屋空间单元不属于本任务' USING ERRCODE='23503'; END IF;
   IF u.unit_type<>'BUILDING' THEN RAISE EXCEPTION 'unit_id须指建筑单元，周边森林单元另在空间引用记录' USING ERRCODE='23514'; END IF;
   IF NEW.record_status='VALID' AND u.data_status<>'VALID' THEN
     RAISE EXCEPTION '可用房屋须关联可用建筑单元' USING ERRCODE='23514';
   END IF;
 END IF;
 IF NEW.record_status='VALID' THEN
   SELECT status INTO qstatus FROM public.wc_fire_quality_dictionary WHERE quality_code=NEW.quality_code;
   IF qstatus IS DISTINCT FROM 'ACTIVE' THEN RAISE EXCEPTION '可用房屋须采用有效质量代码' USING ERRCODE='23514'; END IF;
   SELECT * INTO batch FROM public.wc_fire_task_source WHERE task_id=NEW.task_id
     AND source_code=NEW.source_code AND source_batch=NEW.source_batch;
   IF NOT FOUND THEN RAISE EXCEPTION '房屋来源批次不属于本任务' USING ERRCODE='23503'; END IF;
   IF batch.quality_status<>'PASSED' THEN RAISE EXCEPTION '房屋来源批次尚未通过质检' USING ERRCODE='23514'; END IF;
   metadata:=batch.metadata_json;
   IF metadata->>'building_survey_type' IS NULL OR metadata->>'building_survey_type' NOT IN ('URBAN','RURAL') THEN
     RAISE EXCEPTION '来源元数据须说明城镇或农村调查口径' USING ERRCODE='23514';
   END IF;
   FOR k IN SELECT unnest(ARRAY['coordinate_system','geometry_source_ref']) LOOP
     IF jsonb_typeof(metadata->k) IS DISTINCT FROM 'string' OR metadata->>k !~ '[^[:space:]]' THEN
       RAISE EXCEPTION '可用来源元数据缺少%',k USING ERRCODE='23514';
     END IF;
   END LOOP;
   IF num_nonnulls(NEW.building_use_code,NEW.building_use_name)>0
      AND (jsonb_typeof(metadata->'use_dictionary_ref') IS DISTINCT FROM 'string'
        OR metadata->>'use_dictionary_ref' !~ '[^[:space:]]') THEN
     RAISE EXCEPTION '用途原值须追溯来源分类及版本' USING ERRCODE='23514';
   END IF;
   IF num_nonnulls(NEW.structure_type_code,NEW.structure_type_name)>0
      AND (jsonb_typeof(metadata->'structure_dictionary_ref') IS DISTINCT FROM 'string'
        OR metadata->>'structure_dictionary_ref' !~ '[^[:space:]]') THEN
     RAISE EXCEPTION '结构原值须追溯来源分类及版本' USING ERRCODE='23514';
   END IF;
 END IF;

 IF NEW.spatial_relation_refs IS NOT NULL THEN
   refs:=NEW.spatial_relation_refs;
   IF jsonb_typeof(refs->'geometry_role') IS DISTINCT FROM 'string'
      OR refs->>'geometry_role' NOT IN ('LOCATION_POINT','FOOTPRINT') THEN
     RAISE EXCEPTION '须明确房屋位置点或轮廓面的几何角色' USING ERRCODE='23514';
   END IF;
   IF (refs->>'geometry_role'='LOCATION_POINT' AND GeometryType(NEW.geom)<>'POINT')
      OR (refs->>'geometry_role'='FOOTPRINT' AND GeometryType(NEW.geom) NOT IN ('POLYGON','MULTIPOLYGON')) THEN
     RAISE EXCEPTION '房屋几何类型与记录角色不一致' USING ERRCODE='23514';
   END IF;
   IF NEW.forest_distance_m IS NOT NULL THEN
     IF jsonb_typeof(refs->'distance_definition') IS DISTINCT FROM 'string'
        OR refs->>'distance_definition' NOT IN ('TO_FOREST_AREA','TO_FOREST_EDGE') THEN
       RAISE EXCEPTION '距离须明确林地范围或林地边界定义' USING ERRCODE='23514';
     END IF;
     FOR k IN SELECT unnest(ARRAY['method_code','method_version','distance_crs','calculated_on']) LOOP
       IF jsonb_typeof(refs->k) IS DISTINCT FROM 'string' OR refs->>k !~ '[^[:space:]]' THEN
         RAISE EXCEPTION '空间距离依据缺少%',k USING ERRCODE='23514';
       END IF;
     END LOOP;
     IF refs->>'calculated_on' !~ '^\d{4}-\d{2}-\d{2}$' THEN RAISE EXCEPTION '距离计算日期格式错误' USING ERRCODE='23514'; END IF;
     BEGIN applied:=(refs->>'calculated_on')::date;
     EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN
       RAISE EXCEPTION '距离计算日期无效' USING ERRCODE='23514';
     END;
     IF jsonb_typeof(refs->'forest_unit_ids') IS DISTINCT FROM 'array' THEN
       RAISE EXCEPTION '距离依据须记录采用的森林范围单元集合' USING ERRCODE='23514';
     END IF;
     IF jsonb_array_length(refs->'forest_unit_ids')=0 THEN RAISE EXCEPTION '森林输入集合不能为空' USING ERRCODE='23514'; END IF;
     FOR forest_id IN SELECT value FROM jsonb_array_elements(refs->'forest_unit_ids') LOOP
       IF jsonb_typeof(forest_id) IS DISTINCT FROM 'string' OR forest_id#>>'{}' !~ '[^[:space:]]' THEN
         RAISE EXCEPTION '森林单元引用须为非空字符串' USING ERRCODE='23514';
       END IF;
       SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=forest_id#>>'{}';
       IF NOT FOUND THEN RAISE EXCEPTION '采用森林范围单元不属于本任务' USING ERRCODE='23503'; END IF;
       IF GeometryType(u.geom) NOT IN ('POLYGON','MULTIPOLYGON') OR ST_IsEmpty(u.geom) OR NOT ST_IsValid(u.geom)
          OR (NEW.record_status='VALID' AND u.data_status<>'VALID') THEN
         RAISE EXCEPTION '森林输入须为有效范围几何，可用房屋须采用可用输入' USING ERRCODE='23514';
       END IF;
     END LOOP;
   END IF;
 END IF;

 IF NEW.assessment_refs IS NOT NULL THEN
   FOR part IN SELECT key,value FROM jsonb_each(NEW.assessment_refs) LOOP
     IF part.key NOT IN ('exposure','vulnerability') OR jsonb_typeof(part.value)<>'object' THEN
       RAISE EXCEPTION '派生依据只记录暴露判断或脆弱性，不保存隐患等级' USING ERRCODE='23514';
     END IF;
     env:=part.value;
     FOR k IN SELECT unnest(ARRAY['model_ref','model_version','rule_source_code','rule_document_ref','rule_locator',
       'rule_version','method_version','process_ref','calculated_on']) LOOP
       IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '[^[:space:]]' THEN
         RAISE EXCEPTION '%采用依据缺少%',part.key,k USING ERRCODE='23514';
       END IF;
     END LOOP;
     IF NOT EXISTS(SELECT 1 FROM public.wc_fire_source_registry WHERE source_code=env->>'rule_source_code') THEN
       RAISE EXCEPTION '派生规则依据来源未登记' USING ERRCODE='23503';
     END IF;
     IF env->>'calculated_on' !~ '^\d{4}-\d{2}-\d{2}$' THEN RAISE EXCEPTION '派生日期格式错误' USING ERRCODE='23514'; END IF;
     BEGIN applied:=(env->>'calculated_on')::date;
     EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN
       RAISE EXCEPTION '派生采用日期无效' USING ERRCODE='23514';
     END;
   END LOOP;
 END IF;

 -- 两类JSON中的输入均定位本任务来源批次。文件真实性/全集及数值重算留实际处理入口。
 FOR env IN
   SELECT NEW.spatial_relation_refs WHERE NEW.spatial_relation_refs IS NOT NULL
   UNION ALL SELECT value FROM jsonb_each(coalesce(NEW.assessment_refs,'{}'::jsonb))
 LOOP
   IF jsonb_typeof(env->'input_refs') IS DISTINCT FROM 'array' THEN
     RAISE EXCEPTION '处理依据须记录input_refs输入集合' USING ERRCODE='23514';
   END IF;
   IF jsonb_array_length(env->'input_refs')=0 THEN RAISE EXCEPTION '处理输入集合不能为空' USING ERRCODE='23514'; END IF;
   self_ref:=false;
   FOR ref IN SELECT value FROM jsonb_array_elements(env->'input_refs') LOOP
     IF jsonb_typeof(ref)<>'object' THEN RAISE EXCEPTION '输入引用须为对象' USING ERRCODE='23514'; END IF;
     FOR k IN SELECT unnest(ARRAY['source_code','source_batch']) LOOP
       IF jsonb_typeof(ref->k) IS DISTINCT FROM 'string' OR ref->>k !~ '[^[:space:]]' THEN
         RAISE EXCEPTION '输入来源或批次须为非空字符串' USING ERRCODE='23514';
       END IF;
     END LOOP;
     IF NOT ((jsonb_typeof(ref->'source_record_id')='string' AND ref->>'source_record_id' ~ '[^[:space:]]')
        OR (jsonb_typeof(ref->'document_ref')='string' AND ref->>'document_ref' ~ '[^[:space:]]')) IS TRUE THEN
       RAISE EXCEPTION '输入须可定位原记录或实际文件' USING ERRCODE='23514';
     END IF;
     SELECT * INTO batch FROM public.wc_fire_task_source WHERE task_id=NEW.task_id
       AND source_code=ref->>'source_code' AND source_batch=ref->>'source_batch';
     IF NOT FOUND THEN RAISE EXCEPTION '输入来源批次不属于本任务' USING ERRCODE='23503'; END IF;
     IF NEW.record_status='VALID' AND batch.quality_status<>'PASSED' THEN
       RAISE EXCEPTION '可用记录采用的输入批次须通过质检' USING ERRCODE='23514';
     END IF;
     IF ref->>'source_code'=NEW.source_code AND ref->>'source_batch'=NEW.source_batch
        AND ref->>'source_record_id'=NEW.source_record_id THEN self_ref:=true; END IF;
   END LOOP;
   IF NEW.record_status='VALID' AND NOT self_ref THEN
     RAISE EXCEPTION '可用处理依据须包含本房屋的实际来源记录' USING ERRCODE='23514';
   END IF;
 END LOOP;
 RETURN NEW;
END $_$;


ALTER FUNCTION public.fn_wc_fire_building_prerequisites() OWNER TO postgres;

--
-- Name: fn_wc_fire_capacity_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_capacity_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'public', 'pg_catalog'
    AS $_$
DECLARE
 u wc_fire_spatial_unit%ROWTYPE; batch wc_fire_task_source%ROWTYPE; metadata jsonb; qstatus text;
 attrs jsonb; item jsonb; refs jsonb; env jsonb; ref jsonb; target jsonb; part record;
 k text; role text; scope text; gtype text; adopted date; self_ref boolean;
BEGIN
 FOREACH env IN ARRAY ARRAY[NEW.resource_attributes,NEW.verification_refs,NEW.service_refs] LOOP
  IF env IS NOT NULL AND jsonb_typeof(env) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '三个追溯字段须为JSON对象' USING ERRCODE='23514'; END IF;
 END LOOP;
 IF NEW.unit_id IS NOT NULL THEN
  SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;
  IF NOT FOUND THEN RAISE EXCEPTION '资源关联单元不属于本任务' USING ERRCODE='23503'; END IF;
  IF NEW.record_status='VALID' AND u.data_status<>'VALID' THEN RAISE EXCEPTION '可用资料须引用可用空间单元' USING ERRCODE='23514'; END IF;
 END IF;
 IF NEW.record_status='VALID' THEN
  SELECT status INTO qstatus FROM wc_fire_quality_dictionary WHERE quality_code=NEW.quality_code;
  IF qstatus IS DISTINCT FROM 'ACTIVE' THEN RAISE EXCEPTION '可用资料须有有效质量代码' USING ERRCODE='23514'; END IF;
  SELECT * INTO batch FROM wc_fire_task_source WHERE task_id=NEW.task_id AND source_code=NEW.source_code AND source_batch=NEW.source_batch;
  IF NOT FOUND THEN RAISE EXCEPTION '资源来源批次不属于本任务' USING ERRCODE='23503'; END IF;
  IF batch.quality_status<>'PASSED' THEN RAISE EXCEPTION '资源来源批次未通过质检' USING ERRCODE='23514'; END IF;
  metadata:=batch.metadata_json;
  FOR k IN SELECT unnest(ARRAY['capacity_dataset_ref','capacity_type_dictionary_ref']) LOOP
   IF jsonb_typeof(metadata->k) IS DISTINCT FROM 'string' OR metadata->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '资源来源元数据缺少%',k USING ERRCODE='23514'; END IF;
  END LOOP;
  IF NEW.quantity IS NOT NULL OR NEW.resource_attributes ? 'attributes' THEN
   IF jsonb_typeof(metadata->'capacity_attribute_dictionary_ref') IS DISTINCT FROM 'string' OR metadata->>'capacity_attribute_dictionary_ref' !~ '[^[:space:]]' THEN
    RAISE EXCEPTION '数量/类型属性须有来源属性和单位口径' USING ERRCODE='23514';
   END IF;
  END IF;
  IF NEW.geom IS NOT NULL THEN
   FOR k IN SELECT unnest(ARRAY['coordinate_system','geometry_source_ref']) LOOP
    IF jsonb_typeof(metadata->k) IS DISTINCT FROM 'string' OR metadata->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '资源几何来源缺少%',k USING ERRCODE='23514'; END IF;
   END LOOP;
  END IF;
  IF NEW.availability_status IS NOT NULL THEN
   IF jsonb_typeof(metadata->'availability_dictionary_ref') IS DISTINCT FROM 'string' OR metadata->>'availability_dictionary_ref' !~ '[^[:space:]]' THEN
    RAISE EXCEPTION '运行状态须有来源分类及版本' USING ERRCODE='23514';
   END IF;
  END IF;
 END IF;

 IF NEW.resource_attributes IS NOT NULL THEN
  attrs:=NEW.resource_attributes; scope:=attrs->>'record_scope'; role:=attrs->>'geometry_role';
  IF jsonb_typeof(attrs->'record_scope') IS DISTINCT FROM 'string' OR scope NOT IN('RESOURCE','UNIT_STATISTIC') THEN RAISE EXCEPTION '须区别资源个体与单元统计' USING ERRCODE='23514'; END IF;
  IF NEW.unit_id IS NOT NULL THEN
   IF jsonb_typeof(attrs->'unit_relation_role') IS DISTINCT FROM 'string' OR attrs->>'unit_relation_role' NOT IN('ADMIN_MEMBERSHIP','SERVICE_UNIT','STATISTICAL_UNIT') THEN
    RAISE EXCEPTION '须说明资源关联单元的实际角色' USING ERRCODE='23514';
   END IF;
  ELSIF attrs ? 'unit_relation_role' THEN RAISE EXCEPTION '单元关系角色须有实际单元引用' USING ERRCODE='23514';
  END IF;
  IF scope='UNIT_STATISTIC' AND (NEW.unit_id IS NULL OR attrs->>'unit_relation_role' IS DISTINCT FROM 'STATISTICAL_UNIT') THEN
   RAISE EXCEPTION '单元统计须明确实际统计单元' USING ERRCODE='23514';
  END IF;
  IF scope='RESOURCE' AND NEW.geom IS NULL THEN RAISE EXCEPTION '资源个体须有实际位置或实体几何' USING ERRCODE='23514'; END IF;
  IF NEW.geom IS NOT NULL THEN
   gtype:=GeometryType(NEW.geom);
   IF jsonb_typeof(attrs->'geometry_role') IS DISTINCT FROM 'string' OR role NOT IN('LOCATION_POINT','LINE_ENTITY','AREA_ENTITY','UNIT_BOUNDARY') THEN RAISE EXCEPTION '须记录资源几何角色' USING ERRCODE='23514'; END IF;
   IF (role='LOCATION_POINT' AND gtype NOT IN('POINT','MULTIPOINT')) OR (role='LINE_ENTITY' AND gtype NOT IN('LINESTRING','MULTILINESTRING'))
     OR (role IN('AREA_ENTITY','UNIT_BOUNDARY') AND gtype NOT IN('POLYGON','MULTIPOLYGON')) THEN RAISE EXCEPTION '资源几何角色与类型不符' USING ERRCODE='23514'; END IF;
   IF (scope='RESOURCE' AND role='UNIT_BOUNDARY') OR (scope='UNIT_STATISTIC' AND role<>'UNIT_BOUNDARY') THEN RAISE EXCEPTION '统计边界不能代替资源实体' USING ERRCODE='23514'; END IF;
   IF role='UNIT_BOUNDARY' AND GeometryType(u.geom) NOT IN('POLYGON','MULTIPOLYGON') THEN RAISE EXCEPTION '统计边界须引用面单元' USING ERRCODE='23514'; END IF;
  ELSIF attrs ? 'geometry_role' THEN RAISE EXCEPTION '无几何时不能填伪几何角色' USING ERRCODE='23514';
  END IF;
  IF NEW.quantity IS NOT NULL AND (jsonb_typeof(attrs->'quantity_definition') IS DISTINCT FROM 'string' OR attrs->>'quantity_definition' !~ '[^[:space:]]') THEN
   RAISE EXCEPTION '资源数量须记录原始数量口径' USING ERRCODE='23514';
  END IF;
  IF NEW.record_status='VALID' AND NEW.survey_date IS NULL AND NOT attrs ? 'as_of_date' THEN RAISE EXCEPTION '资料须有调查日期或实际统计时点' USING ERRCODE='23514'; END IF;
  IF attrs ? 'attributes' THEN
   IF jsonb_typeof(attrs->'attributes') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '类型原属性须为数组' USING ERRCODE='23514'; END IF;
   FOR item IN SELECT value FROM jsonb_array_elements(attrs->'attributes') LOOP
    IF jsonb_typeof(item) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '类型属性项须为对象' USING ERRCODE='23514'; END IF;
    FOR k IN SELECT unnest(ARRAY['attribute_code','source_locator']) LOOP
     IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR item->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '属性项缺少原代码或来源位置' USING ERRCODE='23514'; END IF;
    END LOOP;
    IF jsonb_typeof(item->'raw_value') IS NULL OR jsonb_typeof(item->'raw_value') NOT IN('string','number','boolean','null') THEN RAISE EXCEPTION '属性原值须为标量或明确缺测null' USING ERRCODE='23514'; END IF;
    IF jsonb_typeof(item->'raw_value')='number' AND (jsonb_typeof(item->'unit') IS DISTINCT FROM 'string' OR item->>'unit' !~ '[^[:space:]]') THEN RAISE EXCEPTION '数值属性须保留原单位' USING ERRCODE='23514'; END IF;
   END LOOP;
  END IF;
 END IF;

 IF NEW.record_status='VALID' AND NEW.availability_status IS NOT NULL AND NEW.verification_refs IS NULL THEN RAISE EXCEPTION '运行状态缺少核查依据' USING ERRCODE='23514'; END IF;
 IF NEW.verification_refs IS NOT NULL THEN
  refs:=NEW.verification_refs;
  FOR k IN SELECT unnest(ARRAY['reported_status','status_dictionary_ref','checked_on','verifier_ref','conclusion']) LOOP
   IF jsonb_typeof(refs->k) IS DISTINCT FROM 'string' OR refs->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '状态核查缺少%',k USING ERRCODE='23514'; END IF;
  END LOOP;
  IF refs->>'reported_status' IS DISTINCT FROM NEW.availability_status THEN RAISE EXCEPTION '核查状态须与保存的来源状态一致' USING ERRCODE='23514'; END IF;
  IF NEW.record_status='VALID' AND refs->>'status_dictionary_ref' IS DISTINCT FROM metadata->>'availability_dictionary_ref' THEN RAISE EXCEPTION '核查状态分类与来源版本不符' USING ERRCODE='23514'; END IF;
 END IF;

 IF NEW.record_status='VALID' AND ((NEW.service_radius_m IS NOT NULL AND NEW.service_refs->'service_radius' IS NULL)
   OR (NEW.response_time_min IS NOT NULL AND NEW.service_refs->'response_time' IS NULL)) THEN RAISE EXCEPTION '服务值缺少对应采用依据' USING ERRCODE='23514'; END IF;
 IF NEW.service_refs IS NOT NULL THEN
  FOR part IN SELECT key,value FROM jsonb_each(NEW.service_refs) LOOP
   IF part.key NOT IN('service_radius','response_time','coverage') OR jsonb_typeof(part.value) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '服务依据仅记录半径、响应或覆盖，不保存隐患等级' USING ERRCODE='23514'; END IF;
   env:=part.value;
   FOR k IN SELECT unnest(ARRAY['definition','value_kind','scenario_ref','target_ref','recorded_on']) LOOP
    IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '服务依据缺少%',k USING ERRCODE='23514'; END IF;
   END LOOP;
   IF env->>'value_kind' NOT IN('PLANNED','SOURCE_REPORTED','MEASURED','MODELLED') THEN RAISE EXCEPTION '须区分规划、来源报告、实测与模型值' USING ERRCODE='23514'; END IF;
   IF env->>'value_kind'='MODELLED' THEN
    FOR k IN SELECT unnest(ARRAY['method_code','method_version','process_ref']) LOOP
     IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '模型服务依据缺少%',k USING ERRCODE='23514'; END IF;
    END LOOP;
   ELSE
    IF jsonb_typeof(env->'basis_ref') IS DISTINCT FROM 'string' OR env->>'basis_ref' !~ '[^[:space:]]' THEN RAISE EXCEPTION '非模型值须定位规划/来源/实测记录' USING ERRCODE='23514'; END IF;
   END IF;
   IF part.key='service_radius' THEN
    FOR k IN SELECT unnest(ARRAY['origin_ref','scope_ref']) LOOP
     IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '半径须说明起算位置与服务范围' USING ERRCODE='23514'; END IF;
    END LOOP;
   ELSIF part.key='response_time' THEN
    FOR k IN SELECT unnest(ARRAY['start_event','end_event']) LOOP
     IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '响应时间须说明计时起止环节' USING ERRCODE='23514'; END IF;
    END LOOP;
   ELSE
    IF jsonb_typeof(env->'scope_ref') IS DISTINCT FROM 'string' OR env->>'scope_ref' !~ '[^[:space:]]' THEN RAISE EXCEPTION '覆盖依据须定位实际范围资料' USING ERRCODE='23514'; END IF;
   END IF;
   IF env ? 'target_unit_ids' THEN
    IF jsonb_typeof(env->'target_unit_ids') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '服务目标单元须为数组' USING ERRCODE='23514'; END IF;
    IF jsonb_array_length(env->'target_unit_ids')=0 THEN RAISE EXCEPTION '服务目标单元数组不可为空' USING ERRCODE='23514'; END IF;
    FOR target IN SELECT value FROM jsonb_array_elements(env->'target_unit_ids') LOOP
     IF jsonb_typeof(target) IS DISTINCT FROM 'string' OR target#>>'{}' !~ '[^[:space:]]' THEN RAISE EXCEPTION '目标单元引用须非空字符串' USING ERRCODE='23514'; END IF;
     SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=target#>>'{}';
     IF NOT FOUND THEN RAISE EXCEPTION '服务目标单元不属于本任务' USING ERRCODE='23503'; END IF;
     IF NEW.record_status='VALID' AND u.data_status<>'VALID' THEN RAISE EXCEPTION '服务目标单元尚不可用' USING ERRCODE='23514'; END IF;
    END LOOP;
   END IF;
  END LOOP;
 END IF;

 -- 每个已填处理对象的输入均检查。资料来源真实内容/几何/状态/服务结果不由此重算。
 FOR env IN SELECT NEW.resource_attributes WHERE NEW.resource_attributes IS NOT NULL
  UNION ALL SELECT NEW.verification_refs WHERE NEW.verification_refs IS NOT NULL
  UNION ALL SELECT value FROM jsonb_each(coalesce(NEW.service_refs,'{}'::jsonb))
 LOOP
  FOREACH k IN ARRAY ARRAY['as_of_date','checked_on','recorded_on'] LOOP
   IF env ? k THEN
    IF jsonb_typeof(env->k) IS DISTINCT FROM 'string' OR env->>k !~ '^\d{4}-\d{2}-\d{2}$' THEN RAISE EXCEPTION '追溯日期格式错误' USING ERRCODE='23514'; END IF;
    BEGIN adopted:=(env->>k)::date;
    EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN RAISE EXCEPTION '追溯日期无效' USING ERRCODE='23514'; END;
   END IF;
  END LOOP;
  IF jsonb_typeof(env->'input_refs') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '采用依据须有输入数组' USING ERRCODE='23514'; END IF;
  IF jsonb_array_length(env->'input_refs')=0 THEN RAISE EXCEPTION '输入数组不可为空' USING ERRCODE='23514'; END IF;
  self_ref:=false;
  FOR ref IN SELECT value FROM jsonb_array_elements(env->'input_refs') LOOP
   IF jsonb_typeof(ref) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '输入引用须为对象' USING ERRCODE='23514'; END IF;
   FOR k IN SELECT unnest(ARRAY['source_code','source_batch']) LOOP
    IF jsonb_typeof(ref->k) IS DISTINCT FROM 'string' OR ref->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '输入来源/批次不可为空' USING ERRCODE='23514'; END IF;
   END LOOP;
   IF NOT ((jsonb_typeof(ref->'source_record_id')='string' AND ref->>'source_record_id' ~ '[^[:space:]]')
    OR (jsonb_typeof(ref->'document_ref')='string' AND ref->>'document_ref' ~ '[^[:space:]]')) IS TRUE THEN RAISE EXCEPTION '输入须可定位原记录或文件' USING ERRCODE='23514'; END IF;
   SELECT * INTO batch FROM wc_fire_task_source WHERE task_id=NEW.task_id AND source_code=ref->>'source_code' AND source_batch=ref->>'source_batch';
   IF NOT FOUND THEN RAISE EXCEPTION '输入来源批次不属于本任务' USING ERRCODE='23503'; END IF;
   IF NEW.record_status='VALID' AND batch.quality_status<>'PASSED' THEN RAISE EXCEPTION '采用输入批次未通过质检' USING ERRCODE='23514'; END IF;
   IF ref->>'source_code'=NEW.source_code AND ref->>'source_batch'=NEW.source_batch AND ref->>'source_record_id'=NEW.source_record_id THEN self_ref:=true; END IF;
  END LOOP;
  IF NEW.record_status='VALID' AND NOT self_ref THEN RAISE EXCEPTION '依据须含本资源的实际来源记录' USING ERRCODE='23514'; END IF;
 END LOOP;
 RETURN NEW;
END $_$;


ALTER FUNCTION public.fn_wc_fire_capacity_prerequisites() OWNER TO postgres;

--
-- Name: fn_wc_fire_catalog_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_catalog_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE a jsonb;v jsonb;
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') AND EXISTS(SELECT 1 FROM public.wc_fire_result_layer WHERE output_code=OLD.output_code AND (data_status IN ('VALID','PUBLISHED') OR calculation_refs ? 'adopted_snapshot')) THEN
   IF TG_OP='DELETE' OR (to_jsonb(NEW)-'enabled'-'official_scope_note') IS DISTINCT FROM (to_jsonb(OLD)-'enabled'-'official_scope_note') THEN RAISE EXCEPTION '已采用成果契约保留历史' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF NEW.output_name !~ '[^[:space:]]' THEN RAISE EXCEPTION '成果名称不得空白' USING ERRCODE='23514';END IF;
 IF NEW.allowed_unit_types IS NOT NULL THEN
   a:=NEW.allowed_unit_types;
   IF jsonb_typeof(a) IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '尺度契约须数组' USING ERRCODE='23514';END IF;
   IF jsonb_array_length(a)=0 OR (SELECT count(DISTINCT x) FROM jsonb_array_elements(a)x)<>jsonb_array_length(a) THEN RAISE EXCEPTION '尺度契约不得空或重复' USING ERRCODE='23514';END IF;
   FOR v IN SELECT value FROM jsonb_array_elements(a) LOOP
     IF jsonb_typeof(v)<>'string' OR v#>>'{}' NOT IN('FOREST_COMPARTMENT','GRID_30_ARCSEC','GRID_1KM','TOWNSHIP','COUNTY','ADMIN','BUILDING','HAZARD_OBJECT','PREVENTION_ZONE') THEN RAISE EXCEPTION '未知尺度契约' USING ERRCODE='23514';END IF;
   END LOOP;
 END IF;
 IF NEW.content_contract_json IS NULL OR jsonb_typeof(NEW.content_contract_json) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '内容契约须对象' USING ERRCODE='23514';END IF;
 FOREACH a IN ARRAY ARRAY[NEW.content_contract_json->'value_fields',NEW.content_contract_json->'package_codes'] LOOP
   IF jsonb_typeof(a) IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '内容字段/数据包契约须数组' USING ERRCODE='23514';END IF;
   IF jsonb_array_length(a)=0 OR (SELECT count(DISTINCT x) FROM jsonb_array_elements(a)x)<>jsonb_array_length(a) OR EXISTS(SELECT 1 FROM jsonb_array_elements(a)x WHERE jsonb_typeof(x)<>'string' OR x#>>'{}' !~ '[^[:space:]]') THEN RAISE EXCEPTION '内容字段/数据包契约须非空且不重复' USING ERRCODE='23514';END IF;
 END LOOP;
 IF EXISTS(SELECT 1 FROM jsonb_array_elements_text(NEW.content_contract_json->'value_fields')x WHERE x NOT IN('index_value','grade_code','grade_name','zone_code','zone_name')) THEN RAISE EXCEPTION '未知成果内容字段' USING ERRCODE='23514';END IF;
 IF (NEW.index_or_grade='INDEX' AND NOT(NEW.content_contract_json->'value_fields' ? 'index_value')) OR (NEW.index_or_grade='GRADE' AND NOT(NEW.content_contract_json->'value_fields' ?& ARRAY['grade_code','grade_name'])) OR (NEW.index_or_grade='ZONE' AND NOT(NEW.content_contract_json->'value_fields' ?& ARRAY['zone_code','zone_name'])) THEN RAISE EXCEPTION '内容契约与成果路由不一致' USING ERRCODE='23514';END IF;
 IF TG_OP='UPDATE' AND EXISTS(SELECT 1 FROM public.wc_fire_output_input i WHERE i.output_code=OLD.output_code AND NOT(NEW.content_contract_json->'package_codes' ? i.package_code)) THEN RAISE EXCEPTION '契约不能移除现有依赖数据包' USING ERRCODE='23514';END IF;
 RETURN NEW;
END
$$;


ALTER FUNCTION public.fn_wc_fire_catalog_guard() OWNER TO postgres;

--
-- Name: wc_fire_result_layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_result_layer (
    result_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    output_code character varying(50) NOT NULL,
    unit_id character varying(80),
    source_rule_id character varying(80),
    index_value numeric(24,8),
    grade_code character varying(40),
    grade_name character varying(80),
    zone_code character varying(40),
    zone_name character varying(120),
    data_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    source_batch character varying(200),
    geom public.geometry(Geometry,4490) NOT NULL,
    period_key character varying(40),
    upstream_result_id character varying(100),
    calculation_refs jsonb,
    zoning_level smallint,
    parent_zone_result_id character varying(80),
    investment_level smallint,
    CONSTRAINT ck_fire_result_finite CHECK (((index_value IS NULL) OR (index_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])))),
    CONSTRAINT ck_fire_result_geometry CHECK (((NOT public.st_isempty(geom)) AND public.st_isvalid(geom))),
    CONSTRAINT ck_fire_result_grade_pair CHECK ((num_nonnulls(grade_code, grade_name) = ANY (ARRAY[0, 2]))),
    CONSTRAINT ck_fire_result_missing CHECK ((((data_status)::text <> 'MISSING'::text) OR (num_nonnulls(index_value, grade_code, grade_name, zone_code, zone_name) = 0))),
    CONSTRAINT ck_fire_result_no_self_ref CHECK (((upstream_result_id IS NULL) OR ((upstream_result_id)::text <> (result_id)::text))),
    CONSTRAINT ck_fire_result_optional_text CHECK ((((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((source_rule_id IS NULL) OR ((source_rule_id)::text ~ '[^[:space:]]'::text)) AND ((period_key IS NULL) OR ((period_key)::text ~ '[^[:space:]]'::text)) AND ((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)) AND ((upstream_result_id IS NULL) OR ((upstream_result_id)::text ~ '[^[:space:]]'::text)) AND ((grade_code IS NULL) OR ((grade_code)::text ~ '[^[:space:]]'::text)) AND ((grade_name IS NULL) OR ((grade_name)::text ~ '[^[:space:]]'::text)) AND ((zone_code IS NULL) OR ((zone_code)::text ~ '[^[:space:]]'::text)) AND ((zone_name IS NULL) OR ((zone_name)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_fire_result_refs_object CHECK (((calculation_refs IS NULL) OR (jsonb_typeof(calculation_refs) = 'object'::text))),
    CONSTRAINT ck_fire_result_required_text CHECK ((((result_id)::text ~ '[^[:space:]]'::text) AND ((task_id)::text ~ '[^[:space:]]'::text) AND ((output_code)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_fire_result_zone_pair CHECK ((num_nonnulls(zone_code, zone_name) = ANY (ARRAY[0, 2]))),
    CONSTRAINT ck_r15_finite CHECK (((index_value IS NULL) OR (index_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((result_id IS NULL) OR ((result_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((output_code IS NULL) OR ((output_code)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((source_rule_id IS NULL) OR ((source_rule_id)::text ~ '[^[:space:]]'::text)) AND ((grade_code IS NULL) OR ((grade_code)::text ~ '[^[:space:]]'::text)) AND ((zone_code IS NULL) OR ((zone_code)::text ~ '[^[:space:]]'::text)) AND ((upstream_result_id IS NULL) OR ((upstream_result_id)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r18_zone_fields CHECK ((((zoning_level IS NULL) OR (zoning_level = ANY (ARRAY[1, 2]))) AND ((investment_level IS NULL) OR (investment_level = ANY (ARRAY[1, 2, 3, 4]))) AND (((output_code)::text = 'PREVENTION_ZONING'::text) OR (num_nonnulls(zoning_level, parent_zone_result_id, investment_level) = 0)))),
    CONSTRAINT wc_fire_result_layer_data_status_check CHECK (((data_status)::text = ANY ((ARRAY['PENDING'::character varying, 'VALID'::character varying, 'MISSING'::character varying, 'REJECTED'::character varying, 'PUBLISHED'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_result_layer OWNER TO postgres;

--
-- Name: TABLE wc_fire_result_layer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_result_layer IS '成果图层表';


--
-- Name: COLUMN wc_fire_result_layer.result_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.result_id IS '成果单元记录编号';


--
-- Name: COLUMN wc_fire_result_layer.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_result_layer.output_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.output_code IS '成果目录代码
P-02隐患用途：区分乡镇重点区、乡镇隐患等级和单栋房屋中间成果。';


--
-- Name: COLUMN wc_fire_result_layer.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.unit_id IS '成果空间单元编号
P-02隐患用途：最终两图关联乡镇，单栋房屋中间成果关联建筑。';


--
-- Name: COLUMN wc_fire_result_layer.source_rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.source_rule_id IS '本行采用规则编号';


--
-- Name: COLUMN wc_fire_result_layer.index_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.index_value IS '指数或采用指数值';


--
-- Name: COLUMN wc_fire_result_layer.grade_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.grade_code IS '等级代码';


--
-- Name: COLUMN wc_fire_result_layer.grade_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.grade_name IS '等级名称';


--
-- Name: COLUMN wc_fire_result_layer.zone_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.zone_code IS '防治区划代码';


--
-- Name: COLUMN wc_fire_result_layer.zone_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.zone_name IS '防治区划名称';


--
-- Name: COLUMN wc_fire_result_layer.data_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.data_status IS '成果数据状态';


--
-- Name: COLUMN wc_fire_result_layer.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_result_layer.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.geom IS '成果空间几何';


--
-- Name: COLUMN wc_fire_result_layer.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.period_key IS '成果评估期间标识';


--
-- Name: COLUMN wc_fire_result_layer.upstream_result_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.upstream_result_id IS '上游指数成果记录编号
关联说明：本列用于危险性等级引用危险性指数；隐患多项上游沿calculation_refs引用。
P04综合风险等级亦通过本列引用同任务/单元/期间/批次的综合风险指数；乡镇指数的H/E/V沿calculation_refs.risk_linkage分别引用。';


--
-- Name: COLUMN wc_fire_result_layer.calculation_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.calculation_refs IS '计算追溯和采用快照
P-02隐患用途：引用实际采用的风险、能力或RIE/PRIE及其任务、期间和版本。
P04乡镇综合风险：risk_linkage.h_result_id引用H；e_ref/v_ref含指标四元主键及value_field=raw_value；risk_linkage_snapshot由数据库生成实际取值、记录及版本快照。仅引用校验，不代表正式执行/发布。
P04人口/经济/森林资源乡镇风险H关联：risk_linkage.h_result_id引用同任务、乡镇、期间及边界的HAZARD_GRADE；hazard_linkage_snapshot由数据库生成，保存H及来源版本，仅代表H来源检查。';


--
-- Name: COLUMN wc_fire_result_layer.zoning_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.zoning_level IS 'P05区划层级1/2，不等于投入等级；未整理旧示例允许空，明确分区则要求完整身份与组成集合。';


--
-- Name: COLUMN wc_fire_result_layer.parent_zone_result_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.parent_zone_result_id IS '二级区所属一级区成果ID；同任务、同期间关联，一级区无父级。';


--
-- Name: COLUMN wc_fire_result_layer.investment_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_result_layer.investment_level IS 'P05二级区投入类别1至4；一级区不可填，不能与区划层级混用。';


--
-- Name: fn_wc_fire_composite_linkage(public.wc_fire_result_layer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_composite_linkage(a public.wc_fire_result_layer) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
 u public.wc_fire_spatial_unit%ROWTYPE; t public.wc_fire_assessment_task%ROWTYPE;
 r public.wc_fire_rule_definition%ROWTYPE; h public.wc_fire_result_layer%ROWTYPE;
 parent public.wc_fire_result_layer%ROWTYPE; v public.wc_fire_indicator_value%ROWTYPE;
 refs jsonb:=a.calculation_refs; link jsonb; contract jsonb; item jsonb; band jsonb;
 values_snapshot jsonb:='{}'::jsonb; hv numeric; ev numeric; vv numeric; expected numeric;
 k text; role text; code text; matched integer:=0; matched_band jsonb;
BEGIN
 IF a.output_code NOT IN ('COMPREHENSIVE_RISK_INDEX','COMPREHENSIVE_RISK_GRADE') THEN RETURN NULL; END IF;
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=a.task_id AND unit_id=a.unit_id;
 IF a.output_code='COMPREHENSIVE_RISK_INDEX' THEN
   IF a.upstream_result_id IS NOT NULL THEN RAISE EXCEPTION '综合风险指数须分别引用H/E/V，不能用单条上游替代三项' USING ERRCODE='23514'; END IF;
   -- 县级面积加权及格网转换另有模型；本次仅补乡镇HEV计算关联。
   IF u.unit_type IS DISTINCT FROM 'TOWNSHIP' AND NOT coalesce(refs ? 'risk_linkage',false) THEN RETURN NULL; END IF;
   IF a.index_value IS NULL AND NOT coalesce(refs ? 'risk_linkage',false) THEN RETURN NULL; END IF;
   IF u.unit_type IS DISTINCT FROM 'TOWNSHIP' THEN RAISE EXCEPTION 'P04乡镇HEV关联只能采用乡镇空间单元' USING ERRCODE='23514'; END IF;
 ELSE
   IF num_nonnulls(a.index_value,a.grade_code,a.grade_name,a.upstream_result_id)=0 THEN RETURN NULL; END IF;
   IF a.upstream_result_id IS NULL THEN RAISE EXCEPTION '综合风险等级必须关联确切的综合风险指数' USING ERRCODE='23514'; END IF;
 END IF;
 IF a.unit_id IS NULL OR a.period_key IS NULL OR a.source_batch IS NULL OR a.source_rule_id IS NULL
    OR jsonb_typeof(refs) IS DISTINCT FROM 'object' OR a.index_value IS NULL
    OR a.index_value IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
    OR a.index_value<1 OR a.index_value>4 THEN
   RAISE EXCEPTION '综合风险关联须单元、时段、批次、规则、追溯对象及1至4的有限指数' USING ERRCODE='23514';
 END IF;
 SELECT * INTO t FROM public.wc_fire_assessment_task WHERE task_id=a.task_id;
 SELECT * INTO r FROM public.wc_fire_rule_definition WHERE task_id=a.task_id AND rule_id=a.source_rule_id FOR SHARE;
 IF NOT FOUND OR r.rule_type<>'RISK_GRADE' THEN RAISE EXCEPTION '综合风险关联规则不存在或用途不符' USING ERRCODE='23514'; END IF;
 contract:=r.parameter_json->'risk_linkage_contract';
 IF contract->>'version' IS DISTINCT FROM 'WC_P04_LINKAGE_20261018'
    OR contract->>'index_method' IS DISTINCT FROM 'P04_7_1_TOWNSHIP_HEV'
    OR contract->>'grade_method' IS DISTINCT FROM 'P04_TABLE_1'
    OR contract->>'index_precision' IS DISTINCT FROM '8' THEN
   RAISE EXCEPTION '采用规则尚未登记P04综合风险关联契约' USING ERRCODE='23514';
 END IF;
 FOREACH k IN ARRAY ARRAY['model_version','rule_version','method_version','calculated_on'] LOOP
   IF jsonb_typeof(refs->k) IS DISTINCT FROM 'string' OR refs->>k !~ '[^[:space:]]' THEN
     RAISE EXCEPTION '综合风险追溯缺少有效字段：%',k USING ERRCODE='23514';
   END IF;
 END LOOP;
 PERFORM public.fn_wc_fire_result_date(refs->>'calculated_on');
 IF refs->>'model_version' IS DISTINCT FROM t.model_version OR refs->>'rule_version' IS DISTINCT FROM r.rule_version THEN
   RAISE EXCEPTION '综合风险引用的模型或规则版本与实际记录不一致' USING ERRCODE='23514';
 END IF;
 IF NOT coalesce(ST_Equals(a.geom,u.geom),false) THEN RAISE EXCEPTION '综合风险边界快照与采用单元不一致' USING ERRCODE='23514'; END IF;
 IF a.output_code='COMPREHENSIVE_RISK_INDEX' THEN
   link:=refs->'risk_linkage';
   IF jsonb_typeof(link) IS DISTINCT FROM 'object' OR jsonb_typeof(link->'h_result_id') IS DISTINCT FROM 'string'
      OR coalesce(link->>'h_result_id','') !~ '[^[:space:]]' THEN
     RAISE EXCEPTION '综合风险指数必须引用确切的H成果和E/V等级记录' USING ERRCODE='23514';
   END IF;
   SELECT * INTO h FROM public.wc_fire_result_layer WHERE result_id=link->>'h_result_id' FOR SHARE;
   IF NOT FOUND OR h.output_code<>'HAZARD_GRADE' OR h.task_id<>a.task_id OR h.unit_id IS DISTINCT FROM a.unit_id
      OR h.period_key IS DISTINCT FROM a.period_key OR h.data_status NOT IN ('PENDING','VALID','PUBLISHED')
      OR h.grade_code IS NULL OR h.source_rule_id IS NULL OR NOT coalesce(ST_Equals(h.geom,a.geom),false) THEN
     RAISE EXCEPTION 'H须同任务、乡镇、时段、边界且可引用的危险性等级成果' USING ERRCODE='23514';
   END IF;
   IF jsonb_typeof(r.parameter_json#>ARRAY['constants','risk_input_grade_values',h.grade_name]) IS DISTINCT FROM 'number' THEN
     RAISE EXCEPTION 'H等级名称未对应P04高/中高/中低/低，不能用HI替代H' USING ERRCODE='23514';
   END IF;
   hv:=(r.parameter_json#>>ARRAY['constants','risk_input_grade_values',h.grade_name])::numeric;
   IF hv NOT IN (1,2,3,4) THEN RAISE EXCEPTION 'H等级值须1/2/3/4' USING ERRCODE='23514'; END IF;
   FOREACH role IN ARRAY ARRAY['e_ref','v_ref'] LOOP
     item:=link->role;
     code:=CASE role WHEN 'e_ref' THEN 'P04_COMPOSITE_EXPOSURE_GRADE' ELSE 'P04_COMPOSITE_VULNERABILITY_GRADE' END;
     IF jsonb_typeof(item) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '综合风险缺少%等级引用',role USING ERRCODE='23514'; END IF;
     FOREACH k IN ARRAY ARRAY['task_id','unit_id','indicator_code','period_key','value_field'] LOOP
       IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR item->>k !~ '[^[:space:]]' THEN
         RAISE EXCEPTION 'E/V引用缺少主键或取值字段：%',k USING ERRCODE='23514';
       END IF;
     END LOOP;
     IF item->>'task_id'<>a.task_id OR item->>'unit_id'<>a.unit_id OR item->>'period_key'<>a.period_key
        OR item->>'indicator_code'<>code OR item->>'value_field'<>'raw_value' THEN
       RAISE EXCEPTION 'E/V须同任务、乡镇、时段的相应等级raw_value记录' USING ERRCODE='23514';
     END IF;
     SELECT * INTO v FROM public.wc_fire_indicator_value WHERE task_id=a.task_id AND unit_id=a.unit_id
       AND period_key=a.period_key AND indicator_code=code FOR SHARE;
     IF NOT FOUND OR v.value_status NOT IN ('PENDING','VALID') OR v.unit IS DISTINCT FROM 'grade_value'
        OR v.raw_value IS NULL OR v.raw_value NOT IN (1,2,3,4) THEN
       RAISE EXCEPTION 'E/V等级记录不存在、不可引用或不是1/2/3/4' USING ERRCODE='23514';
     END IF;
     IF a.data_status IN ('VALID','PUBLISHED') AND v.value_status<>'VALID' THEN RAISE EXCEPTION '正式综合风险不能采用待核E/V' USING ERRCODE='23514'; END IF;
     IF role='e_ref' THEN ev:=v.raw_value; ELSE vv:=v.raw_value; END IF;
     values_snapshot:=values_snapshot||jsonb_build_object(role,to_jsonb(v));
   END LOOP;
   IF a.data_status IN ('VALID','PUBLISHED') AND h.data_status NOT IN ('VALID','PUBLISHED') THEN RAISE EXCEPTION '正式综合风险不能采用待核H' USING ERRCODE='23514'; END IF;
   expected:=round(power(hv*ev*vv,1::numeric/3),8);
   IF a.index_value IS DISTINCT FROM expected THEN RAISE EXCEPTION '综合风险R与实际引用的H/E/V三次方根不一致' USING ERRCODE='23514'; END IF;
   RETURN jsonb_build_object('version',contract->>'version','validation_scope','LINKAGE_ONLY',
     'H',hv,'E',ev,'V',vv,'calculated_index',expected,'h_result',to_jsonb(h)-'geom',
     'indicator_values',values_snapshot,'rule',to_jsonb(r),'task_model_version',t.model_version,
     'unit',to_jsonb(u)-'geom');
 ELSE
   SELECT * INTO parent FROM public.wc_fire_result_layer WHERE result_id=a.upstream_result_id FOR SHARE;
   IF NOT FOUND OR parent.output_code<>'COMPREHENSIVE_RISK_INDEX' OR parent.task_id<>a.task_id
      OR parent.unit_id IS DISTINCT FROM a.unit_id OR parent.period_key IS DISTINCT FROM a.period_key
      OR parent.source_batch IS DISTINCT FROM a.source_batch OR parent.data_status NOT IN ('PENDING','VALID','PUBLISHED')
      OR parent.index_value IS DISTINCT FROM a.index_value OR NOT coalesce(ST_Equals(parent.geom,a.geom),false) THEN
     RAISE EXCEPTION '综合风险等级须同任务、单元、时段、批次、边界的确切指数，且保留相同R' USING ERRCODE='23514';
   END IF;
   IF parent.calculation_refs->>'model_version' IS DISTINCT FROM refs->>'model_version'
      OR (u.unit_type='TOWNSHIP' AND NOT coalesce(parent.calculation_refs ? 'risk_linkage_snapshot',false)) THEN
     RAISE EXCEPTION '上游综合风险指数模型版本不符或乡镇HEV尚未通过引用校验' USING ERRCODE='23514';
   END IF;
   IF a.data_status IN ('VALID','PUBLISHED') AND parent.data_status NOT IN ('VALID','PUBLISHED') THEN RAISE EXCEPTION '正式等级不能采用待核指数' USING ERRCODE='23514'; END IF;
   IF jsonb_typeof(contract->'grades') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION 'P04五档分级契约缺失' USING ERRCODE='23514'; END IF;
   FOR band IN SELECT value FROM jsonb_array_elements(contract->'grades') LOOP
     IF (a.index_value>(band->>'lower')::numeric OR (a.index_value=(band->>'lower')::numeric AND (band->>'lower_inclusive')::boolean))
        AND (a.index_value<(band->>'upper')::numeric OR (a.index_value=(band->>'upper')::numeric AND (band->>'upper_inclusive')::boolean)) THEN
       matched:=matched+1; matched_band:=band;
       IF a.grade_code IS DISTINCT FROM band->>'grade_code' OR a.grade_name IS DISTINCT FROM band->>'grade_name' THEN
         RAISE EXCEPTION '综合风险等级代码、名称与P04表1的R区间不一致' USING ERRCODE='23514';
       END IF;
     END IF;
   END LOOP;
   IF matched<>1 THEN RAISE EXCEPTION '综合风险R必须恰好落入一个P04等级区间' USING ERRCODE='23514'; END IF;
   RETURN jsonb_build_object('version',contract->>'version','validation_scope','LINKAGE_ONLY',
     'upstream_index',to_jsonb(parent)-'geom','grade_band',matched_band,'rule',to_jsonb(r));
 END IF;
END $$;


ALTER FUNCTION public.fn_wc_fire_composite_linkage(a public.wc_fire_result_layer) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_composite_linkage(a public.wc_fire_result_layer); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_composite_linkage(a public.wc_fire_result_layer) IS 'P04乡镇H/E/V及综合风险等级实际引用和算术校验；返回数据库生成的引用快照；不放开正式有效/发布。';


--
-- Name: fn_wc_fire_composite_parent_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_composite_parent_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE used boolean;
BEGIN
 IF TG_OP='UPDATE' AND to_jsonb(NEW) IS NOT DISTINCT FROM to_jsonb(OLD) THEN RETURN NEW; END IF;
 IF TG_TABLE_NAME='wc_fire_result_layer' THEN
   SELECT EXISTS(SELECT 1 FROM public.wc_fire_result_layer x WHERE x.task_id=OLD.task_id AND (
     (x.output_code='COMPREHENSIVE_RISK_GRADE' AND x.upstream_result_id=OLD.result_id)
     OR (x.output_code='COMPREHENSIVE_RISK_INDEX' AND x.calculation_refs#>>'{risk_linkage,h_result_id}'=OLD.result_id))) INTO used;
 ELSE
   SELECT EXISTS(SELECT 1 FROM public.wc_fire_result_layer x WHERE x.task_id=OLD.task_id AND x.output_code='COMPREHENSIVE_RISK_INDEX'
     AND EXISTS(SELECT 1 FROM jsonb_each(x.calculation_refs->'risk_linkage') j WHERE j.key IN ('e_ref','v_ref')
       AND j.value->>'task_id'=OLD.task_id AND j.value->>'unit_id'=OLD.unit_id
       AND j.value->>'indicator_code'=OLD.indicator_code AND j.value->>'period_key'=OLD.period_key)) INTO used;
 END IF;
 IF used THEN RAISE EXCEPTION '记录已被综合风险下游引用，不能原位改写或删除；草稿重算先解除下游关联' USING ERRCODE='23514'; END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_composite_parent_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_dictionary_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_dictionary_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE old_data jsonb;new_data jsonb;p text[];cycle boolean;
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') AND TG_TABLE_NAME <> 'wc_fire_fuel_code_dictionary' THEN
  old_data:=to_jsonb(OLD);
  IF old_data->>'status' IN ('ACTIVE','INACTIVE') THEN
   IF TG_OP='DELETE' OR (to_jsonb(NEW)-'status'-'note') IS DISTINCT FROM (old_data-'status'-'note') THEN RAISE EXCEPTION '已启用或停用字典语义保留历史，不覆盖或删除' USING ERRCODE='23514';END IF;
   IF NEW.status NOT IN ('ACTIVE','INACTIVE') THEN RAISE EXCEPTION '已采用字典不得退回草稿覆盖' USING ERRCODE='23514';END IF;
  END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 new_data:=to_jsonb(NEW);
 IF new_data->>'status'='ACTIVE' THEN
  IF coalesce(new_data->>'dictionary_version','') !~ '[^[:space:]]'
   OR new_data->>'source_code' IS NULL
   OR coalesce(new_data->>'source_page','') !~ '[^[:space:]]'
   OR coalesce(new_data->>'source_name',new_data->>'source_document','') !~ '[^[:space:]]' THEN
   RAISE EXCEPTION '启用字典须明确来源/定位和版本，不能把空表当正式字典' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_TABLE_NAME='wc_fire_fuel_code_dictionary' AND new_data->>'parent_code' IS NOT NULL THEN
  WITH RECURSIVE chain(code,parent,path) AS (
   SELECT dict_code,parent_code,ARRAY[dict_code::text] FROM public.wc_fire_fuel_code_dictionary WHERE dict_type=NEW.dict_type AND dictionary_version IS NOT DISTINCT FROM NEW.dictionary_version AND dict_code=NEW.parent_code
   UNION ALL SELECT d.dict_code,d.parent_code,c.path||d.dict_code::text FROM public.wc_fire_fuel_code_dictionary d JOIN chain c ON d.dict_code=c.parent WHERE d.dict_type=NEW.dict_type AND d.dictionary_version IS NOT DISTINCT FROM NEW.dictionary_version AND NOT(d.dict_code=ANY(c.path))
  ) SELECT EXISTS(SELECT 1 FROM chain WHERE code=NEW.dict_code OR parent=NEW.dict_code) INTO cycle;
  IF cycle THEN RAISE EXCEPTION '字典父子关系成环' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_dictionary_guard() OWNER TO postgres;

--
-- Name: wc_fire_indicator_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_indicator_value (
    task_id character varying(60) NOT NULL,
    unit_id character varying(80) NOT NULL,
    indicator_code character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    raw_value numeric(24,8),
    normalized_value numeric(24,8),
    assigned_score numeric(24,8),
    unit character varying(40),
    source_record_id character varying(120),
    quality_code character varying(30),
    value_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    raw_code character varying(100),
    period_type character varying(20),
    stat_start date,
    stat_end date,
    as_of_date date,
    input_refs jsonb,
    normalization_param_id bigint,
    score_rule_id character varying(80),
    CONSTRAINT ck_indicator_value_finite CHECK ((((raw_value IS NULL) OR (raw_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((normalized_value IS NULL) OR (normalized_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((assigned_score IS NULL) OR (assigned_score <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_indicator_value_input_object CHECK (((input_refs IS NULL) OR (jsonb_typeof(input_refs) = 'object'::text))),
    CONSTRAINT ck_indicator_value_missing_state CHECK ((((value_status)::text <> 'MISSING'::text) OR ((raw_value IS NULL) AND (raw_code IS NULL) AND (normalized_value IS NULL) AND (assigned_score IS NULL)))),
    CONSTRAINT ck_indicator_value_optional_text CHECK ((((unit IS NULL) OR ((unit)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)) AND ((raw_code IS NULL) OR ((raw_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_indicator_value_period_type CHECK (((period_type IS NULL) OR ((period_type)::text = ANY ((ARRAY['INTERVAL'::character varying, 'SNAPSHOT'::character varying, 'VERSION'::character varying])::text[])))),
    CONSTRAINT ck_indicator_value_processed_reference CHECK ((((normalized_value IS NULL) OR (normalization_param_id IS NOT NULL)) AND ((assigned_score IS NULL) OR (score_rule_id IS NOT NULL)))),
    CONSTRAINT ck_indicator_value_raw_exclusive CHECK ((num_nonnulls(raw_value, raw_code) <= 1)),
    CONSTRAINT ck_indicator_value_required_text CHECK ((((task_id)::text ~ '[^[:space:]]'::text) AND ((unit_id)::text ~ '[^[:space:]]'::text) AND ((indicator_code)::text ~ '[^[:space:]]'::text) AND ((period_key)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_indicator_value_time_shape CHECK (((((period_type IS NULL) AND (stat_start IS NULL) AND (stat_end IS NULL) AND (as_of_date IS NULL)) OR (((period_type)::text = 'INTERVAL'::text) AND (as_of_date IS NULL) AND (((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))) OR (((period_type)::text = ANY ((ARRAY['SNAPSHOT'::character varying, 'VERSION'::character varying])::text[])) AND (stat_start IS NULL) AND (stat_end IS NULL))) IS TRUE)),
    CONSTRAINT ck_indicator_value_valid_basic CHECK ((((value_status)::text <> 'VALID'::text) OR ((quality_code IS NOT NULL) AND (num_nonnulls(raw_value, raw_code) = 1) AND ((num_nonnulls(normalized_value, assigned_score) >= 1) OR (jsonb_typeof((input_refs -> 'direct_adoption'::text)) = 'object'::text)) AND (period_type IS NOT NULL) AND (((period_type)::text <> 'INTERVAL'::text) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL))) AND (((period_type)::text <> 'SNAPSHOT'::text) OR (as_of_date IS NOT NULL)) AND (input_refs IS NOT NULL)))),
    CONSTRAINT ck_r15_finite CHECK ((((raw_value IS NULL) OR (raw_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((normalized_value IS NULL) OR (normalized_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((assigned_score IS NULL) OR (assigned_score <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_r15_identity_text CHECK ((((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((indicator_code IS NULL) OR ((indicator_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)) AND ((raw_code IS NULL) OR ((raw_code)::text ~ '[^[:space:]]'::text)) AND ((score_rule_id IS NULL) OR ((score_rule_id)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_fire_indicator_value_value_status_check CHECK (((value_status)::text = ANY ((ARRAY['PENDING'::character varying, 'VALID'::character varying, 'MISSING'::character varying, 'REJECTED'::character varying, 'SUPERSEDED'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_indicator_value OWNER TO postgres;

--
-- Name: TABLE wc_fire_indicator_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_indicator_value IS '指标计算值表';


--
-- Name: COLUMN wc_fire_indicator_value.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_indicator_value.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_indicator_value.indicator_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.indicator_code IS '指标代码';


--
-- Name: COLUMN wc_fire_indicator_value.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.period_key IS '评估/期间标识';


--
-- Name: COLUMN wc_fire_indicator_value.raw_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.raw_value IS '数值原值
P-02隐患用途：房屋RIE保存指数，乡镇PRIE保存0—1的参评房屋数量比例。';


--
-- Name: COLUMN wc_fire_indicator_value.normalized_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.normalized_value IS '标准化值';


--
-- Name: COLUMN wc_fire_indicator_value.assigned_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.assigned_score IS '指标评分';


--
-- Name: COLUMN wc_fire_indicator_value.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.unit IS '数值原值单位';


--
-- Name: COLUMN wc_fire_indicator_value.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_indicator_value.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_indicator_value.value_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.value_status IS '值处理状态';


--
-- Name: COLUMN wc_fire_indicator_value.raw_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.raw_code IS '类别原值代码
P-02隐患用途：保存乡镇减灾能力等级代码，不能用能力评分代替等级。';


--
-- Name: COLUMN wc_fire_indicator_value.period_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.period_type IS '原始资料时间类型';


--
-- Name: COLUMN wc_fire_indicator_value.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.stat_start IS '统计区间起点';


--
-- Name: COLUMN wc_fire_indicator_value.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.stat_end IS '统计区间终点';


--
-- Name: COLUMN wc_fire_indicator_value.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.as_of_date IS '统计时点/版本资料日期';


--
-- Name: COLUMN wc_fire_indicator_value.input_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.input_refs IS '输入集合与方法引用
P-02隐患用途：引用实际格网、建筑三圈范围、设施或参评房屋集合。
P04人口/经济/森林资源乡镇风险H关联：input_refs.risk_linkage.h_result_id引用同任务、乡镇、期间及边界的HAZARD_GRADE；hazard_linkage_snapshot由数据库生成，保存H及来源版本，仅代表H来源检查。';


--
-- Name: COLUMN wc_fire_indicator_value.normalization_param_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.normalization_param_id IS '采用标准化参数ID';


--
-- Name: COLUMN wc_fire_indicator_value.score_rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_value.score_rule_id IS '采用指标评分规则ID';


--
-- Name: fn_wc_fire_direct_adoption(public.wc_fire_indicator_value); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_direct_adoption(v public.wc_fire_indicator_value) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE r public.wc_fire_rule_definition%ROWTYPE;t public.wc_fire_assessment_task%ROWTYPE;u public.wc_fire_spatial_unit%ROWTYPE;s jsonb;ref jsonb;p jsonb;x jsonb;d text;
BEGIN
 IF jsonb_typeof(v.input_refs->'direct_adoption') IS DISTINCT FROM 'object' OR v.normalization_param_id IS NOT NULL OR v.score_rule_id IS NOT NULL THEN RAISE EXCEPTION '直接采用须明确直接规则，不混填评分/归一化引用' USING ERRCODE='23514';END IF;
 SELECT * INTO r FROM public.wc_fire_rule_definition WHERE task_id=v.task_id AND rule_id=v.input_refs#>>'{direct_adoption,rule_id}';
 SELECT * INTO t FROM public.wc_fire_assessment_task WHERE task_id=v.task_id;
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=v.task_id AND unit_id=v.unit_id;
 p:=r.parameter_json;
 IF r.approval_status IS DISTINCT FROM 'APPROVED' OR r.rule_version IS DISTINCT FROM t.rule_version OR p->>'model_version' IS DISTINCT FROM t.model_version
   OR p->>'rule_stage' IS DISTINCT FROM 'INDICATOR_PROCESS' OR p->>'method_code' IS DISTINCT FROM 'DIRECT'
   OR p->>'indicator_code' IS DISTINCT FROM v.indicator_code OR NOT coalesce(p->'spatial_unit_types' ? u.unit_type,false)
   OR v.input_refs->>'method_version' IS DISTINCT FROM p->>'method_version' THEN RAISE EXCEPTION '直接规则、任务版本或尺度不匹配' USING ERRCODE='23514';END IF;
 d:=v.input_refs#>>'{direct_adoption,adopted_on}';
 IF d IS NULL OR (r.effective_from IS NOT NULL AND fn_wc_fire_result_date(d)<r.effective_from) OR (r.effective_to IS NOT NULL AND fn_wc_fire_result_date(d)>r.effective_to) THEN RAISE EXCEPTION '直接采用日期缺失或不在规则有效期' USING ERRCODE='23514';END IF;
 PERFORM fn_wc_fire_result_date(d);
 IF jsonb_typeof(v.input_refs->'inputs') IS DISTINCT FROM 'array' OR jsonb_array_length(v.input_refs->'inputs')<>1 THEN RAISE EXCEPTION '直接采用只允许一条明确原值记录，合成须专用受控方法' USING ERRCODE='23514';END IF;
 ref:=v.input_refs->'inputs'->0;s:=public.fn_wc_fire_source_record(ref,v.task_id);x:=s->'record';
 IF s->>'source_object' IS DISTINCT FROM p#>>'{method_parameters,source_object}' OR x->>'unit_id' IS DISTINCT FROM v.unit_id OR x->>'period_key' IS DISTINCT FROM v.period_key
  OR v.unit IS DISTINCT FROM p#>>'{method_parameters,source_unit}' OR x->'field_units'->>(p#>>'{method_parameters,source_value_field}') IS DISTINCT FROM v.unit
  OR (v.period_type='SNAPSHOT' AND x->>'as_of_date' IS DISTINCT FROM v.as_of_date::text)
  OR (v.period_type='INTERVAL' AND (x->>'stat_start' IS DISTINCT FROM v.stat_start::text OR x->>'stat_end' IS DISTINCT FROM v.stat_end::text)) THEN RAISE EXCEPTION '直接来源对象、单元、期间或单位不一致，空间换算不能冒充直接采用' USING ERRCODE='23514';END IF;
 IF p->>'input_field'='raw_code' THEN
  IF jsonb_typeof(x->(p#>>'{method_parameters,source_value_field}')) IS DISTINCT FROM 'string' OR v.raw_code IS DISTINCT FROM x->>(p#>>'{method_parameters,source_value_field}')
    OR NOT coalesce(p#>'{method_parameters,allowed_codes}' ? v.raw_code,false) THEN RAISE EXCEPTION '直接代码与真实原值/核定代码域不一致' USING ERRCODE='23514';END IF;
 ELSIF p->>'input_field'='raw_value' THEN
  IF jsonb_typeof(x->(p#>>'{method_parameters,source_value_field}')) IS DISTINCT FROM 'number' OR v.raw_value IS DISTINCT FROM (x->>(p#>>'{method_parameters,source_value_field}'))::numeric THEN RAISE EXCEPTION '直接数值与真实原值不一致' USING ERRCODE='23514';END IF;
 ELSE RAISE EXCEPTION '直接采用类型尚未支持' USING ERRCODE='23514';END IF;
 RETURN jsonb_build_object('rule',to_jsonb(r),'source',s,'adopted_on',d,'processing_mode','DIRECT');
END $$;


ALTER FUNCTION public.fn_wc_fire_direct_adoption(v public.wc_fire_indicator_value) OWNER TO postgres;

--
-- Name: fn_wc_fire_fuel_plot_parent_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_fuel_plot_parent_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE cyclic boolean;
BEGIN
 -- 同任务层级变更共用任务行锁，防止两个并发会话分别写入成环边。
 -- READ COMMITTED下，等待任务锁后以下VOLATILE触发器查询读取新的已提交父链。
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
 IF TG_OP='UPDATE' AND OLD.task_id IS DISTINCT FROM NEW.task_id THEN
  PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
 END IF;
 IF NEW.parent_plot_id IS NOT NULL THEN
  WITH RECURSIVE chain(plot_id,parent_plot_id,path) AS (
   SELECT p.plot_id,p.parent_plot_id,ARRAY[p.plot_id::text] FROM public.wc_fire_fuel_sample_plot p WHERE p.task_id=NEW.task_id AND p.plot_id=NEW.parent_plot_id
   UNION ALL
   SELECT p.plot_id,p.parent_plot_id,c.path||p.plot_id::text FROM public.wc_fire_fuel_sample_plot p JOIN chain c ON p.plot_id=c.parent_plot_id
    WHERE p.task_id=NEW.task_id AND NOT(p.plot_id=ANY(c.path))
  ) SELECT EXISTS(SELECT 1 FROM chain WHERE plot_id=NEW.plot_id OR parent_plot_id=NEW.plot_id) INTO cyclic;
  IF NEW.parent_plot_id=NEW.plot_id OR cyclic THEN RAISE EXCEPTION '样地所属关系不得自关联或成环' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_fuel_plot_parent_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_indicator_history_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_indicator_history_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF TG_TABLE_NAME='wc_fire_indicator_value' THEN IF OLD.value_status IN ('VALID','SUPERSEDED') THEN RAISE EXCEPTION '已采用指标保留历史，不删除' USING ERRCODE='23514';END IF;RETURN OLD;END IF;
 IF TG_TABLE_NAME='wc_fire_indicator_definition' AND EXISTS(SELECT 1 FROM public.wc_fire_indicator_value WHERE indicator_code=OLD.indicator_code AND value_status IN ('VALID','SUPERSEDED')) THEN
  IF TG_OP='DELETE' OR to_jsonb(NEW) IS DISTINCT FROM to_jsonb(OLD) THEN RAISE EXCEPTION '已采用指标定义语义冻结，变化另建指标代码' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_indicator_history_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_indicator_rule_adoption(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_indicator_rule_adoption() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE r public.wc_fire_rule_definition%ROWTYPE; unit_type text; model text; applied date;
BEGIN
 IF NEW.value_status='VALID' AND NEW.assigned_score IS NOT NULL AND NEW.score_rule_id IS NOT NULL THEN
   SELECT * INTO r FROM wc_fire_rule_definition WHERE task_id=NEW.task_id AND rule_id=NEW.score_rule_id;
   IF NOT FOUND THEN RAISE EXCEPTION '采用评分规则不属于本任务' USING ERRCODE='23503'; END IF;
   SELECT u.unit_type INTO unit_type FROM wc_fire_spatial_unit u WHERE u.task_id=NEW.task_id AND u.unit_id=NEW.unit_id;
   SELECT model_version INTO model FROM wc_fire_assessment_task WHERE task_id=NEW.task_id;
   IF r.parameter_json->>'rule_stage' IS DISTINCT FROM 'INDICATOR_PROCESS'
      OR r.parameter_json->>'output_field' IS DISTINCT FROM 'assigned_score'
      OR r.parameter_json->>'model_version' IS DISTINCT FROM model
      OR NOT coalesce(r.parameter_json->'spatial_unit_types' ? unit_type,false) THEN
     RAISE EXCEPTION '评分规则处理阶段、输出、模型或尺度不适用' USING ERRCODE='23514';
   END IF;
   IF num_nonnulls(r.effective_from,r.effective_to)>0 THEN
     IF jsonb_typeof(NEW.input_refs->'rule_applied_on') IS DISTINCT FROM 'string'
        OR NEW.input_refs->>'rule_applied_on' !~ '^\d{4}-\d{2}-\d{2}$' THEN
       RAISE EXCEPTION '有适用期的评分须记录实际采用日rule_applied_on，不用原始统计期代替' USING ERRCODE='23514';
     END IF;
     BEGIN applied := (NEW.input_refs->>'rule_applied_on')::date;
     EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN
       RAISE EXCEPTION '采用日期无效' USING ERRCODE='23514';
     END;
     IF (r.effective_from IS NOT NULL AND applied<r.effective_from) OR (r.effective_to IS NOT NULL AND applied>r.effective_to) THEN
       RAISE EXCEPTION '评分规则不在实际采用日的适用期内' USING ERRCODE='23514';
     END IF;
   END IF;
 END IF;
 RETURN NEW;
END $_$;


ALTER FUNCTION public.fn_wc_fire_indicator_rule_adoption() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_indicator_rule_adoption(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_indicator_rule_adoption() IS '有效指标评分采用时复核规则阶段/输出/模型/尺度；DATED规则实际采用日沿input_refs.rule_applied_on，不混同输入统计期；沿既有指标前置触发器继续核对状态/版本等。';


--
-- Name: fn_wc_fire_indicator_value_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_indicator_value_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$

DECLARE

    definition_type text;

    p public.wc_normalization_parameter%ROWTYPE;

    r public.wc_fire_rule_definition%ROWTYPE;

    task_rule_version text;

    ref jsonb;

    key_name text;

    batch_quality text;

    actual_inputs jsonb:='[]'::jsonb; actual_source jsonb; direct_snapshot jsonb;
    composition jsonb; pop public.wc_special_population%ROWTYPE; target public.wc_fire_spatial_unit%ROWTYPE; center geometry;

BEGIN



    IF TG_OP='UPDATE' AND OLD.value_status IN ('VALID','SUPERSEDED') THEN
      IF (to_jsonb(NEW)-'value_status') IS DISTINCT FROM (to_jsonb(OLD)-'value_status') OR NEW.value_status NOT IN ('VALID','SUPERSEDED','REJECTED') THEN
        RAISE EXCEPTION '已采用指标及来源快照保留历史，重算使用新期间/任务版本' USING ERRCODE='23514';END IF;
      RETURN NEW;
    END IF;
    IF NEW.value_status='VALID' AND NEW.input_refs ? 'source_snapshots' THEN RAISE EXCEPTION '实际来源快照由数据库生成，不允许外部预填' USING ERRCODE='23514';END IF;
    IF NEW.value_status='VALID' AND num_nonnulls(NEW.normalized_value,NEW.assigned_score)=0 THEN
      IF NEW.indicator_code LIKE 'L25_%' THEN
        direct_snapshot:=public.fn_wc_lyt1063_2025_input_adoption(NEW);
      ELSE
        direct_snapshot:=public.fn_wc_fire_direct_adoption(NEW);
      END IF;
    END IF;
    IF NEW.value_status='VALID' AND NEW.indicator_code='SPECIAL_POPULATION_DENSITY' THEN

      IF coalesce(NEW.input_refs#>>'{population_adoption,pop_id}','') !~ '^\d+$' THEN RAISE EXCEPTION '人口指标须确切统计ID，不猜合计口径' USING ERRCODE='23514';END IF;

      SELECT * INTO pop FROM public.wc_special_population WHERE pop_id=(NEW.input_refs#>>'{population_adoption,pop_id}')::bigint AND task_id=NEW.task_id;

      IF NOT FOUND OR NEW.raw_value IS DISTINCT FROM public.fn_wc_special_population_density(pop.pop_id) THEN RAISE EXCEPTION '人口原指标值与确切有效统计不一致' USING ERRCODE='23514';END IF;

      IF NEW.as_of_date IS DISTINCT FROM pop.stat_date THEN RAISE EXCEPTION '人口指标须对应实际统计时点' USING ERRCODE='23514';END IF;

      IF NOT EXISTS(SELECT 1 FROM jsonb_array_elements(NEW.input_refs->'inputs') x WHERE x->>'source_object'='wc_special_population' AND x->>'record_id'=pop.pop_id::text AND x->>'source_code'=pop.source_code AND x->>'source_batch'=pop.source_batch) THEN RAISE EXCEPTION '人口来源引用与实际统计不符' USING ERRCODE='23514';END IF;

      SELECT * INTO target FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;

      IF NEW.unit_id<>pop.town_id THEN

       IF target.unit_type<>'FOREST_COMPARTMENT' OR (SELECT count(*) FROM public.wc_fire_base_terrain WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND center_point IS NOT NULL)<>1 THEN RAISE EXCEPTION '人口向小班赋值须已明确唯一中心点' USING ERRCODE='23514';END IF;

       SELECT center_point INTO center FROM public.wc_fire_base_terrain WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND center_point IS NOT NULL;

       IF NOT ST_Covers(target.geom,center) OR NOT EXISTS(SELECT 1 FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=pop.town_id AND ST_Covers(geom,center)) THEN RAISE EXCEPTION '小班中心与采用乡镇不符' USING ERRCODE='23514';END IF;

      END IF;

    END IF;

    IF NEW.value_status='VALID' AND EXISTS(SELECT 1 FROM public.wc_fire_indicator_definition WHERE indicator_code=NEW.indicator_code AND indicator_group='WEATHER')
      AND coalesce(direct_snapshot->>'adoption_kind','')<>'LYT1063_PUBLISHED_STATISTIC' THEN

      IF jsonb_typeof(NEW.input_refs->'weather_composition') IS DISTINCT FROM 'object'

       OR jsonb_typeof(NEW.input_refs#>'{weather_composition,weather_ids}') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '有效气象指标须实际月记录及合成规则引用' USING ERRCODE='23514';END IF;

      composition:=public.fn_wc_fire_weather_composition(NEW.task_id,NEW.unit_id,

       ARRAY(SELECT jsonb_array_elements_text(NEW.input_refs#>'{weather_composition,weather_ids}')),

       NEW.input_refs#>>'{weather_composition,rule_id}',public.fn_wc_fire_result_date(NEW.input_refs#>>'{weather_composition,calculated_on}'));

      IF composition#>>'{rule,parameter_json,indicator_code}' IS DISTINCT FROM NEW.indicator_code

       OR NEW.unit IS DISTINCT FROM composition->>'unit' OR NEW.raw_value IS DISTINCT FROM (composition->>'raw_value')::numeric THEN RAISE EXCEPTION '气象原值/单位与真实月集合计算不符' USING ERRCODE='23514';END IF;

      NEW.input_refs:=NEW.input_refs||jsonb_build_object('weather_composition_snapshot',composition);

    END IF;

    SELECT value_type INTO definition_type FROM public.wc_fire_indicator_definition

    WHERE indicator_code=NEW.indicator_code;

    IF NOT FOUND THEN

        RAISE EXCEPTION '指标定义不存在：%',NEW.indicator_code USING ERRCODE='23503';

    END IF;

    IF (definition_type='NUMERIC' AND NEW.raw_code IS NOT NULL)

       OR (definition_type='CODE' AND NEW.raw_value IS NOT NULL)

       OR (definition_type NOT IN ('NUMERIC','CODE')

           AND (NEW.raw_value IS NOT NULL OR NEW.raw_code IS NOT NULL OR NEW.value_status='VALID')) THEN

        RAISE EXCEPTION '原值存储与定义类型%不一致',definition_type USING ERRCODE='23514';

    END IF;



    IF NEW.normalization_param_id IS NOT NULL THEN

        PERFORM public.fn_wc_normalization_adoption(NEW.normalization_param_id,NEW.task_id,NEW.indicator_code,

            NEW.unit,NEW.raw_value,NEW.normalized_value,NEW.value_status='VALID' AND NEW.normalized_value IS NOT NULL);

    END IF;



    IF NEW.score_rule_id IS NOT NULL THEN

        SELECT * INTO r FROM public.wc_fire_rule_definition

        WHERE rule_id=NEW.score_rule_id AND task_id=NEW.task_id;

        IF NOT FOUND THEN

            RAISE EXCEPTION '评分规则不存在或属于其他任务' USING ERRCODE='23503';

        END IF;

        IF r.rule_type NOT IN ('NORMALIZATION','VULNERABILITY','HAZARD_HAZARD') THEN

            RAISE EXCEPTION '不能用成果分级/区划规则替代指标评分规则' USING ERRCODE='23514';

        END IF;

        IF NEW.value_status='VALID' AND NEW.assigned_score IS NOT NULL THEN

            SELECT rule_version INTO task_rule_version FROM public.wc_fire_assessment_task WHERE task_id=NEW.task_id;

            IF r.approval_status<>'APPROVED' OR r.rule_version IS DISTINCT FROM task_rule_version

               OR r.formula_expression IS NULL OR r.formula_expression !~ '[^[:space:]]'

               OR jsonb_typeof(r.parameter_json) IS DISTINCT FROM 'object'

               OR r.parameter_json->>'indicator_code' IS DISTINCT FROM NEW.indicator_code THEN

                RAISE EXCEPTION '评分规则未确认、版本或指标作用域不匹配' USING ERRCODE='23514';

            END IF;

        END IF;

    END IF;



    IF NEW.input_refs IS NOT NULL THEN

        IF jsonb_typeof(NEW.input_refs) IS DISTINCT FROM 'object'

           OR jsonb_typeof(NEW.input_refs->'inputs') IS DISTINCT FROM 'array' THEN

            RAISE EXCEPTION 'input_refs须为含inputs数组的对象' USING ERRCODE='23514';

        END IF;

        FOR ref IN SELECT value FROM jsonb_array_elements(NEW.input_refs->'inputs') LOOP

            IF jsonb_typeof(ref) IS DISTINCT FROM 'object' THEN

                RAISE EXCEPTION '输入引用项必须为对象' USING ERRCODE='23514';

            END IF;

            FOREACH key_name IN ARRAY ARRAY['source_code','source_batch','source_object'] LOOP

                IF jsonb_typeof(ref->key_name) IS DISTINCT FROM 'string'

                   OR ref->>key_name !~ '[^[:space:]]' THEN

                    RAISE EXCEPTION '输入引用缺少有效字段：%',key_name USING ERRCODE='23514';

                END IF;

            END LOOP;

            IF NOT ((jsonb_typeof(ref->'record_id')='string' AND ref->>'record_id' ~ '[^[:space:]]') IS TRUE)

               AND NOT ((jsonb_typeof(ref->'manifest_ref')='string' AND ref->>'manifest_ref' ~ '[^[:space:]]'

                         AND jsonb_typeof(ref->'manifest_sha256')='string'

                         AND ref->>'manifest_sha256' ~ '^[0-9A-Fa-f]{64}$') IS TRUE) THEN

                RAISE EXCEPTION '输入引用须定位记录或带校验值的输入清单' USING ERRCODE='23514';

            END IF;

            SELECT quality_status INTO batch_quality FROM public.wc_fire_task_source

            WHERE task_id=NEW.task_id AND source_code=ref->>'source_code' AND source_batch=ref->>'source_batch';

            IF NOT FOUND THEN

                RAISE EXCEPTION '输入批次没有关联本任务' USING ERRCODE='23503';

            END IF;

            IF NEW.value_status='VALID' THEN
              actual_source:=public.fn_wc_fire_source_record(ref,NEW.task_id);
              actual_inputs:=actual_inputs||jsonb_build_array(actual_source);
            END IF;
            IF NEW.value_status='VALID' AND batch_quality<>'PASSED' THEN

                RAISE EXCEPTION '有效指标的输入批次尚未通过质量检查' USING ERRCODE='23514';

            END IF;

        END LOOP;

    END IF;

    IF NEW.value_status='VALID' THEN

        IF NEW.input_refs IS NULL OR jsonb_array_length(NEW.input_refs->'inputs')=0

           OR jsonb_typeof(NEW.input_refs->'method_version') IS DISTINCT FROM 'string'

           OR NEW.input_refs->>'method_version' !~ '[^[:space:]]'

           OR NEW.input_refs->>'coverage_status' IS DISTINCT FROM 'COMPLETE' THEN

            RAISE EXCEPTION '有效指标需输入集合、处理版本和完整覆盖声明' USING ERRCODE='23514';

        END IF;

        IF NOT EXISTS (SELECT 1 FROM public.wc_fire_quality_dictionary

                       WHERE quality_code=NEW.quality_code AND status='ACTIVE') THEN

            RAISE EXCEPTION '有效指标需已启用的质量字典代码' USING ERRCODE='23514';

        END IF;

    END IF;

    IF NEW.value_status='VALID' THEN
      NEW.input_refs:=NEW.input_refs||jsonb_build_object('source_snapshots',actual_inputs,'quality_dictionary_snapshot',(SELECT to_jsonb(q) FROM wc_fire_quality_dictionary q WHERE q.quality_code=NEW.quality_code));
      IF direct_snapshot IS NOT NULL THEN NEW.input_refs:=NEW.input_refs||jsonb_build_object('direct_adoption_snapshot',direct_snapshot);END IF;
    END IF;
    RETURN NEW;

END $_$;


ALTER FUNCTION public.fn_wc_fire_indicator_value_prerequisites() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_indicator_value_prerequisites(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_indicator_value_prerequisites() IS '指标值入库前类型及关联检查；不执行真实计算，不核验外部文件/清单内容，不冻结上游定义、参数或规则。';


--
-- Name: fn_wc_fire_output_input_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_output_input_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE cycle boolean;contract jsonb;
BEGIN
 -- Serialize graph mutations at the supported default READ COMMITTED boundary.
 PERFORM pg_advisory_xact_lock(hashtextextended('wc_fire_output_input_graph',0));
 IF TG_OP IN ('UPDATE','DELETE') AND EXISTS(SELECT 1 FROM public.wc_fire_result_layer WHERE output_code=OLD.output_code AND (data_status IN ('VALID','PUBLISHED') OR calculation_refs ? 'adopted_snapshot')) THEN
   RAISE EXCEPTION '已采用成果依赖保留历史，不能覆盖或删除' USING ERRCODE='23514';
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF EXISTS(SELECT 1 FROM public.wc_fire_result_layer WHERE output_code=NEW.output_code AND (data_status IN ('VALID','PUBLISHED') OR calculation_refs ? 'adopted_snapshot')) THEN
   RAISE EXCEPTION '已采用成果不能追加或迁入依赖，须先明确新版本契约' USING ERRCODE='23514';
 END IF;
 SELECT content_contract_json INTO contract FROM public.wc_fire_output_catalog WHERE output_code=NEW.output_code;
 IF NOT coalesce(contract->'package_codes' ? NEW.package_code,false) THEN RAISE EXCEPTION '数据包代码未登记于成果契约' USING ERRCODE='23514';END IF;
 IF NEW.upstream_output_code IS NOT NULL THEN
   WITH RECURSIVE edges(a,b) AS(SELECT output_code,upstream_output_code FROM public.wc_fire_output_input WHERE upstream_output_code IS NOT NULL AND mapping_id<>NEW.mapping_id UNION SELECT NEW.output_code,NEW.upstream_output_code),
   walk(n) AS(SELECT NEW.upstream_output_code UNION SELECT e.b FROM edges e JOIN walk w ON e.a=w.n)
   SELECT EXISTS(SELECT 1 FROM walk WHERE n=NEW.output_code) INTO cycle;
   IF cycle THEN RAISE EXCEPTION '成果依赖形成循环' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END
$$;


ALTER FUNCTION public.fn_wc_fire_output_input_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_r18_indicator_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_r18_indicator_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE d wc_fire_indicator_definition%ROWTYPE; stage text;
BEGIN
 SELECT * INTO d FROM wc_fire_indicator_definition WHERE indicator_code=NEW.indicator_code;
 IF d.processing_contract_json->>'version' IS DISTINCT FROM 'WC_P04_P05_DESIGN_20261018' THEN RETURN NEW;END IF;
 stage:=d.processing_contract_json->>'stage';
 IF NEW.value_status IN('VALID','SUPERSEDED') THEN RAISE EXCEPTION 'P04新增派生链仅完成设计；参数与受控执行未落实，不允许正式采用' USING ERRCODE='23514';END IF;
 IF NEW.unit IS NOT NULL AND NEW.unit<>d.default_unit THEN RAISE EXCEPTION 'P04原值单位与指标定义不一致，须先转换单位' USING ERRCODE='23514';END IF;
 IF stage='GRADE_VALUE' AND NEW.raw_value IS NOT NULL AND NEW.raw_value NOT IN(1,2,3,4) THEN RAISE EXCEPTION 'P04等级值只允许1/2/3/4，不能存入连续指数' USING ERRCODE='23514';END IF;
 IF stage='DENSITY' AND NEW.raw_value<0 THEN RAISE EXCEPTION '密度不可为负' USING ERRCODE='23514';END IF;
 IF stage='VULNERABILITY_RAW' AND (NEW.raw_value<0 OR NEW.raw_value>1) THEN RAISE EXCEPTION '脆弱性比例须在0至1之间' USING ERRCODE='23514';END IF;
 IF NEW.indicator_code IN('P04_ECONOMIC_VULNERABILITY_RAW','P04_ECONOMIC_VULNERABILITY_GRADE') AND NEW.raw_value IS NOT NULL AND NEW.raw_value<>1 THEN RAISE EXCEPTION 'P04经济脆弱性明确取1' USING ERRCODE='23514';END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_r18_indicator_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_r18_indicator_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_r18_indicator_guard() IS '新增P04派生指标的单位与等级语义校验；正式计算能力未实现前阻止采用，后续须经规则和受控执行验收后替换此门禁。';


--
-- Name: fn_wc_fire_r18_zoning_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_r18_zoning_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE u wc_fire_spatial_unit%ROWTYPE; p wc_fire_result_layer%ROWTYPE; z jsonb; members text[]; merged geometry;
BEGIN
 IF TG_OP IN('UPDATE','DELETE') AND EXISTS(SELECT 1 FROM wc_fire_result_layer WHERE task_id=OLD.task_id AND parent_zone_result_id=OLD.result_id) THEN
  IF TG_OP='DELETE' THEN RAISE EXCEPTION '一级区存在二级区引用，不能删除' USING ERRCODE='23514';END IF;
  IF (NEW.task_id,NEW.unit_id,NEW.output_code,NEW.period_key,NEW.zoning_level,NEW.data_status,NEW.geom) IS DISTINCT FROM (OLD.task_id,OLD.unit_id,OLD.output_code,OLD.period_key,OLD.zoning_level,OLD.data_status,OLD.geom) THEN RAISE EXCEPTION '一级区已有二级区引用，不得原位改变身份/期间/边界/状态' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF NEW.output_code<>'PREVENTION_ZONING' THEN RETURN NEW;END IF;
 IF NEW.zoning_level IS NULL THEN
  IF NEW.parent_zone_result_id IS NOT NULL OR NEW.investment_level IS NOT NULL THEN RAISE EXCEPTION '先明确区划层级' USING ERRCODE='23514';END IF;
  RETURN NEW;
 END IF;
 SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;
 IF NOT FOUND OR u.unit_type<>'PREVENTION_ZONE' OR NOT ST_Equals(u.geom,NEW.geom) OR GeometryType(NEW.geom) NOT IN('POLYGON','MULTIPOLYGON') THEN RAISE EXCEPTION '明确分区须独立PREVENTION_ZONE面单元且几何一致' USING ERRCODE='23514';END IF;
 IF NEW.zone_code IS NULL OR NEW.zone_name IS NULL OR NEW.period_key IS NULL THEN RAISE EXCEPTION '明确分区须代码名称及期间' USING ERRCODE='23514';END IF;
 z:=NEW.calculation_refs->'zoning';
 IF jsonb_typeof(z->'member_unit_ids') IS DISTINCT FROM 'array' OR coalesce(z->>'boundary_decision_ref','') !~ '[^[:space:]]' THEN RAISE EXCEPTION '分区须组成单元清单及边界依据' USING ERRCODE='23514';END IF;
 IF EXISTS(SELECT 1 FROM jsonb_array_elements(z->'member_unit_ids') x WHERE jsonb_typeof(x)<>'string') THEN RAISE EXCEPTION '组成单元ID须字符串' USING ERRCODE='23514';END IF;
 SELECT array_agg(x) INTO members FROM jsonb_array_elements_text(z->'member_unit_ids') x;
 IF coalesce(cardinality(members),0)=0 OR cardinality(members)<>(SELECT count(DISTINCT x) FROM unnest(members)x) THEN RAISE EXCEPTION '组成单元不得空或重复' USING ERRCODE='23514';END IF;
 IF EXISTS(SELECT 1 FROM unnest(members) x WHERE NOT EXISTS(SELECT 1 FROM wc_fire_spatial_unit s WHERE s.task_id=NEW.task_id AND s.unit_id=x AND s.unit_type IN('TOWNSHIP','COUNTY'))) THEN RAISE EXCEPTION '组成单元须同任务乡镇/县，不接受跨任务或未登记ID' USING ERRCODE='23514';END IF;
 IF (SELECT count(DISTINCT unit_type) FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=ANY(members))<>1 THEN RAISE EXCEPTION '组成集合不能混用县与乡镇以致重复覆盖' USING ERRCODE='23514';END IF;
 SELECT ST_UnaryUnion(ST_Collect(geom)) INTO merged FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=ANY(members);
 IF NOT ST_Equals(merged,NEW.geom) THEN RAISE EXCEPTION '分区边界必须等于已记录组成单元合并边界，不能冒挂几何' USING ERRCODE='23514';END IF;
 IF NEW.zoning_level=1 THEN
  IF NEW.parent_zone_result_id IS NOT NULL OR NEW.investment_level IS NOT NULL THEN RAISE EXCEPTION '一级分区不能填写父区或二级投入类别' USING ERRCODE='23514';END IF;
 ELSE
  SELECT * INTO p FROM wc_fire_result_layer WHERE task_id=NEW.task_id AND result_id=NEW.parent_zone_result_id FOR SHARE;
  IF NOT FOUND OR p.output_code<>'PREVENTION_ZONING' OR p.zoning_level IS DISTINCT FROM 1 OR p.period_key IS DISTINCT FROM NEW.period_key OR p.data_status IN('MISSING','REJECTED') OR NEW.investment_level IS NULL OR NOT ST_Covers(p.geom,NEW.geom) THEN RAISE EXCEPTION '二级区须同任务同期间有效父一级区、1—4投入类别及空间包含' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_r18_zoning_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_r18_zoning_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_r18_zoning_guard() IS 'P05分区设计结构校验；只校验身份/层级/组成/几何，不替代正式风险区划和专家审定，不开放成果发布。';


--
-- Name: fn_wc_fire_receipt_assert(jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_receipt_assert(receipt jsonb) RETURNS void
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE m jsonb:=receipt->'metadata_json';k text;
BEGIN
 IF receipt->>'quality_status' IS DISTINCT FROM 'PASSED' OR receipt->>'received_at' IS NULL
  OR coalesce(receipt->>'source_file','') !~ '[^[:space:]]'
  OR m->>'coverage_status' IS DISTINCT FROM 'COMPLETE'
  OR coalesce(m->>'source_file_sha256','') !~ '^[0-9A-Fa-f]{64}$'
  OR coalesce(m->>'source_version','') !~ '[^[:space:]]'
  OR m->>'field_coverage_status' IS DISTINCT FROM 'COMPLETE' THEN
  RAISE EXCEPTION '通过批次须真实接收文件定位/哈希/版本、完整字段与范围检查' USING ERRCODE='23514';END IF;
 FOREACH k IN ARRAY ARRAY['reviewed_by','reviewed_on','reference'] LOOP
  IF jsonb_typeof(m->'quality_review'->k) IS DISTINCT FROM 'string' OR m->'quality_review'->>k !~ '[^[:space:]]' THEN RAISE EXCEPTION '通过批次须质检责任、日期及依据：%',k USING ERRCODE='23514';END IF;
 END LOOP;
 PERFORM public.fn_wc_fire_result_date(m#>>'{quality_review,reviewed_on}');
END $_$;


ALTER FUNCTION public.fn_wc_fire_receipt_assert(receipt jsonb) OWNER TO postgres;

--
-- Name: fn_wc_fire_result_date(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_result_date(value_text text) RETURNS date
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
BEGIN
 IF value_text IS NULL OR value_text !~ '^\d{4}-\d{2}-\d{2}$' THEN
   RAISE EXCEPTION '结果追溯日期须YYYY-MM-DD且非空' USING ERRCODE='23514';
 END IF;
 BEGIN RETURN value_text::date;
 EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN
   RAISE EXCEPTION '结果追溯日期无效' USING ERRCODE='23514';
 END;
END $_$;


ALTER FUNCTION public.fn_wc_fire_result_date(value_text text) OWNER TO postgres;

--
-- Name: fn_wc_fire_result_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_result_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $$



DECLARE



 o wc_fire_output_catalog%ROWTYPE; t wc_fire_assessment_task%ROWTYPE; u wc_fire_spatial_unit%ROWTYPE;



 r wc_fire_rule_definition%ROWTYPE; parent wc_fire_result_layer%ROWTYPE; v wc_fire_indicator_value%ROWTYPE;



 d wc_fire_indicator_definition%ROWTYPE; p wc_normalization_parameter%ROWTYPE; score_r wc_fire_rule_definition%ROWTYPE;



 item jsonb; rule_input jsonb; band jsonb; k text; codes text[]:=ARRAY[]::text[];



 refs jsonb; snapshots jsonb:='[]'::jsonb; snapshot jsonb; applied date; numeric_input numeric; total numeric:=0; matched integer:=0;



 frozen boolean:=false;



BEGIN



 -- 已验结果及其采用快照保留历史；重算另建期间/成果批次/编号。



 IF TG_OP IN ('UPDATE','DELETE') THEN



   frozen := OLD.data_status IN ('VALID','PUBLISHED') OR coalesce(OLD.calculation_refs ? 'adopted_snapshot',false);



   IF frozen THEN



     IF TG_OP='DELETE' THEN RAISE EXCEPTION '已验结果保留历史，不删除' USING ERRCODE='23514'; END IF;



     IF (to_jsonb(NEW)-'data_status'-'calculation_refs') IS DISTINCT FROM (to_jsonb(OLD)-'data_status'-'calculation_refs')



        OR (NEW.calculation_refs-'review'-'publication') IS DISTINCT FROM (OLD.calculation_refs-'review'-'publication')



        OR NEW.data_status NOT IN ('VALID','PUBLISHED','REJECTED')



        OR (OLD.data_status='PUBLISHED' AND NEW.data_status='VALID')



        OR (OLD.data_status='REJECTED' AND NEW.data_status<>'REJECTED') THEN



       RAISE EXCEPTION '已验结果内容/快照不可覆盖，重新计算另建成果批次' USING ERRCODE='23514';



     END IF;



   END IF;



 END IF;



 IF TG_OP='DELETE' THEN RETURN OLD; END IF;



 IF NOT frozen AND coalesce(NEW.calculation_refs ? 'adopted_snapshot',false) THEN



   RAISE EXCEPTION 'adopted_snapshot由入库检查生成，不能外部预填' USING ERRCODE='23514';



 END IF;



 SELECT * INTO o FROM wc_fire_output_catalog WHERE output_code=NEW.output_code;



 IF NOT FOUND THEN RAISE EXCEPTION '成果目录不存在' USING ERRCODE='23503'; END IF;



 IF (o.geometry_type='POLYGON' AND GeometryType(NEW.geom) NOT IN ('POLYGON','MULTIPOLYGON'))



    OR (o.geometry_type='POINT' AND GeometryType(NEW.geom) NOT IN ('POINT','MULTIPOINT'))



    OR (o.geometry_type='LINE' AND GeometryType(NEW.geom) NOT IN ('LINESTRING','MULTILINESTRING')) THEN



   RAISE EXCEPTION '结果几何类型与成果目录不符' USING ERRCODE='23514';



 END IF;



 IF (o.index_or_grade='INDEX' AND num_nonnulls(NEW.grade_code,NEW.grade_name,NEW.zone_code,NEW.zone_name)>0)



    OR (o.index_or_grade='GRADE' AND num_nonnulls(NEW.zone_code,NEW.zone_name)>0)



    OR (o.index_or_grade='ZONE' AND num_nonnulls(NEW.grade_code,NEW.grade_name)>0) THEN



   RAISE EXCEPTION '指数/等级/区划字段用途混用' USING ERRCODE='23514';



 END IF;



 IF NEW.upstream_result_id IS NOT NULL THEN



   SELECT * INTO parent FROM wc_fire_result_layer WHERE result_id=NEW.upstream_result_id AND task_id=NEW.task_id;



   IF NOT FOUND THEN RAISE EXCEPTION '上游结果不存在或跨任务' USING ERRCODE='23503'; END IF;



   IF NOT ((NEW.output_code='HAZARD_GRADE' AND parent.output_code='HAZARD_INDEX')
       OR (NEW.output_code='COMPREHENSIVE_RISK_GRADE' AND parent.output_code='COMPREHENSIVE_RISK_INDEX'))



      OR parent.unit_id IS DISTINCT FROM NEW.unit_id OR parent.period_key IS DISTINCT FROM NEW.period_key



      OR parent.source_batch IS DISTINCT FROM NEW.source_batch THEN



     RAISE EXCEPTION '等级上游须同单元/期间/成果批次的对应指数成果' USING ERRCODE='23514';



   END IF;



 END IF;



 -- P04 linkage check runs for populated draft records as well as formal-status attempts.
 IF NEW.output_code IN ('COMPREHENSIVE_RISK_INDEX','COMPREHENSIVE_RISK_GRADE') THEN
   IF NEW.calculation_refs ? 'risk_linkage_snapshot' AND
      (TG_OP='INSERT' OR NEW.calculation_refs->'risk_linkage_snapshot' IS DISTINCT FROM OLD.calculation_refs->'risk_linkage_snapshot') THEN
     RAISE EXCEPTION '综合风险实际引用快照由数据库生成，不能外部预填或改写' USING ERRCODE='23514';
   END IF;
   snapshot:=public.fn_wc_fire_composite_linkage(NEW);
   IF snapshot IS NOT NULL THEN
     NEW.calculation_refs:=NEW.calculation_refs||jsonb_build_object('risk_linkage_snapshot',snapshot);
   ELSE
     NEW.calculation_refs:=NEW.calculation_refs-'risk_linkage_snapshot';
   END IF;
 END IF;

 IF NEW.data_status NOT IN ('VALID','PUBLISHED') THEN RETURN NEW; END IF;



 IF NOT o.enabled THEN RAISE EXCEPTION '成果目录尚未启用' USING ERRCODE='23514'; END IF;



 IF (o.index_or_grade='INDEX' AND NEW.index_value IS NULL)



    OR (o.index_or_grade='GRADE' AND num_nonnulls(NEW.grade_code,NEW.grade_name)<>2)



    OR (o.index_or_grade='ZONE' AND num_nonnulls(NEW.zone_code,NEW.zone_name)<>2) THEN



   RAISE EXCEPTION '有效成果内容不完整' USING ERRCODE='23514';



 END IF;



 IF NEW.output_code='LYT1063_2025_COUNTY_GRADE' THEN

   SELECT * INTO t FROM wc_fire_assessment_task WHERE task_id=NEW.task_id;

   refs:=NEW.calculation_refs;

   applied:=public.fn_wc_fire_result_date(refs->>'calculated_on');

   snapshot:=public.fn_wc_lyt1063_2025_result_adoption(NEW);

 ELSE

 -- 其它成果本轮仅共用结构检查，不执行其模型或宣称全输入核验。



 IF NEW.output_code NOT IN ('HAZARD_INDEX','HAZARD_GRADE') THEN

   RAISE EXCEPTION '该成果模型尚未完成受控计算/实际集合核验，只能保留PENDING；不得绕过隐患组合或RIE/PRIE核验直接有效/发布' USING ERRCODE='23514';

 END IF;



 IF NEW.unit_id IS NULL OR NEW.period_key IS NULL OR NEW.source_batch IS NULL OR NEW.source_rule_id IS NULL



    OR jsonb_typeof(NEW.calculation_refs) IS DISTINCT FROM 'object' THEN



   RAISE EXCEPTION '有效两图须空间单元、期间、成果批次、采用规则及追溯对象' USING ERRCODE='23514';



 END IF;



 SELECT * INTO t FROM wc_fire_assessment_task WHERE task_id=NEW.task_id;



 SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;



 IF NOT FOUND THEN RAISE EXCEPTION '空间单元不属于本任务' USING ERRCODE='23503'; END IF;



 IF NOT coalesce(o.allowed_unit_types ? u.unit_type,false) THEN RAISE EXCEPTION '成果尺度未登记于目录采用契约' USING ERRCODE='23514';END IF;

 IF NOT ST_Equals(NEW.geom,u.geom) THEN RAISE EXCEPTION '两图边界快照与采用空间单元不一致' USING ERRCODE='23514'; END IF;



 SELECT * INTO r FROM wc_fire_rule_definition WHERE task_id=NEW.task_id AND rule_id=NEW.source_rule_id;



 IF NOT FOUND THEN RAISE EXCEPTION '采用规则不存在或跨任务' USING ERRCODE='23503'; END IF;



 refs := NEW.calculation_refs;



 FOREACH k IN ARRAY ARRAY['model_version','rule_version','method_version','calculated_on'] LOOP



   IF jsonb_typeof(refs->k) IS DISTINCT FROM 'string' OR refs->>k !~ '[^[:space:]]' THEN



     RAISE EXCEPTION '两图计算追溯缺有效字段：%',k USING ERRCODE='23514';



   END IF;



 END LOOP;



 applied := fn_wc_fire_result_date(refs->>'calculated_on');



 IF r.approval_status<>'APPROVED' OR r.rule_version IS DISTINCT FROM t.rule_version



    OR r.parameter_json->>'model_version' IS DISTINCT FROM t.model_version



    OR refs->>'model_version' IS DISTINCT FROM t.model_version OR refs->>'rule_version' IS DISTINCT FROM r.rule_version



    OR r.parameter_json->>'target_output_code' IS DISTINCT FROM NEW.output_code



    OR NOT coalesce(r.parameter_json->'spatial_unit_types' ? u.unit_type,false)



    OR (r.effective_from IS NOT NULL AND applied<r.effective_from) OR (r.effective_to IS NOT NULL AND applied>r.effective_to) THEN



   RAISE EXCEPTION '规则状态、目标、版本、尺度或计算采用期不适用' USING ERRCODE='23514';



 END IF;



 IF NEW.output_code='HAZARD_INDEX' THEN



   IF r.parameter_json->>'rule_stage'='SPATIAL_AGGREGATION' THEN



     snapshot:=public.fn_wc_fire_spatial_index_adoption(NEW,r);



   ELSE







   IF r.parameter_json->>'rule_stage' IS DISTINCT FROM 'INDEX_COMPOSITION'



      OR r.parameter_json->>'method_code' IS DISTINCT FROM 'WEIGHTED_SUM' OR u.unit_type<>'FOREST_COMPARTMENT' THEN



     RAISE EXCEPTION '当前只核验小班指标加权合成，其它尺度须先完成汇总模型审核' USING ERRCODE='23514';



   END IF;



   IF NEW.upstream_result_id IS NOT NULL OR jsonb_typeof(refs->'indicator_refs') IS DISTINCT FROM 'array' THEN



     RAISE EXCEPTION '指数须明确具体指标记录集合，不用等级结果替代' USING ERRCODE='23514';



   END IF;



   IF jsonb_array_length(refs->'indicator_refs')=0 THEN RAISE EXCEPTION '指数指标引用集合不可空' USING ERRCODE='23514'; END IF;



   FOR item IN SELECT value FROM jsonb_array_elements(refs->'indicator_refs') LOOP



     FOREACH k IN ARRAY ARRAY['task_id','unit_id','indicator_code','period_key','value_field'] LOOP



       IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR item->>k !~ '[^[:space:]]' THEN



         RAISE EXCEPTION '指标引用需确切主键及取值字段：%',k USING ERRCODE='23514';



       END IF;



     END LOOP;



     IF item->>'task_id'<>NEW.task_id OR item->>'unit_id'<>NEW.unit_id OR item->>'indicator_code'=ANY(codes) THEN



       RAISE EXCEPTION '指标引用跨任务/单元或重复' USING ERRCODE='23514';



     END IF;



     SELECT value INTO rule_input FROM jsonb_array_elements(r.parameter_json->'inputs')



     WHERE value->>'indicator_code'=item->>'indicator_code';



     IF NOT FOUND OR rule_input->>'value_field' IS DISTINCT FROM item->>'value_field' THEN



       RAISE EXCEPTION '指标或读取字段与合成规则不一致' USING ERRCODE='23514';



     END IF;



     SELECT * INTO v FROM wc_fire_indicator_value WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id



       AND indicator_code=item->>'indicator_code' AND period_key=item->>'period_key';



     IF NOT FOUND THEN RAISE EXCEPTION '具体指标值记录不存在' USING ERRCODE='23503'; END IF;



     IF v.value_status<>'VALID' OR NOT EXISTS(SELECT 1 FROM wc_fire_quality_dictionary WHERE quality_code=v.quality_code AND status='ACTIVE') THEN



       RAISE EXCEPTION '指标值未有效或质量代码停用' USING ERRCODE='23514';



     END IF;



     IF EXISTS(SELECT 1 FROM jsonb_array_elements(v.input_refs->'inputs') b



       WHERE NOT EXISTS(SELECT 1 FROM wc_fire_task_source s WHERE s.task_id=NEW.task_id



         AND s.source_code=b->>'source_code' AND s.source_batch=b->>'source_batch' AND s.quality_status='PASSED')) THEN



       RAISE EXCEPTION '所用指标的来源批次质量现状未通过' USING ERRCODE='23514';



     END IF;



     SELECT * INTO d FROM wc_fire_indicator_definition WHERE indicator_code=v.indicator_code;



     p := NULL; score_r := NULL;



     IF item->>'value_field'='normalized_value' THEN



       numeric_input := v.normalized_value;



       SELECT * INTO p FROM wc_normalization_parameter WHERE param_id=v.normalization_param_id AND indicator_code=v.indicator_code;



        PERFORM public.fn_wc_normalization_adoption(v.normalization_param_id,NEW.task_id,v.indicator_code,



            v.unit,v.raw_value,v.normalized_value,true);



     ELSIF item->>'value_field'='assigned_score' THEN



       numeric_input := v.assigned_score;



       SELECT * INTO score_r FROM wc_fire_rule_definition WHERE task_id=NEW.task_id AND rule_id=v.score_rule_id;



       IF NOT FOUND OR score_r.approval_status<>'APPROVED' OR score_r.rule_version<>t.rule_version



          OR score_r.parameter_json->>'model_version' IS DISTINCT FROM t.model_version



          OR score_r.parameter_json->>'indicator_code' IS DISTINCT FROM v.indicator_code



          OR score_r.parameter_json->>'rule_stage' IS DISTINCT FROM 'INDICATOR_PROCESS' THEN



         RAISE EXCEPTION '采用指标评分规则现状不适用' USING ERRCODE='23514';



       END IF;



     ELSE RAISE EXCEPTION '合成只能读取标准化值或评分' USING ERRCODE='23514'; END IF;



     IF numeric_input IS NULL OR numeric_input IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN



       RAISE EXCEPTION '规则所需指标处理值为空或非有限' USING ERRCODE='23514';



     END IF;



     total := total+numeric_input*(rule_input->>'weight')::numeric;



     snapshots := snapshots||jsonb_build_array(jsonb_build_object('value',to_jsonb(v),'definition',to_jsonb(d),'normalization_parameter',to_jsonb(p),'score_rule',to_jsonb(score_r)));



     codes := array_append(codes,v.indicator_code);



   END LOOP;



   IF cardinality(codes)<>jsonb_array_length(r.parameter_json->'inputs')



      OR EXISTS(SELECT 1 FROM wc_fire_output_input WHERE output_code='HAZARD_INDEX' AND required_flag AND indicator_code IS NOT NULL AND NOT(indicator_code=ANY(codes)))



      OR EXISTS(SELECT 1 FROM unnest(codes) c WHERE NOT EXISTS(SELECT 1 FROM wc_fire_output_input WHERE output_code='HAZARD_INDEX' AND required_flag AND indicator_code=c)) THEN



     RAISE EXCEPTION '实际输入集合与规则及当前危险性必选清单不一致' USING ERRCODE='23514';



   END IF;



   IF NEW.index_value IS DISTINCT FROM round(total,8) THEN



     RAISE EXCEPTION '指数与所引用处理值和权重的加权结果不一致' USING ERRCODE='23514';



   END IF;



   snapshot := jsonb_build_object('task',to_jsonb(t),'unit',to_jsonb(u)-'geom','rule',to_jsonb(r),'indicator_values',snapshots);



   END IF;



 ELSE



   IF r.rule_type<>'HAZARD_GRADE' OR r.parameter_json->>'rule_stage' IS DISTINCT FROM 'GRADE_CLASSIFICATION'



      OR r.parameter_json->>'upstream_output_code' IS DISTINCT FROM 'HAZARD_INDEX' OR NEW.upstream_result_id IS NULL THEN



     RAISE EXCEPTION '等级须危险性分级规则与确切上游指数' USING ERRCODE='23514';



   END IF;



   IF parent.data_status NOT IN ('VALID','PUBLISHED') OR NEW.index_value IS DISTINCT FROM parent.index_value



      OR NOT ST_Equals(NEW.geom,parent.geom)



      OR parent.calculation_refs->>'model_version' IS DISTINCT FROM refs->>'model_version'



      OR parent.calculation_refs->>'rule_version' IS DISTINCT FROM refs->>'rule_version'



      OR applied<fn_wc_fire_result_date(parent.calculation_refs->>'calculated_on') THEN



     RAISE EXCEPTION '上游指数无效或数值、边界、采用版本不一致' USING ERRCODE='23514';



   END IF;



   PERFORM public.fn_wc_normalization_source_refs(r.parameter_json->'grade_parameter_source',NEW.task_id,true);



   FOR band IN SELECT value FROM jsonb_array_elements(r.parameter_json->'grades') LOOP



     IF (NEW.index_value>(band->>'lower')::numeric OR (NEW.index_value=(band->>'lower')::numeric AND (band->>'lower_inclusive')::boolean))



        AND (NEW.index_value<(band->>'upper')::numeric OR (NEW.index_value=(band->>'upper')::numeric AND (band->>'upper_inclusive')::boolean)) THEN



       matched := matched+1;



       IF NEW.grade_code IS DISTINCT FROM band->>'grade_code' OR NEW.grade_name IS DISTINCT FROM band->>'grade_name' THEN



         RAISE EXCEPTION '等级代码/名称与指数实际所属区间不一致' USING ERRCODE='23514';



       END IF;



     END IF;



   END LOOP;



   IF matched<>1 THEN RAISE EXCEPTION '指数未恰好落入一个等级区间' USING ERRCODE='23514'; END IF;



   snapshot := jsonb_build_object('task',to_jsonb(t),'unit',to_jsonb(u)-'geom','rule',to_jsonb(r),'upstream_index',to_jsonb(parent)-'geom'-'calculation_refs');



 END IF;



 END IF; -- 新版县级与原危险性两图分别核验，共用历史快照及发布检查。

 -- 快照由所引用的实际库记录生成，不接受外部声明替代；已验记录不重新覆盖历史快照。



 IF NOT frozen THEN NEW.calculation_refs := refs||jsonb_build_object('adopted_snapshot',snapshot); END IF;



 IF NEW.data_status='PUBLISHED' THEN



   IF t.task_status NOT IN ('REVIEWED','PUBLISHED') THEN RAISE EXCEPTION '发布两图前任务须已复核' USING ERRCODE='23514'; END IF;



   FOREACH k IN ARRAY ARRAY['review','publication'] LOOP



     IF jsonb_typeof(refs->k) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '发布须复核及发布记录' USING ERRCODE='23514'; END IF;



   END LOOP;



   IF jsonb_typeof(refs->'review'->'reviewed_by') IS DISTINCT FROM 'string' OR refs->'review'->>'reviewed_by' !~ '[^[:space:]]'



      OR jsonb_typeof(refs->'review'->'reference') IS DISTINCT FROM 'string' OR refs->'review'->>'reference' !~ '[^[:space:]]'



      OR jsonb_typeof(refs->'publication'->'published_by') IS DISTINCT FROM 'string' OR refs->'publication'->>'published_by' !~ '[^[:space:]]'



      OR jsonb_typeof(refs->'publication'->'reference') IS DISTINCT FROM 'string' OR refs->'publication'->>'reference' !~ '[^[:space:]]'



      OR jsonb_typeof(refs->'publication'->'artifact_ref') IS DISTINCT FROM 'string' OR refs->'publication'->>'artifact_ref' !~ '[^[:space:]]' THEN



     RAISE EXCEPTION '复核/发布人员、依据及成果定位不完整' USING ERRCODE='23514';



   END IF;



   IF fn_wc_fire_result_date(refs->'review'->>'reviewed_on')<applied



      OR fn_wc_fire_result_date(refs->'publication'->>'published_on')<fn_wc_fire_result_date(refs->'review'->>'reviewed_on') THEN



     RAISE EXCEPTION '计算、复核、发布日期顺序错误' USING ERRCODE='23514';



   END IF;



 END IF;



 RETURN NEW;



END $$;


ALTER FUNCTION public.fn_wc_fire_result_prerequisites() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_result_prerequisites(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_result_prerequisites() IS '两图结果入库关联及小班加权/等级映射核对、采用快照及历史保留；不执行原始数据统计、其它尺度汇总、其它成果模型或外部发布。';


--
-- Name: fn_wc_fire_rule_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_rule_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$

DECLARE

 p jsonb; stage text; k text; item jsonb; task_model text; task_rules text;

 codes text[] := ARRAY[]::text[]; code text; kind text; target_kind text; target text;

 w numeric; total_weight numeric := 0; lo numeric; hi numeric; prev_hi numeric;

 lo_closed boolean; hi_closed boolean; prev_closed boolean; domain_lo numeric; domain_hi numeric;

 confirmation_date date; n integer := 0;

BEGIN

 -- 确认后冻结计算语义，修改内容另建编号/版本；备注仍可补充。

 IF TG_OP IN ('UPDATE','DELETE') AND OLD.approval_status IN ('APPROVED','SUPERSEDED') THEN

   IF TG_OP='DELETE' THEN

     RAISE EXCEPTION '已确认/已替代规则保留历史，不删除' USING ERRCODE='23514';

   END IF;

   IF (to_jsonb(NEW)-'note'-'approval_status') IS DISTINCT FROM (to_jsonb(OLD)-'note'-'approval_status')

      OR (OLD.approval_status='APPROVED' AND NEW.approval_status NOT IN ('APPROVED','SUPERSEDED'))

      OR (OLD.approval_status='SUPERSEDED' AND NEW.approval_status<>'SUPERSEDED') THEN

     RAISE EXCEPTION '已确认规则计算内容不可覆盖；新建规则编号和版本，旧规则可置SUPERSEDED' USING ERRCODE='23514';

   END IF;

 END IF;

 IF TG_OP='DELETE' THEN RETURN OLD; END IF;

 -- 原待确认记录允许资料暂缺；已有APPROVED备注更新不重新匹配现行任务版本。

 IF NEW.approval_status<>'APPROVED' THEN RETURN NEW; END IF;

 IF TG_OP='UPDATE' AND OLD.approval_status='APPROVED' THEN RETURN NEW; END IF;

 p := NEW.parameter_json;

 IF NEW.source_code IS NULL OR NEW.formula_expression IS NULL OR NEW.formula_expression !~ '[^[:space:]]'

    OR jsonb_typeof(p) IS DISTINCT FROM 'object' THEN

   RAISE EXCEPTION '确认规则须来源、公式和参数对象完整' USING ERRCODE='23514';

 END IF;

 SELECT model_version,rule_version INTO task_model,task_rules FROM wc_fire_assessment_task WHERE task_id=NEW.task_id;

 IF NOT FOUND THEN RAISE EXCEPTION '规则任务不存在' USING ERRCODE='23503'; END IF;

 FOREACH k IN ARRAY ARRAY['rule_stage','model_version','method_code','validity_mode'] LOOP

   IF jsonb_typeof(p->k) IS DISTINCT FROM 'string' OR p->>k !~ '[^[:space:]]' THEN

     RAISE EXCEPTION '确认规则缺少有效参数：%',k USING ERRCODE='23514';

   END IF;

 END LOOP;

 stage := p->>'rule_stage';

 IF NEW.rule_version IS DISTINCT FROM task_rules OR p->>'model_version' IS DISTINCT FROM task_model THEN

   RAISE EXCEPTION '规则采用版本/模型与任务不一致' USING ERRCODE='23514';

 END IF;

 IF (p->>'validity_mode'='DATED' AND NEW.effective_from IS NULL)

    OR (p->>'validity_mode'='UNBOUNDED' AND num_nonnulls(NEW.effective_from,NEW.effective_to)>0)

    OR p->>'validity_mode' NOT IN ('DATED','UNBOUNDED') THEN

   RAISE EXCEPTION '须声明适用期；DATED需起点，UNBOUNDED不得混填日期' USING ERRCODE='23514';

 END IF;

 IF jsonb_typeof(p->'spatial_unit_types') IS DISTINCT FROM 'array' THEN

   RAISE EXCEPTION '规则须适用空间尺度数组' USING ERRCODE='23514';

 END IF;

 IF jsonb_array_length(p->'spatial_unit_types')=0 THEN

   RAISE EXCEPTION '适用空间尺度不可空' USING ERRCODE='23514';

 END IF;

 FOR item IN SELECT value FROM jsonb_array_elements(p->'spatial_unit_types') LOOP

   IF jsonb_typeof(item) IS DISTINCT FROM 'string' OR item#>>'{}' NOT IN

     ('FOREST_COMPARTMENT','GRID_30_ARCSEC','GRID_1KM','TOWNSHIP','COUNTY','ADMIN','BUILDING','HAZARD_OBJECT')

     OR item#>>'{}'=ANY(codes) THEN

     RAISE EXCEPTION '空间尺度未知或重复' USING ERRCODE='23514';

   END IF;

   codes := array_append(codes,item#>>'{}');

 END LOOP;

 IF jsonb_typeof(p->'evidence_refs') IS DISTINCT FROM 'array' THEN

   RAISE EXCEPTION '确认规则须依据文件数组' USING ERRCODE='23514';

 END IF;

 IF jsonb_array_length(p->'evidence_refs')=0 THEN

   RAISE EXCEPTION '确认规则至少有一项定位依据' USING ERRCODE='23514';

 END IF;

 FOR item IN SELECT value FROM jsonb_array_elements(p->'evidence_refs') LOOP

   FOREACH k IN ARRAY ARRAY['source_code','document_ref','locator'] LOOP

     IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR item->>k !~ '[^[:space:]]' THEN

       RAISE EXCEPTION '依据须登记来源、文件定位及章节页码：%',k USING ERRCODE='23514';

     END IF;

   END LOOP;

   IF NOT EXISTS(SELECT 1 FROM wc_fire_source_registry WHERE source_code=item->>'source_code') THEN

     RAISE EXCEPTION '规则依据来源未登记' USING ERRCODE='23503';

   END IF;

 END LOOP;

 FOREACH k IN ARRAY ARRAY['confirmed_by','confirmed_on','reference'] LOOP

   IF jsonb_typeof(p->'confirmation'->k) IS DISTINCT FROM 'string' OR p->'confirmation'->>k !~ '[^[:space:]]' THEN

     RAISE EXCEPTION '确认记录缺失：%',k USING ERRCODE='23514';

   END IF;

 END LOOP;

 IF p->'confirmation'->>'confirmed_on' !~ '^\d{4}-\d{2}-\d{2}$' THEN

   RAISE EXCEPTION '确认日期须YYYY-MM-DD' USING ERRCODE='23514';

 END IF;

 BEGIN confirmation_date := (p->'confirmation'->>'confirmed_on')::date;

 EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN

   RAISE EXCEPTION '确认日期无效' USING ERRCODE='23514';

 END;



 IF stage='COUNTY_FIRE_ZONING' THEN
   IF p#>>'{confirmation,scope}' IS DISTINCT FROM 'FORMAL_TASK_ADOPTION'
     OR p#>>'{confirmation,task_id}' IS DISTINCT FROM NEW.task_id THEN
    RAISE EXCEPTION '新版正式批准须本任务的正式采用确认，实施确认不能代替' USING ERRCODE='23514';END IF;
   IF NEW.rule_type<>'ZONING' OR NEW.source_code IS DISTINCT FROM 'SRC_WC_LYT1063_2025'
     OR NEW.rule_version IS DISTINCT FROM 'LYT1063_2025' OR p->>'method_code' IS DISTINCT FROM 'LYT1063_2025_SEVEN_FACTORS'
     OR p->>'target_output_code' IS DISTINCT FROM 'LYT1063_2025_COUNTY_GRADE' OR p->'spatial_unit_types' IS DISTINCT FROM '["COUNTY"]'::jsonb
     OR p->>'standard_parameters_status' IS DISTINCT FROM 'CONFIRMED'
     OR p->>'execution_enabled' IS DISTINCT FROM 'true' OR p->>'formal_result_writes_enabled' IS DISTINCT FROM 'true'
     OR jsonb_typeof(p->'input_contract') IS DISTINCT FROM 'array' OR jsonb_array_length(p->'input_contract')<>14
     OR jsonb_typeof(p->'classification_entries') IS DISTINCT FROM 'array' OR jsonb_array_length(p->'classification_entries')<>56
     OR coalesce(p->>'method_version','') !~ '[^[:space:]]'
     OR p#>>'{rounding,adoption_status}' IS DISTINCT FROM 'USER_CONFIRMED'
     OR p#>>'{project_adjustment_policy,status}' IS DISTINCT FROM 'USER_CONFIRMED_PROJECT_POLICY' THEN
    RAISE EXCEPTION '新版县级规则类型、来源、完整参数、项目采用或正式执行契约未齐' USING ERRCODE='23514';END IF;
   IF EXISTS(SELECT 1 FROM jsonb_array_elements(p->'input_contract') x WHERE NOT EXISTS(SELECT 1 FROM wc_fire_indicator_definition d WHERE d.indicator_code=x->>'indicator_code' AND d.value_type='NUMERIC' AND d.default_unit=x->>'unit'))
     OR (SELECT count(DISTINCT x->>'indicator_code') FROM jsonb_array_elements(p->'input_contract')x)<>14 THEN
    RAISE EXCEPTION '新版县级输入定义须完整唯一且单位一致' USING ERRCODE='23514';END IF;
   IF NOT EXISTS(SELECT 1 FROM wc_fire_assessment_task t WHERE t.task_id=NEW.task_id AND t.spatial_unit='COUNTY'
     AND t.data_start IS NOT NULL AND t.data_end=((t.data_start+INTERVAL '5 years')::date-1)
     AND t.fire_season_start IS NOT NULL AND t.fire_season_end IS NOT NULL AND t.source_batch IS NOT NULL) THEN
    RAISE EXCEPTION '新版正式批准前须明确县级任务五年窗口、防火期及来源批次' USING ERRCODE='23514';END IF;
 ELSIF stage='WEATHER_COMPOSITION' THEN

   IF NEW.rule_type<>'NORMALIZATION' OR p->>'method_code' IS DISTINCT FROM 'MONTH_MEAN'

     OR p->>'aggregation' IS DISTINCT FROM 'ARITHMETIC_MEAN'

     OR p->>'baseline_start_year' IS DISTINCT FROM '2011' OR p->>'baseline_end_year' IS DISTINCT FROM '2020'

     OR coalesce(p->>'value_conversion','') NOT IN ('IDENTITY','DIVIDE_CALENDAR_DAYS')

     OR coalesce(p->>'aggregation_basis_ref','') !~ '[^[:space:]]'

     OR coalesce(p->>'input_stat_method_version','') !~ '[^[:space:]]'

     OR coalesce(p->>'assignment_method_version','') !~ '[^[:space:]]' THEN

     RAISE EXCEPTION '气象须核定2011—2020月均合成、统计定义及赋值/单位方法' USING ERRCODE='23514';END IF;

   IF jsonb_typeof(p->'months') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '气象合成须明确月份集合' USING ERRCODE='23514';END IF;

   IF jsonb_array_length(p->'months')=0 OR EXISTS(SELECT 1 FROM jsonb_array_elements(p->'months') x WHERE jsonb_typeof(x)<>'number' OR x::text !~ '^([1-9]|1[0-2])$')

     OR (SELECT count(DISTINCT x) FROM jsonb_array_elements(p->'months') x)<>jsonb_array_length(p->'months') THEN RAISE EXCEPTION '月份须1—12唯一非空整数集合' USING ERRCODE='23514';END IF;

   IF NOT EXISTS(SELECT 1 FROM wc_fire_indicator_definition WHERE indicator_code=p->>'indicator_code' AND indicator_group='WEATHER' AND value_type='NUMERIC' AND default_unit=p->>'output_unit') THEN

     RAISE EXCEPTION '气象指标/单位未登记一致' USING ERRCODE='23514';END IF;

   IF p->>'weather_field' IS DISTINCT FROM (CASE p->>'indicator_code'

     WHEN 'GALE_DAYS' THEN 'gale_days' WHEN 'AVG_WIND_SPEED' THEN 'avg_wind_speed_m_s'

     WHEN 'MONTHLY_PRECIP' THEN 'total_precipitation_mm' WHEN 'AVG_TEMPERATURE' THEN 'avg_temperature_c'

     WHEN 'MAX_TEMPERATURE' THEN 'max_temperature_c' WHEN 'MIN_RELATIVE_HUMIDITY' THEN 'min_relative_humidity_pct' END)

     OR (p->>'value_conversion'='DIVIDE_CALENDAR_DAYS' AND p->>'weather_field'<>'total_precipitation_mm') THEN

     RAISE EXCEPTION '气象原字段/转换与指标定义不一致' USING ERRCODE='23514';END IF;

 ELSIF stage='SPATIAL_AGGREGATION' THEN

   IF NEW.rule_type<>'NORMALIZATION' OR p->>'target_output_code' IS DISTINCT FROM 'HAZARD_INDEX'

     OR p->>'missing_value_policy' IS DISTINCT FROM 'REJECT'

     OR coalesce(p->>'method_version','') !~ '[^[:space:]]' THEN RAISE EXCEPTION '空间汇总须危险指数目标、明确版本及缺值拒绝' USING ERRCODE='23514';END IF;

   IF p->>'method_code'='CENTER_LOOKUP' THEN

     IF coalesce(p->>'center_method','') NOT IN ('CENTROID','POINT_ON_SURFACE') OR p->>'non_forest_policy' IS DISTINCT FROM 'ZERO_WHEN_CONFIRMED'

       OR EXISTS(SELECT 1 FROM jsonb_array_elements_text(p->'spatial_unit_types') x WHERE x NOT IN ('GRID_30_ARCSEC','GRID_1KM')) THEN RAISE EXCEPTION '中心点方法/标准格网/非林区零值依据不完整' USING ERRCODE='23514';END IF;

   ELSIF p->>'method_code'='TOWNSHIP_POSITIVE_MEAN_FOREST_SHARE' THEN

     IF p->'spatial_unit_types'<>'["TOWNSHIP"]'::jsonb OR coalesce(p->>'input_unit_type','') NOT IN ('GRID_30_ARCSEC','GRID_1KM') THEN RAISE EXCEPTION '乡镇方法须明确一种标准格网尺度' USING ERRCODE='23514';END IF;

   ELSIF p->>'method_code'='COUNTY_FOREST_WEIGHTED_MEAN' THEN

     IF p->'spatial_unit_types'<>'["COUNTY"]'::jsonb THEN RAISE EXCEPTION '县域方法须县单元' USING ERRCODE='23514';END IF;

   ELSE RAISE EXCEPTION '尚未支持的空间方法不批准' USING ERRCODE='23514';END IF;

 ELSIF stage='INDICATOR_PROCESS' THEN



   IF NEW.rule_type NOT IN ('NORMALIZATION','VULNERABILITY','HAZARD_HAZARD') THEN

     RAISE EXCEPTION '指标处理阶段与规则类型不符' USING ERRCODE='23514';

   END IF;

   SELECT value_type INTO kind FROM wc_fire_indicator_definition WHERE indicator_code=p->>'indicator_code';

   IF NOT FOUND THEN RAISE EXCEPTION '处理指标不存在' USING ERRCODE='23503'; END IF;

   IF (kind='NUMERIC' AND p->>'input_field' IS DISTINCT FROM 'raw_value')

      OR (kind='CODE' AND p->>'input_field' IS DISTINCT FROM 'raw_code') OR kind NOT IN ('NUMERIC','CODE')

      OR (p->>'method_code' IS DISTINCT FROM 'DIRECT' AND coalesce(p->>'output_field','') NOT IN ('normalized_value','assigned_score'))
      OR (p->>'method_code'='DIRECT' AND p->>'output_field' IS DISTINCT FROM p->>'input_field') THEN

     RAISE EXCEPTION '指标处理原值/输出字段与定义不符' USING ERRCODE='23514';

   END IF;

   IF p->>'method_code'='DIRECT' THEN
     IF coalesce(p#>>'{method_parameters,source_object}','') !~ '[^[:space:]]'
       OR coalesce(p#>>'{method_parameters,source_value_field}','') !~ '[^[:space:]]'
       OR p#>>'{method_parameters,missing_value_policy}' IS DISTINCT FROM 'REJECT'
       OR coalesce(p#>>'{method_parameters,source_unit}','') !~ '[^[:space:]]'
       OR (kind='CODE' AND jsonb_typeof(p#>'{method_parameters,allowed_codes}') IS DISTINCT FROM 'array') THEN
       RAISE EXCEPTION '直接采用须确切来源字段/单位、缺值拒绝及代码域，不伪造处理值' USING ERRCODE='23514';END IF;
     IF kind='CODE' AND (jsonb_array_length(p#>'{method_parameters,allowed_codes}')=0 OR EXISTS(SELECT 1 FROM jsonb_array_elements(p#>'{method_parameters,allowed_codes}') x WHERE jsonb_typeof(x)<>'string' OR x#>>'{}' !~ '[^[:space:]]')) THEN
       RAISE EXCEPTION '直接代码须明确非空代码域' USING ERRCODE='23514';END IF;
   END IF;
   IF jsonb_typeof(p->'method_parameters') IS DISTINCT FROM 'object' OR p->'method_parameters'='{}'::jsonb THEN

     RAISE EXCEPTION '指标处理需非空方法参数，分类映射/分段/标准化方法逐项追溯' USING ERRCODE='23514';

   END IF;

 ELSE

   target := p->>'target_output_code';

   SELECT index_or_grade INTO target_kind FROM wc_fire_output_catalog WHERE output_code=target;

   IF NOT FOUND THEN RAISE EXCEPTION '规则目标成果未登记' USING ERRCODE='23503'; END IF;

   IF stage='INDEX_COMPOSITION' THEN

     IF target_kind<>'INDEX' OR NEW.rule_type NOT IN ('NORMALIZATION','VULNERABILITY','HAZARD_HAZARD') THEN

       RAISE EXCEPTION '指数合成不能登记为等级转换或使用等级类型' USING ERRCODE='23514';

     END IF;

     IF p->>'missing_value_policy' IS DISTINCT FROM 'REJECT' OR jsonb_typeof(p->'inputs') IS DISTINCT FROM 'array' THEN

       RAISE EXCEPTION '指数合成须明确输入全集与缺值拒绝策略，不自动补零' USING ERRCODE='23514';

     END IF;

     IF jsonb_array_length(p->'inputs')=0 THEN RAISE EXCEPTION '合成输入不可空' USING ERRCODE='23514'; END IF;

     codes := ARRAY[]::text[];

     FOR item IN SELECT value FROM jsonb_array_elements(p->'inputs') LOOP

       code := item->>'indicator_code';

       IF jsonb_typeof(item->'indicator_code') IS DISTINCT FROM 'string' OR code !~ '[^[:space:]]'

          OR coalesce(item->>'value_field','') NOT IN ('normalized_value','assigned_score') OR code=ANY(codes) THEN

         RAISE EXCEPTION '合成须唯一指标代码及明确处理值字段' USING ERRCODE='23514';

       END IF;

       IF NOT EXISTS(SELECT 1 FROM wc_fire_indicator_definition WHERE indicator_code=code) THEN

         RAISE EXCEPTION '合成指标不存在：%',code USING ERRCODE='23503';

       END IF;

       codes := array_append(codes,code);

       IF p->>'method_code'='WEIGHTED_SUM' THEN

         IF jsonb_typeof(item->'weight') IS DISTINCT FROM 'number' THEN RAISE EXCEPTION '权重须数值' USING ERRCODE='23514'; END IF;

         w := (item->>'weight')::numeric;

         IF w<0 OR w>1 THEN RAISE EXCEPTION '加权求和权重超范围' USING ERRCODE='23514'; END IF;

         total_weight := total_weight+w;

       END IF;

     END LOOP;

     IF p->>'method_code'='WEIGHTED_SUM' AND abs(total_weight-1)>0.00000001 THEN

       RAISE EXCEPTION '加权求和权重合计须为1，未自动调整权重' USING ERRCODE='23514';

     END IF;

     IF target='HAZARD_INDEX' AND p->'spatial_unit_types' ? 'FOREST_COMPARTMENT' THEN

       IF p->>'method_code'<>'WEIGHTED_SUM'

          OR EXISTS(SELECT 1 FROM wc_fire_output_input WHERE output_code='HAZARD_INDEX' AND required_flag AND indicator_code IS NOT NULL AND NOT(indicator_code=ANY(codes)))

          OR EXISTS(SELECT 1 FROM unnest(codes) c WHERE NOT EXISTS(SELECT 1 FROM wc_fire_output_input WHERE output_code='HAZARD_INDEX' AND required_flag AND indicator_code=c)) THEN

         RAISE EXCEPTION '小班危险性合成须与当前成果输入指标清单逐项一致' USING ERRCODE='23514';

       END IF;

     END IF;

     IF p->>'method_code'<>'WEIGHTED_SUM' THEN

       RAISE EXCEPTION '本轮只启用单元指标加权结构；空间汇总/其它模型须另审完整参数，先PENDING' USING ERRCODE='23514';

     END IF;

   ELSIF stage='GRADE_CLASSIFICATION' THEN

     IF p->>'target_output_code'='HAZARD_GRADE' THEN

       IF jsonb_typeof(p->'grade_parameter_source') IS DISTINCT FROM 'object'

         OR p->'grade_parameter_source'->>'sample_scope' IS DISTINCT FROM 'NATIONAL'

         OR jsonb_array_length(p->'spatial_unit_types')<>1

         OR p->'grade_parameter_source'->>'spatial_unit_type' IS DISTINCT FROM p->'spatial_unit_types'->>0 THEN

         RAISE EXCEPTION '危险分级须本尺度全国分级参数来源，不能通用一套切点' USING ERRCODE='23514';END IF;

       PERFORM fn_wc_normalization_source_refs(p->'grade_parameter_source',NEW.task_id,true);

     END IF;



     IF target_kind<>'GRADE' OR NEW.rule_type NOT IN ('HAZARD_GRADE','RISK_GRADE','HAZARD_HAZARD') THEN

       RAISE EXCEPTION '等级转换阶段与规则类型/目标不符' USING ERRCODE='23514';

     END IF;

     IF (target='HAZARD_GRADE' AND NEW.rule_type<>'HAZARD_GRADE')

        OR (target='KEY_HAZARD_GRADE' AND NEW.rule_type<>'HAZARD_HAZARD')

        OR (target IN ('COMPREHENSIVE_RISK_GRADE','ECONOMIC_RISK_GRADE','POPULATION_RISK_GRADE','BUILDING_RISK_GRADE','FOREST_RESOURCE_RISK_GRADE') AND NEW.rule_type<>'RISK_GRADE') THEN

       RAISE EXCEPTION '等级规则业务类型与目标成果不对应' USING ERRCODE='23514';

     END IF;

     SELECT index_or_grade INTO kind FROM wc_fire_output_catalog WHERE output_code=p->>'upstream_output_code';

     IF NOT FOUND OR kind<>'INDEX' THEN RAISE EXCEPTION '等级上游须已登记指数成果' USING ERRCODE='23503'; END IF;

     IF target='HAZARD_GRADE' AND p->>'upstream_output_code' IS DISTINCT FROM 'HAZARD_INDEX' THEN

       RAISE EXCEPTION '危险性等级必须复用危险性指数' USING ERRCODE='23514';

     END IF;

     IF jsonb_typeof(p->'index_domain'->'lower') IS DISTINCT FROM 'number' OR jsonb_typeof(p->'index_domain'->'upper') IS DISTINCT FROM 'number'

        OR jsonb_typeof(p->'grades') IS DISTINCT FROM 'array' THEN

       RAISE EXCEPTION '分级须指数范围和等级数组' USING ERRCODE='23514';

     END IF;

     domain_lo := (p->'index_domain'->>'lower')::numeric; domain_hi := (p->'index_domain'->>'upper')::numeric;

     IF domain_lo>=domain_hi OR jsonb_array_length(p->'grades')<2 THEN

       RAISE EXCEPTION '指数范围须有序，等级数组至少两段' USING ERRCODE='23514';

     END IF;

     codes := ARRAY[]::text[];

     FOR item IN SELECT value FROM jsonb_array_elements(p->'grades') LOOP

       FOREACH k IN ARRAY ARRAY['grade_code','grade_name'] LOOP

         IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR item->>k !~ '[^[:space:]]' THEN

           RAISE EXCEPTION '等级名称/代码缺失' USING ERRCODE='23514';

         END IF;

       END LOOP;

       IF item->>'grade_code'=ANY(codes) OR jsonb_typeof(item->'lower') IS DISTINCT FROM 'number'

          OR jsonb_typeof(item->'upper') IS DISTINCT FROM 'number' OR jsonb_typeof(item->'lower_inclusive') IS DISTINCT FROM 'boolean'

          OR jsonb_typeof(item->'upper_inclusive') IS DISTINCT FROM 'boolean' THEN

         RAISE EXCEPTION '等级代码重复或区间数值/边界类型不完整' USING ERRCODE='23514';

       END IF;

       lo := (item->>'lower')::numeric; hi := (item->>'upper')::numeric;

       lo_closed := (item->>'lower_inclusive')::boolean; hi_closed := (item->>'upper_inclusive')::boolean;

       IF lo>=hi OR lo<domain_lo OR hi>domain_hi OR (n=0 AND (lo<>domain_lo OR NOT lo_closed))

          OR (n>0 AND (lo<>prev_hi OR lo_closed=prev_closed)) THEN

         RAISE EXCEPTION '等级区间逆序、缺口、重叠或边界重复/遗漏' USING ERRCODE='23514';

       END IF;

       codes := array_append(codes,item->>'grade_code'); prev_hi := hi; prev_closed := hi_closed; n := n+1;

     END LOOP;

     IF prev_hi<>domain_hi OR NOT prev_closed THEN RAISE EXCEPTION '等级未完整覆盖指数上界' USING ERRCODE='23514'; END IF;

   ELSE

     RAISE EXCEPTION '当前只确认指标处理、指数合成、等级转换；其它用途保留PENDING待对应模型审核' USING ERRCODE='23514';

   END IF;

 END IF;

 RETURN NEW;

END $_$;


ALTER FUNCTION public.fn_wc_fire_rule_prerequisites() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_rule_prerequisites(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_rule_prerequisites() IS '规则确认前结构及引用校验、确认后语义保留；不核验外部文件、不执行公式，不自动批准或填正式参数。';


--
-- Name: fn_wc_fire_source_record(jsonb, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_source_record(ref jsonb, adoption_task text) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE b jsonb;row_data jsonb;key_data jsonb;pk text[];name text:=ref->>'source_object';id text:=ref->>'record_id';n integer;
BEGIN
 b:=public.fn_wc_fire_batch_adoption(adoption_task,ref->>'source_code',ref->>'source_batch');
 IF name=ANY(ARRAY['wc_forest_resource_survey_raw','wc_forest_compartment','wc_fire_fuel_sample_plot','wc_biomass_conversion_parameter','wc_fire_population_grid','wc_fire_economy_grid','wc_fire_source_point','wc_fire_use_event','wc_fire_history_event','wc_fire_forest_resource','wc_fire_fuel_unit','wc_fire_fuel_sample','wc_species_combustibility','wc_fire_building_exposure','wc_fire_capacity_resource','wc_special_population','wc_fire_indicator_value','wc_fire_result_layer']) THEN
  SELECT array_agg(a.attname ORDER BY u.ordinality) INTO pk FROM pg_constraint c CROSS JOIN LATERAL unnest(c.conkey) WITH ORDINALITY u(attnum,ordinality) JOIN pg_attribute a ON a.attrelid=c.conrelid AND a.attnum=u.attnum WHERE c.conrelid=to_regclass('public.'||name) AND c.contype='p';
  IF ref ? 'record_key' THEN
   key_data:=ref->'record_key';
   IF jsonb_typeof(key_data) IS DISTINCT FROM 'object' OR EXISTS(SELECT 1 FROM unnest(pk) k WHERE NOT(key_data ? k)) OR (SELECT count(*) FROM jsonb_object_keys(key_data))<>cardinality(pk) THEN RAISE EXCEPTION '复合主键引用须完整且仅含主键字段' USING ERRCODE='23514';END IF;
  ELSIF cardinality(pk)=1 AND id IS NOT NULL THEN
   -- 用真实主键类型构造key，而不把数值主键误当JSON字符串。
   EXECUTE format('SELECT jsonb_build_object(%L,to_jsonb((jsonb_populate_record(NULL::public.%I,jsonb_build_object(%L,$1))).%I))',pk[1],name,pk[1],pk[1]) INTO key_data USING id;
  ELSE RAISE EXCEPTION '输入须精确主键，不猜source_record_id关联' USING ERRCODE='23514';END IF;
  EXECUTE format('SELECT count(*),jsonb_agg(to_jsonb(x))->0 FROM public.%I x WHERE to_jsonb(x) @> $1',name) INTO n,row_data USING key_data;
  IF n<>1 THEN RAISE EXCEPTION '实际输入记录不存在或不唯一：%',name USING ERRCODE='23503';END IF;
  IF row_data ? 'task_id' AND row_data->>'task_id' IS DISTINCT FROM adoption_task THEN RAISE EXCEPTION '实际源记录跨任务' USING ERRCODE='23514';END IF;
  IF row_data ? 'source_code' AND row_data->>'source_code' IS DISTINCT FROM ref->>'source_code' THEN RAISE EXCEPTION '实际源记录来源不一致' USING ERRCODE='23514';END IF;
  IF row_data ? 'source_batch' AND row_data->>'source_batch' IS DISTINCT FROM ref->>'source_batch' THEN RAISE EXCEPTION '实际源记录批次不一致' USING ERRCODE='23514';END IF;
  IF row_data->>'species_detail_id' IS NOT NULL THEN
    IF name IN ('wc_fire_forest_resource','wc_forest_resource_survey_raw') THEN
      PERFORM public.fn_wc_species_detail_assert(row_data->>'species_detail_id',row_data->>'dominant_species_code');
    ELSE
      PERFORM public.fn_wc_species_detail_assert(row_data->>'species_detail_id',row_data->>'species_code');
    END IF;
  END IF;
  IF row_data ? 'quality_code' AND NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=row_data->>'quality_code' AND status='ACTIVE') THEN RAISE EXCEPTION '实际源记录质量码未有效' USING ERRCODE='23514';END IF;
  IF name='wc_fire_source_point' AND NOT EXISTS(SELECT 1 FROM public.wc_fire_source_type_dictionary WHERE standard_code=row_data->>'source_type_code' AND status='ACTIVE') THEN RAISE EXCEPTION '正式火源点类型未有效采用' USING ERRCODE='23514';END IF;
  IF name='wc_fire_use_event' AND NOT EXISTS(SELECT 1 FROM public.wc_fire_use_category_dictionary WHERE event_type=row_data->>'event_type' AND category_code=row_data->>'use_category_code' AND status='ACTIVE') THEN RAISE EXCEPTION '正式用火类别未按事件类型有效采用' USING ERRCODE='23514';END IF;
  IF name='wc_fire_history_event' THEN
    IF NOT EXISTS(SELECT 1 FROM public.wc_fire_history_cause_dictionary WHERE cause_code=row_data->>'cause_code' AND status='ACTIVE') OR NOT EXISTS(SELECT 1 FROM public.wc_fire_history_level_dictionary WHERE level_code=row_data->>'fire_level_code' AND status='ACTIVE') THEN RAISE EXCEPTION '正式历史原因/等级字典未有效采用' USING ERRCODE='23514';END IF;
    IF EXISTS(SELECT 1 FROM public.wc_fire_history_cause_dictionary WHERE cause_code=row_data->>'cause_code' AND other_cause_required) AND coalesce(row_data->>'other_cause','') !~ '[^[:space:]]' THEN RAISE EXCEPTION '所采用原因要求其他原因详情' USING ERRCODE='23514';END IF;
  END IF;
  IF row_data ? 'data_status' AND coalesce(row_data->>'data_status','') NOT IN ('VALID','PUBLISHED') THEN RAISE EXCEPTION '实际源记录状态未有效' USING ERRCODE='23514';END IF;
  IF row_data ? 'record_status' AND row_data->>'record_status' IS DISTINCT FROM 'VALID' THEN RAISE EXCEPTION '实际业务记录未通过核验' USING ERRCODE='23514';END IF;
 ELSE
  IF coalesce(ref->>'manifest_ref','') !~ '[^[:space:]]' OR coalesce(ref->>'manifest_sha256','') !~ '^[0-9A-Fa-f]{64}$'
    OR ref->>'manifest_sha256' IS DISTINCT FROM b#>>'{metadata_json,source_file_sha256}' THEN RAISE EXCEPTION '外部来源须与已核验接收清单哈希一致' USING ERRCODE='23514';END IF;
  IF jsonb_typeof(b#>'{metadata_json,records}') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '外部清单须含实际记录数组' USING ERRCODE='23514';END IF;
  SELECT count(*),jsonb_agg(v)->0 INTO n,row_data FROM jsonb_array_elements(b#>'{metadata_json,records}')v WHERE v->>'source_object'=name AND v->>'record_id'=id;
  IF n<>1 THEN RAISE EXCEPTION '外部清单缺精确记录快照' USING ERRCODE='23503';END IF;
  IF row_data->>'unit_id' IS NULL OR row_data->>'period_key' IS NULL THEN RAISE EXCEPTION '外部记录须保留单元和统计期间' USING ERRCODE='23514';END IF;
 END IF;
 RETURN jsonb_build_object('source_object',name,'record_key',key_data,'record_id',id,'source_code',ref->>'source_code','source_batch',ref->>'source_batch','record',row_data,'receipt',b-'metadata_json');
END $_$;


ALTER FUNCTION public.fn_wc_fire_source_record(ref jsonb, adoption_task text) OWNER TO postgres;

--
-- Name: wc_fire_rule_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_rule_definition (
    rule_id character varying(80) NOT NULL,
    task_id character varying(60) NOT NULL,
    rule_type character varying(40) NOT NULL,
    rule_name character varying(200) NOT NULL,
    rule_version character varying(100) NOT NULL,
    source_code character varying(60),
    formula_expression text,
    parameter_json jsonb,
    effective_from date,
    effective_to date,
    approval_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    note text,
    CONSTRAINT ck_fire_rule_approved_basic CHECK ((((approval_status)::text <> 'APPROVED'::text) OR ((source_code IS NOT NULL) AND (formula_expression IS NOT NULL) AND (parameter_json IS NOT NULL)))),
    CONSTRAINT ck_fire_rule_date_order CHECK (((effective_from IS NULL) OR (effective_to IS NULL) OR (effective_from <= effective_to))),
    CONSTRAINT ck_fire_rule_optional_text CHECK ((((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((formula_expression IS NULL) OR (formula_expression ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_fire_rule_parameter_object CHECK (((parameter_json IS NULL) OR (jsonb_typeof(parameter_json) = 'object'::text))),
    CONSTRAINT ck_fire_rule_required_text CHECK ((((rule_id)::text ~ '[^[:space:]]'::text) AND ((task_id)::text ~ '[^[:space:]]'::text) AND ((rule_name)::text ~ '[^[:space:]]'::text) AND ((rule_version)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_r15_identity_text CHECK ((((rule_id IS NULL) OR ((rule_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((rule_version IS NULL) OR ((rule_version)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_fire_rule_definition_approval_status_check CHECK (((approval_status)::text = ANY ((ARRAY['PENDING'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'SUPERSEDED'::character varying])::text[]))),
    CONSTRAINT wc_fire_rule_definition_rule_type_check CHECK (((rule_type)::text = ANY ((ARRAY['NORMALIZATION'::character varying, 'HAZARD_GRADE'::character varying, 'HAZARD_HAZARD'::character varying, 'RISK_GRADE'::character varying, 'ZONING'::character varying, 'VULNERABILITY'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_rule_definition OWNER TO postgres;

--
-- Name: TABLE wc_fire_rule_definition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_rule_definition IS '评估规则定义表';


--
-- Name: COLUMN wc_fire_rule_definition.rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.rule_id IS '规则版本编号';


--
-- Name: COLUMN wc_fire_rule_definition.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_rule_definition.rule_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.rule_type IS '规则业务类型';


--
-- Name: COLUMN wc_fire_rule_definition.rule_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.rule_name IS '规则中文名称';


--
-- Name: COLUMN wc_fire_rule_definition.rule_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.rule_version IS '采用规则版本标签';


--
-- Name: COLUMN wc_fire_rule_definition.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_rule_definition.formula_expression; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.formula_expression IS '完整公式或判断逻辑';


--
-- Name: COLUMN wc_fire_rule_definition.parameter_json; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.parameter_json IS '规则参数与采用依据
P-02隐患用途：保存组合判据、RIE/PRIE、圈层权重、对象尺度及采用版本。';


--
-- Name: COLUMN wc_fire_rule_definition.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.effective_from IS '规则适用起点';


--
-- Name: COLUMN wc_fire_rule_definition.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.effective_to IS '规则适用终点';


--
-- Name: COLUMN wc_fire_rule_definition.approval_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.approval_status IS '规则确认状态';


--
-- Name: COLUMN wc_fire_rule_definition.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_rule_definition.note IS '备注';


--
-- Name: fn_wc_fire_spatial_index_adoption(public.wc_fire_result_layer, public.wc_fire_rule_definition); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_spatial_index_adoption(result_record public.wc_fire_result_layer, rule_record public.wc_fire_rule_definition) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE u public.wc_fire_spatial_unit%ROWTYPE;c public.wc_fire_spatial_unit%ROWTYPE;
 v public.wc_fire_result_layer%ROWTYPE;b public.wc_fire_task_source%ROWTYPE;
 refs jsonb:=result_record.calculation_refs;p jsonb:=rule_record.parameter_json;method text:=p->>'method_code';
 id text;ids text[];seen text[]:=ARRAY[]::text[];expected text[];point geometry;child_center geometry;forest_version text;
 total numeric:=0;denominator numeric:=0;positive integer:=0;hits integer;value numeric;
 snapshots jsonb:='[]';areas jsonb:='[]';
BEGIN
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=result_record.task_id AND unit_id=result_record.unit_id;
 IF u.unit_id IS NULL OR u.data_status<>'VALID' OR rule_record.approval_status<>'APPROVED'
  OR rule_record.task_id<>result_record.task_id OR p->>'rule_stage' IS DISTINCT FROM 'SPATIAL_AGGREGATION'
  OR refs->>'method_version' IS DISTINCT FROM p->>'method_version' OR result_record.output_code<>'HAZARD_INDEX' OR result_record.upstream_result_id IS NOT NULL THEN RAISE EXCEPTION '空间指数采用入口或单元不符' USING ERRCODE='23514';END IF;
 SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=u.task_id AND source_code=u.source_code AND source_batch=u.source_batch;
 IF NOT FOUND OR b.quality_status<>'PASSED' OR b.metadata_json->>'spatial_coverage_status' IS DISTINCT FROM 'COMPLETE'
  OR coalesce(b.metadata_json->>'spatial_manifest_ref','') !~ '[^[:space:]]'
  OR coalesce(b.metadata_json->>'spatial_manifest_sha256','') !~ '^[0-9A-Fa-f]{64}$'
  OR coalesce(b.metadata_json->>'forest_area_version','') !~ '[^[:space:]]' THEN
  RAISE EXCEPTION '空间全集/林地版本缺依据或批次未通过' USING ERRCODE='23514';END IF;
 forest_version:=b.metadata_json->>'forest_area_version';
 IF jsonb_typeof(refs->'result_refs') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION '须确切上游结果ID集合' USING ERRCODE='23514';END IF;
 SELECT array_agg(x) INTO ids FROM jsonb_array_elements_text(refs->'result_refs') x;
 IF EXISTS(SELECT 1 FROM jsonb_array_elements(refs->'result_refs') x WHERE jsonb_typeof(x)<>'string') THEN RAISE EXCEPTION '结果ID须文本' USING ERRCODE='23514';END IF;
 IF method='CENTER_LOOKUP' THEN
  IF u.unit_type NOT IN ('GRID_30_ARCSEC','GRID_1KM') THEN RAISE EXCEPTION '中心点转换须标准格网' USING ERRCODE='23514';END IF;
  IF p->>'center_method'='CENTROID' THEN point:=ST_Centroid(u.geom);ELSE point:=ST_PointOnSurface(u.geom);END IF;
  SELECT count(*),array_agg(unit_id) INTO hits,expected FROM public.wc_fire_spatial_unit WHERE task_id=u.task_id AND unit_type='FOREST_COMPARTMENT' AND ST_Covers(geom,point);
  IF hits>1 THEN RAISE EXCEPTION '格网中心落入多个小班，不能任取一个' USING ERRCODE='23514';END IF;
  IF hits=0 THEN
   IF b.metadata_json->>'forest_coverage_status' IS DISTINCT FROM 'COMPLETE' OR jsonb_array_length(refs->'result_refs')<>0 THEN RAISE EXCEPTION '非林区零值须完整森林范围及空上游集合依据' USING ERRCODE='23514';END IF;
   value:=0;
  END IF;
 ELSIF method='TOWNSHIP_POSITIVE_MEAN_FOREST_SHARE' THEN
  IF u.unit_type<>'TOWNSHIP' THEN RAISE EXCEPTION '乡镇方法须乡镇单元' USING ERRCODE='23514';END IF;
  SELECT array_agg(unit_id ORDER BY unit_id) INTO expected FROM public.wc_fire_spatial_unit WHERE task_id=u.task_id AND parent_unit_id=u.unit_id AND unit_type=p->>'input_unit_type';
 ELSE
  IF method<>'COUNTY_FOREST_WEIGHTED_MEAN' OR u.unit_type<>'COUNTY' THEN RAISE EXCEPTION '县域方法/单元不符' USING ERRCODE='23514';END IF;
  SELECT array_agg(unit_id ORDER BY unit_id) INTO expected FROM public.wc_fire_spatial_unit WHERE task_id=u.task_id AND parent_unit_id=u.unit_id AND unit_type='TOWNSHIP';
 END IF;
 IF value IS NULL AND coalesce(cardinality(expected),0)=0 THEN RAISE EXCEPTION '空间汇总无已登记完整输入集合，不补零' USING ERRCODE='23514';END IF;
 FOREACH id IN ARRAY coalesce(ids,ARRAY[]::text[]) LOOP
  SELECT * INTO v FROM public.wc_fire_result_layer WHERE result_id=id AND task_id=result_record.task_id;
  IF NOT FOUND OR v.output_code<>'HAZARD_INDEX' OR v.data_status NOT IN ('VALID','PUBLISHED')
   OR v.period_key IS DISTINCT FROM result_record.period_key OR v.source_batch IS DISTINCT FROM result_record.source_batch
   OR v.calculation_refs->>'model_version' IS DISTINCT FROM refs->>'model_version'
   OR v.calculation_refs->>'rule_version' IS DISTINCT FROM refs->>'rule_version'
   OR NOT(v.calculation_refs ? 'adopted_snapshot') OR v.index_value IS NULL OR v.index_value<0
   OR v.index_value IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
   OR fn_wc_fire_result_date(v.calculation_refs->>'calculated_on')>fn_wc_fire_result_date(refs->>'calculated_on') THEN
   RAISE EXCEPTION '上游指数状态/期间/批次/版本/日期无效：%',id USING ERRCODE='23514';END IF;
  IF v.unit_id=ANY(seen) OR NOT(v.unit_id=ANY(expected)) THEN RAISE EXCEPTION '上游空间集合重复或与真实归属不符' USING ERRCODE='23514';END IF;
  SELECT * INTO c FROM public.wc_fire_spatial_unit WHERE task_id=u.task_id AND unit_id=v.unit_id;
  IF c.data_status<>'VALID' OR NOT ST_Equals(c.geom,v.geom) THEN RAISE EXCEPTION '上游单元/几何未验证' USING ERRCODE='23514';END IF;
  SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=c.task_id AND source_code=c.source_code AND source_batch=c.source_batch;
  IF NOT FOUND OR b.quality_status<>'PASSED' OR b.metadata_json->>'forest_area_version' IS DISTINCT FROM forest_version THEN RAISE EXCEPTION '上游空间批次未通过或林地面积版本不一致' USING ERRCODE='23514';END IF;
  IF method='CENTER_LOOKUP' THEN value:=v.index_value;
  ELSIF method='TOWNSHIP_POSITIVE_MEAN_FOREST_SHARE' THEN
   IF jsonb_typeof(v.calculation_refs#>'{adopted_snapshot,center_point}') IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '格网缺实际采用中心点快照' USING ERRCODE='23514';END IF;
   child_center:=ST_SetSRID(ST_GeomFromGeoJSON(v.calculation_refs#>'{adopted_snapshot,center_point}'),ST_SRID(c.geom));
   IF NOT ST_Covers(u.geom,child_center) THEN RAISE EXCEPTION '实际采用格网中心不在乡镇内' USING ERRCODE='23514';END IF;
   IF v.index_value>0 THEN total:=total+v.index_value;positive:=positive+1;END IF;
  ELSE
   IF NOT ST_Covers(u.geom,c.geom) OR c.forest_area_m2 IS NULL OR c.forest_area_m2<0 OR c.forest_area_m2 IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN RAISE EXCEPTION '乡镇归属/林地面积不完整' USING ERRCODE='23514';END IF;
   total:=total+v.index_value*c.forest_area_m2;denominator:=denominator+c.forest_area_m2;
   areas:=areas||jsonb_build_array(jsonb_build_object('unit_id',c.unit_id,'forest_area_m2',c.forest_area_m2));
  END IF;
  seen:=array_append(seen,v.unit_id);snapshots:=snapshots||jsonb_build_array(to_jsonb(v)-'geom');
 END LOOP;
 IF coalesce(cardinality(seen),0)<>coalesce(cardinality(expected),0) THEN RAISE EXCEPTION '上游空间集合缺项，不能用部分集合出结果' USING ERRCODE='23514';END IF;
 IF method='TOWNSHIP_POSITIVE_MEAN_FOREST_SHARE' THEN
  IF positive=0 OR u.area_m2 IS NULL OR u.area_m2<=0 OR u.forest_area_m2 IS NULL OR u.forest_area_m2<0 OR u.forest_area_m2>u.area_m2
   OR u.area_m2 IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) OR u.forest_area_m2 IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN RAISE EXCEPTION '乡镇无正指数格网或面积不符，未默认零' USING ERRCODE='23514';END IF;
  value:=total/positive*u.forest_area_m2/u.area_m2;
 ELSIF method='COUNTY_FOREST_WEIGHTED_MEAN' THEN
  IF denominator<=0 THEN RAISE EXCEPTION '县级林地面积分母须大于0' USING ERRCODE='23514';END IF;
  value:=total/denominator;
 END IF;
 IF result_record.index_value IS DISTINCT FROM round(value,8) THEN RAISE EXCEPTION '空间指数与实际输入计算不一致' USING ERRCODE='23514';END IF;
 RETURN jsonb_build_object('unit',to_jsonb(u)-'geom','rule',to_jsonb(rule_record),'spatial_results',snapshots,'forest_areas',areas,'center_point',ST_AsGeoJSON(point)::jsonb,'calculated_index',round(value,8));
END $_$;


ALTER FUNCTION public.fn_wc_fire_spatial_index_adoption(result_record public.wc_fire_result_layer, rule_record public.wc_fire_rule_definition) OWNER TO postgres;

--
-- Name: fn_wc_fire_special_risk_h_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_special_risk_h_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE refs jsonb; old_refs jsonb; snap jsonb; active boolean; formal boolean;
BEGIN
 IF TG_TABLE_NAME='wc_fire_result_layer' THEN
   IF NEW.output_code NOT IN ('POPULATION_RISK_GRADE','ECONOMIC_RISK_GRADE','FOREST_RESOURCE_RISK_GRADE') THEN RETURN NEW; END IF;
   refs:=NEW.calculation_refs;
   IF TG_OP='UPDATE' THEN old_refs:=OLD.calculation_refs; END IF;
   active:=num_nonnulls(NEW.index_value,NEW.grade_code,NEW.grade_name)>0 OR coalesce(refs ? 'risk_linkage',false);
   formal:=NEW.data_status IN ('VALID','PUBLISHED');
   IF NEW.upstream_result_id IS NOT NULL THEN
     RAISE EXCEPTION '专项H编号写入calculation_refs.risk_linkage.h_result_id，不使用upstream_result_id冒充H关联' USING ERRCODE='23514';
   END IF;
   IF refs ? 'hazard_linkage_snapshot' AND (TG_OP='INSERT' OR refs->'hazard_linkage_snapshot' IS DISTINCT FROM old_refs->'hazard_linkage_snapshot') THEN
     RAISE EXCEPTION '专项H来源快照由数据库生成，不能外部预填或改写' USING ERRCODE='23514';
   END IF;
   IF active OR formal THEN
     IF refs#>>'{risk_linkage,h_result_id}'=NEW.result_id THEN RAISE EXCEPTION '专项风险不能引用自身作为H' USING ERRCODE='23514'; END IF;
     snap:=public.fn_wc_fire_special_risk_h_reference(NEW.task_id,NEW.unit_id,NEW.period_key,refs,formal,NEW.geom);
     NEW.calculation_refs:=refs||jsonb_build_object('hazard_linkage_snapshot',snap);
   ELSE
     NEW.calculation_refs:=refs-'hazard_linkage_snapshot';
   END IF;
 ELSE
   IF NEW.indicator_code NOT IN ('P04_POPULATION_RISK_INDEX','P04_ECONOMIC_RISK_INDEX','P04_FOREST_RISK_INDEX') THEN RETURN NEW; END IF;
   refs:=NEW.input_refs;
   IF TG_OP='UPDATE' THEN old_refs:=OLD.input_refs; END IF;
   active:=num_nonnulls(NEW.raw_value,NEW.normalized_value,NEW.assigned_score)>0 OR coalesce(refs ? 'risk_linkage',false);
   formal:=NEW.value_status IN ('VALID','SUPERSEDED');
   IF refs ? 'hazard_linkage_snapshot' AND (TG_OP='INSERT' OR refs->'hazard_linkage_snapshot' IS DISTINCT FROM old_refs->'hazard_linkage_snapshot') THEN
     RAISE EXCEPTION '专项H来源快照由数据库生成，不能外部预填或改写' USING ERRCODE='23514';
   END IF;
   IF active OR formal THEN
     snap:=public.fn_wc_fire_special_risk_h_reference(NEW.task_id,NEW.unit_id,NEW.period_key,refs,formal);
     NEW.input_refs:=refs||jsonb_build_object('hazard_linkage_snapshot',snap);
   ELSE
     NEW.input_refs:=refs-'hazard_linkage_snapshot';
   END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_special_risk_h_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_special_risk_h_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_special_risk_h_guard() IS '人口、经济、森林资源乡镇风险H来源与引用保护；只校验H来源，不启用完整HEV';


--
-- Name: fn_wc_fire_special_risk_h_parent_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_special_risk_h_parent_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF TG_OP='UPDATE' AND to_jsonb(NEW) IS NOT DISTINCT FROM to_jsonb(OLD) THEN RETURN NEW; END IF;
 IF EXISTS(SELECT 1 FROM public.wc_fire_result_layer c
    WHERE c.output_code IN ('POPULATION_RISK_GRADE','ECONOMIC_RISK_GRADE','FOREST_RESOURCE_RISK_GRADE')
      AND c.calculation_refs#>>'{risk_linkage,h_result_id}'=OLD.result_id)
 OR EXISTS(SELECT 1 FROM public.wc_fire_indicator_value v
    WHERE v.indicator_code IN ('P04_POPULATION_RISK_INDEX','P04_ECONOMIC_RISK_INDEX','P04_FOREST_RISK_INDEX')
      AND v.input_refs#>>'{risk_linkage,h_result_id}'=OLD.result_id) THEN
   RAISE EXCEPTION '危险性成果已被人口/经济/森林资源风险引用，不能原位修改或删除；草稿须先解除下游关联，正式采用历史保留' USING ERRCODE='23514';
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_special_risk_h_parent_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_special_risk_h_parent_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_special_risk_h_parent_guard() IS '人口、经济、森林资源乡镇风险H来源与引用保护；只校验H来源，不启用完整HEV';


--
-- Name: fn_wc_fire_special_risk_h_reference(text, text, text, jsonb, boolean, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_special_risk_h_reference(p_task_id text, p_unit_id text, p_period_key text, p_refs jsonb, p_require_formal boolean, p_geom public.geometry DEFAULT NULL::public.geometry) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
 h public.wc_fire_result_layer%ROWTYPE;
 t public.wc_fire_assessment_task%ROWTYPE;
 u public.wc_fire_spatial_unit%ROWTYPE;
 r public.wc_fire_rule_definition%ROWTYPE;
 link jsonb; hv numeric;
BEGIN
 IF p_task_id IS NULL OR p_unit_id IS NULL OR p_period_key IS NULL
    OR p_period_key !~ '[^[:space:]]'
    OR jsonb_typeof(p_refs) IS DISTINCT FROM 'object' THEN
   RAISE EXCEPTION '专项风险H关联须任务、乡镇、期间和追溯对象' USING ERRCODE='23514';
 END IF;
 link:=p_refs->'risk_linkage';
 IF jsonb_typeof(link) IS DISTINCT FROM 'object'
    OR jsonb_typeof(link->'h_result_id') IS DISTINCT FROM 'string'
    OR coalesce(link->>'h_result_id','') !~ '[^[:space:]]' THEN
   RAISE EXCEPTION '专项风险必须通过risk_linkage.h_result_id引用确切危险性等级成果' USING ERRCODE='23514';
 END IF;
 SELECT * INTO h FROM public.wc_fire_result_layer
  WHERE result_id=link->>'h_result_id' FOR SHARE;
 IF NOT FOUND OR h.output_code IS DISTINCT FROM 'HAZARD_GRADE' THEN
   RAISE EXCEPTION 'H来源必须是HAZARD_GRADE；经济、人口风险等其他成果不能充当H' USING ERRCODE='23514';
 END IF;
 IF h.task_id IS DISTINCT FROM p_task_id OR h.unit_id IS DISTINCT FROM p_unit_id
    OR h.period_key IS DISTINCT FROM p_period_key THEN
   RAISE EXCEPTION 'H来源须与专项风险同任务、同乡镇、同期间' USING ERRCODE='23514';
 END IF;
 IF h.source_batch IS NULL OR h.source_batch !~ '[^[:space:]]' THEN
   RAISE EXCEPTION 'H来源成果须明确来源批次，不能只凭乡镇和期间采用未标识批次的成果' USING ERRCODE='23514';
 END IF;
 IF h.data_status NOT IN ('PENDING','VALID','PUBLISHED') THEN
   RAISE EXCEPTION 'H来源状态不可引用' USING ERRCODE='23514';
 END IF;
 SELECT * INTO t FROM public.wc_fire_assessment_task WHERE task_id=p_task_id;
 IF NOT FOUND OR t.model_version IS NULL OR t.rule_version IS NULL
    OR t.fire_season_start IS NULL OR t.fire_season_end IS NULL THEN
   RAISE EXCEPTION 'H关联任务须明确模型、规则包版本及防火期起止' USING ERRCODE='23514';
 END IF;
 SELECT * INTO u FROM public.wc_fire_spatial_unit
  WHERE task_id=p_task_id AND unit_id=p_unit_id FOR SHARE;
 IF NOT FOUND OR u.unit_type IS DISTINCT FROM 'TOWNSHIP' THEN
   RAISE EXCEPTION '本次专项H关联适用于乡镇单元；县级汇总不能直接套乡镇HEV' USING ERRCODE='23514';
 END IF;
 IF NOT coalesce(ST_Equals(h.geom,u.geom),false)
    OR (p_geom IS NOT NULL AND NOT coalesce(ST_Equals(p_geom,u.geom),false)) THEN
   RAISE EXCEPTION 'H来源、专项结果与采用乡镇边界不一致' USING ERRCODE='23514';
 END IF;
 SELECT * INTO r FROM public.wc_fire_rule_definition
  WHERE task_id=p_task_id AND rule_id=h.source_rule_id FOR SHARE;
 IF NOT FOUND OR r.rule_type IS DISTINCT FROM 'HAZARD_GRADE'
    OR r.parameter_json->>'rule_stage' IS DISTINCT FROM 'GRADE_CLASSIFICATION' THEN
   RAISE EXCEPTION 'H来源须引用实际危险性等级分级规则，不能使用其他用途的规则' USING ERRCODE='23514';
 END IF;
 IF r.rule_version IS DISTINCT FROM t.rule_version
    OR p_refs->>'model_version' IS DISTINCT FROM t.model_version
    OR p_refs->>'rule_version' IS DISTINCT FROM t.rule_version
    OR h.calculation_refs->>'model_version' IS DISTINCT FROM t.model_version
    OR h.calculation_refs->>'rule_version' IS DISTINCT FROM r.rule_version THEN
   RAISE EXCEPTION 'H来源和专项风险的模型、规则包版本不对应' USING ERRCODE='23514';
 END IF;
 hv:=CASE h.grade_name WHEN '高' THEN 1 WHEN '中高' THEN 2 WHEN '中低' THEN 3 WHEN '低' THEN 4 ELSE NULL END;
 IF h.grade_code IS NULL OR hv IS NULL THEN
   RAISE EXCEPTION 'H来源须有危险性等级代码及高/中高/中低/低名称' USING ERRCODE='23514';
 END IF;
 IF link ? 'H' THEN
   IF jsonb_typeof(link->'H') IS DISTINCT FROM 'number' THEN
     RAISE EXCEPTION '填写H时须为与危险性等级对应的数字1/2/3/4' USING ERRCODE='23514';
   END IF;
   IF (link->>'H')::numeric IS DISTINCT FROM hv THEN
     RAISE EXCEPTION '填写的H与所引用危险性等级不一致；H必须按P04对应关系取得' USING ERRCODE='23514';
   END IF;
 END IF;
 IF p_require_formal AND (h.data_status NOT IN ('VALID','PUBLISHED') OR r.approval_status<>'APPROVED') THEN
   RAISE EXCEPTION '正式专项风险不能采用待核H或未批准危险性分级规则' USING ERRCODE='23514';
 END IF;
 RETURN jsonb_build_object(
  'version','WC_P04_SPECIAL_H_LINKAGE_20261019','validation_scope','H_REFERENCE_ONLY',
  'H',hv,'provisional',h.data_status='PENDING',
  'h_identity',jsonb_build_object('result_id',h.result_id,'output_code',h.output_code,
    'task_id',h.task_id,'unit_id',h.unit_id,'period_key',h.period_key,'source_batch',h.source_batch,
    'source_rule_id',h.source_rule_id,'model_version',h.calculation_refs->>'model_version',
    'rule_version',h.calculation_refs->>'rule_version'),
  'h_result',to_jsonb(h)-'geom',
  'hazard_rule',jsonb_build_object('rule_id',r.rule_id,'rule_version',r.rule_version,'approval_status',r.approval_status),
  'task',jsonb_build_object('task_id',t.task_id,'model_version',t.model_version,'rule_version',t.rule_version,
    'fire_season_start',t.fire_season_start,'fire_season_end',t.fire_season_end),
  'unit',to_jsonb(u)-'geom','period_key',p_period_key);
END $$;


ALTER FUNCTION public.fn_wc_fire_special_risk_h_reference(p_task_id text, p_unit_id text, p_period_key text, p_refs jsonb, p_require_formal boolean, p_geom public.geometry) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fire_special_risk_h_reference(p_task_id text, p_unit_id text, p_period_key text, p_refs jsonb, p_require_formal boolean, p_geom public.geometry); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fire_special_risk_h_reference(p_task_id text, p_unit_id text, p_period_key text, p_refs jsonb, p_require_formal boolean, p_geom public.geometry) IS 'P04人口/经济乡镇风险H来源校验。h_result_id锁定确切HAZARD_GRADE记录；要求来源批次完整，生成h_identity含任务/乡镇/期间/批次/模型规则版本的快照；不自动选择候选版本，不等同完整HEV计算。';


--
-- Name: fn_wc_fire_task_history_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_task_history_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') AND (EXISTS(SELECT 1 FROM public.wc_fire_indicator_value WHERE task_id=OLD.task_id AND value_status='VALID') OR EXISTS(SELECT 1 FROM public.wc_fire_result_layer WHERE task_id=OLD.task_id AND data_status IN ('VALID','PUBLISHED'))) THEN
  IF TG_OP='DELETE' OR (to_jsonb(NEW)-'task_status'-'note') IS DISTINCT FROM (to_jsonb(OLD)-'task_status'-'note') THEN RAISE EXCEPTION '已有采用结果的任务配置冻结，变化另建任务' USING ERRCODE='23514';END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fire_task_history_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_task_source_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_task_source_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 -- Marker is generated by this trigger. It preserves first-PASSED history after later downgrades.
 IF TG_OP IN ('UPDATE','DELETE') AND (OLD.quality_status='PASSED' OR OLD.metadata_json->>'_quality_passed_once'='true') THEN
   IF TG_OP='DELETE' OR (to_jsonb(NEW)-'quality_status'-'note') IS DISTINCT FROM (to_jsonb(OLD)-'quality_status'-'note') THEN
     RAISE EXCEPTION '曾通过批次保留文件和质检历史，修订另建批次' USING ERRCODE='23514';
   END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 IF TG_OP='INSERT' THEN
   IF NEW.metadata_json ? '_quality_passed_once' THEN RAISE EXCEPTION '首次通过标记由接收检查生成，不接受外填' USING ERRCODE='23514';END IF;
 ELSIF NOT coalesce(OLD.metadata_json->>'_quality_passed_once'='true',false) AND NEW.metadata_json ? '_quality_passed_once' THEN
   RAISE EXCEPTION '首次通过标记由接收检查生成，不接受外填' USING ERRCODE='23514';
 END IF;
 IF NEW.quality_status='PASSED' THEN
   PERFORM public.fn_wc_fire_receipt_assert(to_jsonb(NEW));
 END IF;
 IF NEW.quality_status='PASSED' OR (TG_OP='UPDATE' AND OLD.quality_status='PASSED') THEN
   NEW.metadata_json:=NEW.metadata_json||jsonb_build_object('_quality_passed_once',true);
 END IF;
 RETURN NEW;
END
$$;


ALTER FUNCTION public.fn_wc_fire_task_source_guard() OWNER TO postgres;

--
-- Name: fn_wc_fire_weather_composition(character varying, character varying, text[], character varying, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fire_weather_composition(adoption_task character varying, target_unit character varying, weather_ids text[], adoption_rule character varying, calculated_on date) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE r public.wc_fire_rule_definition%ROWTYPE;t public.wc_fire_assessment_task%ROWTYPE;
 w public.wc_fire_weather_month%ROWTYPE;a public.wc_compartment_weather%ROWTYPE;b public.wc_fire_task_source%ROWTYPE;
 p jsonb;id text;v numeric;total numeric:=0;n integer:=0;months integer[];year_months text[]:=ARRAY[]::text[];month integer;year integer;
 records jsonb:='[]';field text;expected integer;
BEGIN
 SELECT * INTO r FROM public.wc_fire_rule_definition WHERE task_id=adoption_task AND rule_id=adoption_rule;
 SELECT * INTO t FROM public.wc_fire_assessment_task WHERE task_id=adoption_task;
 p:=r.parameter_json;field:=p->>'weather_field';
 IF r.rule_id IS NULL OR r.approval_status<>'APPROVED' OR p->>'rule_stage' IS DISTINCT FROM 'WEATHER_COMPOSITION'
  OR p->>'method_code' IS DISTINCT FROM 'MONTH_MEAN' OR r.rule_version IS DISTINCT FROM t.rule_version
  OR p->>'model_version' IS DISTINCT FROM t.model_version OR calculated_on IS NULL
  OR (r.effective_from IS NOT NULL AND calculated_on<r.effective_from) OR (r.effective_to IS NOT NULL AND calculated_on>r.effective_to) THEN
  RAISE EXCEPTION '气象合成规则未批准、版本或采用日期不符' USING ERRCODE='23514';END IF;
 IF NOT EXISTS(SELECT 1 FROM public.wc_fire_spatial_unit WHERE task_id=adoption_task AND unit_id=target_unit AND data_status='VALID' AND p->'spatial_unit_types' ? unit_type) THEN
  RAISE EXCEPTION '气象目标单元尺度/质量不符' USING ERRCODE='23514';END IF;
 SELECT array_agg(x::integer ORDER BY x::integer) INTO months FROM jsonb_array_elements_text(p->'months') x;
 expected:=10*cardinality(months);
 IF weather_ids IS NULL OR cardinality(weather_ids)<>expected OR cardinality(weather_ids)<>(SELECT count(DISTINCT x) FROM unnest(weather_ids)x) THEN
  RAISE EXCEPTION '气象输入须完整2011—2020指定月份唯一集合' USING ERRCODE='23514';END IF;
 SELECT * INTO a FROM public.wc_compartment_weather WHERE task_id=adoption_task AND unit_id=target_unit;
 IF NOT FOUND OR (SELECT count(*) FROM public.wc_compartment_weather WHERE task_id=adoption_task AND unit_id=target_unit)<>1
  OR a.weather_unit_type<>'GRID' OR a.assign_method<>'CENTER_CONTAINS' OR a.assign_weight<>1
  OR a.method_version IS DISTINCT FROM p->>'assignment_method_version'
  OR NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=a.quality_code AND status='ACTIVE') THEN
  RAISE EXCEPTION '气象须明确唯一中心点格网赋值，不按重叠面积合成' USING ERRCODE='23514';END IF;
 SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=a.task_id AND source_code=a.source_code AND source_batch=a.source_batch;
 IF NOT FOUND OR b.quality_status<>'PASSED' OR coalesce(b.metadata_json->>'center_assignment_ref','') !~ '[^[:space:]]' THEN
  RAISE EXCEPTION '中心点赋值批次未通过或缺定位依据' USING ERRCODE='23514';END IF;
 FOREACH id IN ARRAY weather_ids LOOP
  SELECT * INTO w FROM public.wc_fire_weather_month WHERE task_id=adoption_task AND weather_id=id;
  IF NOT FOUND OR w.weather_unit_type<>'GRID' OR w.weather_unit_id<>a.weather_unit_id
   OR w.stat_year NOT BETWEEN 2011 AND 2020 OR NOT(w.stat_month=ANY(months)) OR w.missing_code IS NOT NULL
   OR NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=w.quality_code AND status='ACTIVE') THEN
   RAISE EXCEPTION '月记录不存在、格网/年份月份或质量不符：%',id USING ERRCODE='23514';END IF;
  IF (w.stat_year::text||'-'||w.stat_month::text)=ANY(year_months) THEN RAISE EXCEPTION '同年月不同产品不可重复合成' USING ERRCODE='23514';END IF;
  year_months:=array_append(year_months,w.stat_year::text||'-'||w.stat_month::text);
  SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=w.task_id AND source_code=w.source_code AND source_batch=w.source_batch;
  IF NOT FOUND OR b.quality_status<>'PASSED' OR b.metadata_json->>'coverage_status' IS DISTINCT FROM 'COMPLETE'
   OR coalesce(b.metadata_json#>>ARRAY['weather_statistic_refs',field],'') !~ '[^[:space:]]'
   OR w.stat_method_version IS DISTINCT FROM p->>'input_stat_method_version' THEN
   RAISE EXCEPTION '气象产品缺实际统计定义/完整批次或处理版本不一致' USING ERRCODE='23514';END IF;
  v:=(to_jsonb(w)->>field)::numeric;
  IF v IS NULL OR v IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN RAISE EXCEPTION '气象原值缺测/非有限，不补零' USING ERRCODE='23514';END IF;
  IF p->>'value_conversion'='DIVIDE_CALENDAR_DAYS' THEN
   v:=v/extract(day FROM (make_date(w.stat_year,w.stat_month,1)+interval '1 month - 1 day'));
  END IF;
  total:=total+v;n:=n+1;records:=records||jsonb_build_array(to_jsonb(w)-'geom');
 END LOOP;
 -- 数量、唯一及年份月份取值共同证明笛卡尔全集；不靠覆盖声明替代月份核对。
 FOREACH month IN ARRAY months LOOP FOR year IN 2011..2020 LOOP
  IF NOT((year::text||'-'||month::text)=ANY(year_months)) THEN RAISE EXCEPTION '气象月份集合不完整' USING ERRCODE='23514';END IF;
 END LOOP;END LOOP;
 RETURN jsonb_build_object('raw_value',round(total/n,8),'unit',p->>'output_unit','weather_ids',to_jsonb(weather_ids),'rule',to_jsonb(r),'assignment',to_jsonb(a),'weather_records',records);
END $$;


ALTER FUNCTION public.fn_wc_fire_weather_composition(adoption_task character varying, target_unit character varying, weather_ids text[], adoption_rule character varying, calculated_on date) OWNER TO postgres;

--
-- Name: fn_wc_fuel_measurement_sample_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fuel_measurement_sample_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE item jsonb; adopted public.wc_fire_fuel_sample%ROWTYPE;
BEGIN
 IF NEW.fuel_measurements IS NULL OR NEW.fuel_measurements='[]'::jsonb THEN RETURN NEW; END IF;
 IF NOT public.fn_wc_fuel_measurements_valid(NEW.fuel_measurements) THEN
  RAISE EXCEPTION '样方测量明细结构、方法、质量或株丛数不正确' USING ERRCODE='23514';
 END IF;
 -- 与已有样地父级校验共用同任务行锁；样品变更侧同样获取该锁。
 -- 使用项目当前默认READ COMMITTED隔离级别。
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
 FOR item IN SELECT value FROM jsonb_array_elements(NEW.fuel_measurements) LOOP
  SELECT * INTO adopted FROM public.wc_fire_fuel_sample WHERE sample_id=item->>'sample_id' FOR SHARE;
  IF NOT FOUND OR adopted.task_id<>NEW.task_id THEN
   RAISE EXCEPTION '采用样品不存在或不属于同一评估任务' USING ERRCODE='23503';
  END IF;
  IF adopted.sample_type<>item->>'sample_type'
    OR (item ? 'species_code' AND adopted.species_code IS DISTINCT FROM item->>'species_code')
    OR (item ? 'fine_fuel_size_group' AND adopted.fine_fuel_size_group IS DISTINCT FROM item->>'fine_fuel_size_group') THEN
   RAISE EXCEPTION '采用样品的类型、树种或细小可燃物分组不一致' USING ERRCODE='23514';
  END IF;
  IF adopted.fresh_mass_kg IS NULL OR adopted.dry_mass_kg IS NULL
    OR adopted.fresh_mass_kg<=0 OR adopted.dry_mass_kg<0 OR adopted.dry_mass_kg>adopted.fresh_mass_kg
    OR adopted.fresh_mass_kg IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
    OR adopted.dry_mass_kg IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN
   RAISE EXCEPTION '采用样品须有有效千克鲜干重：鲜重>0且0<=干重<=鲜重' USING ERRCODE='23514';
  END IF;
 END LOOP;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fuel_measurement_sample_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fuel_measurement_sample_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fuel_measurement_sample_guard() IS '检查样方采用样品的同任务、类型及鲜干重前置条件；样品代表范围需依据原始调查记录核验';


--
-- Name: fn_wc_fuel_measurement_sample_restrict(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fuel_measurement_sample_restrict() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE used boolean;
BEGIN
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
 SELECT EXISTS(SELECT 1 FROM public.wc_fire_fuel_sample_plot p,
  LATERAL jsonb_array_elements(p.fuel_measurements) item
  WHERE p.task_id=OLD.task_id AND item->>'sample_id'=OLD.sample_id) INTO used;
 IF NOT used THEN
  IF TG_OP='DELETE' THEN RETURN OLD; ELSE RETURN NEW; END IF;
 END IF;
 IF TG_OP='DELETE' THEN
  RAISE EXCEPTION '样品仍被样方测量明细采用，请先调整引用' USING ERRCODE='23503';
 END IF;
 IF (NEW.sample_id,NEW.task_id,NEW.sample_type,NEW.species_code,NEW.fine_fuel_size_group)
  IS DISTINCT FROM (OLD.sample_id,OLD.task_id,OLD.sample_type,OLD.species_code,OLD.fine_fuel_size_group) THEN
  RAISE EXCEPTION '被采用样品的编号、任务和分类不得直接改变，请先调整引用' USING ERRCODE='23503';
 END IF;
 IF NEW.fresh_mass_kg IS NULL OR NEW.dry_mass_kg IS NULL
  OR NEW.fresh_mass_kg<=0 OR NEW.dry_mass_kg<0 OR NEW.dry_mass_kg>NEW.fresh_mass_kg
  OR NEW.fresh_mass_kg IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
  OR NEW.dry_mass_kg IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN
  RAISE EXCEPTION '被采用样品须保持有效千克鲜干重' USING ERRCODE='23514';
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_fuel_measurement_sample_restrict() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fuel_measurement_sample_restrict(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fuel_measurement_sample_restrict() IS '防止已采用样品被删除、改换身份分类或置为无效鲜干重';


--
-- Name: fn_wc_fuel_measurements_valid(jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_fuel_measurements_valid(details jsonb) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE item jsonb; k text; v numeric; seen text[] := ARRAY[]::text[];
BEGIN
 IF details IS NULL THEN RETURN true; END IF;
 IF jsonb_typeof(details)<>'array' THEN RETURN false; END IF;
 FOR item IN SELECT value FROM jsonb_array_elements(details) LOOP
  IF jsonb_typeof(item)<>'object' THEN RETURN false; END IF;
  -- 错拼键名不得静默进入计算。原始补充说明写在note中。
  IF EXISTS(SELECT 1 FROM jsonb_object_keys(item) AS x(key) WHERE key<>ALL(ARRAY[
   'measurement_no','fuel_category_code','sample_type','method','sample_id',
   'species_code','fine_fuel_size_group','total_fresh_mass_kg','individual_count',
   'mean_individual_fresh_mass_kg','source_record_id','note'])) THEN RETURN false; END IF;
  FOREACH k IN ARRAY ARRAY['measurement_no','fuel_category_code','sample_type','method','sample_id'] LOOP
   IF jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR (item->>k)!~'[^[:space:]]' THEN RETURN false; END IF;
  END LOOP;
  IF item->>'measurement_no'=ANY(seen) THEN RETURN false; END IF;
  seen:=array_append(seen,item->>'measurement_no');
  IF item->>'sample_type'<>ALL(ARRAY['TREE','SHRUB','HERB','LITTER','HUMUS','COARSE_FUEL','BAMBOO','MIXED']) THEN RETURN false; END IF;
  FOREACH k IN ARRAY ARRAY['species_code','fine_fuel_size_group','source_record_id','note'] LOOP
   IF item ? k AND (jsonb_typeof(item->k) IS DISTINCT FROM 'string' OR (item->>k)!~'[^[:space:]]') THEN RETURN false; END IF;
  END LOOP;
  IF item->>'method'='WHOLE_QUADRAT' THEN
   IF NOT item ? 'total_fresh_mass_kg' OR item ?| ARRAY['individual_count','mean_individual_fresh_mass_kg'] THEN RETURN false; END IF;
  ELSIF item->>'method' IN ('STANDARD_PLANT','STANDARD_CLUMP') THEN
   IF item->>'sample_type'<>'SHRUB' OR NOT(item ?& ARRAY['individual_count','mean_individual_fresh_mass_kg']) OR item ? 'total_fresh_mass_kg' THEN RETURN false; END IF;
  ELSE RETURN false;
  END IF;
  FOREACH k IN ARRAY ARRAY['total_fresh_mass_kg','individual_count','mean_individual_fresh_mass_kg'] LOOP
   IF item ? k THEN
    IF jsonb_typeof(item->k) IS DISTINCT FROM 'number' THEN RETURN false; END IF;
    v:=(item->>k)::numeric;
    IF v<0 OR v IN ('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) THEN RETURN false; END IF;
    IF k='individual_count' AND trunc(v)<>v THEN RETURN false; END IF;
   END IF;
  END LOOP;
 END LOOP;
 RETURN true;
END $$;


ALTER FUNCTION public.fn_wc_fuel_measurements_valid(details jsonb) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_fuel_measurements_valid(details jsonb); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_fuel_measurements_valid(details jsonb) IS '项目样方测量明细结构校验，不计算正式载量';


--
-- Name: fn_wc_local_adoption_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_adoption_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE p public.wc_normalization_parameter%ROWTYPE; member jsonb; area_sum numeric; forest_ha numeric;
 area_codes text[]:=ARRAY['P04_FLAMMABLE_WOODLAND_AREA_HA','P04_SHRUBLAND_AREA_HA'];
 area_n integer;
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') AND OLD.indicator_code=ANY(area_codes)
    AND (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) THEN
   PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
   IF EXISTS(SELECT 1 FROM public.wc_fire_indicator_value WHERE task_id=OLD.task_id AND unit_id=OLD.unit_id
      AND period_key=OLD.period_key AND indicator_code='P04_FOREST_VULNERABILITY_RAW_WC_LOCAL'
      AND raw_value IS NOT NULL AND value_status NOT IN ('MISSING','REJECTED')) THEN
     RAISE EXCEPTION 'WC_FOREST_AREA: 已有Q采用此面积，先处理下游草稿；已批准样本不得覆盖' USING ERRCODE='23514';
   END IF;
 END IF;
 IF TG_OP IN ('UPDATE','DELETE') AND OLD.indicator_code LIKE 'P04_%_WC_LOCAL' THEN
   PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
   IF EXISTS(SELECT 1 FROM public.wc_normalization_parameter q WHERE q.task_id=OLD.task_id AND q.indicator_code=OLD.indicator_code
      AND q.approval_status='APPROVED' AND q.source_refs#>>'{sample_set,period_key}'=OLD.period_key
      AND EXISTS(SELECT 1 FROM jsonb_array_elements(q.source_refs#>'{sample_set,members}') e WHERE e->>'unit_id'=OLD.unit_id)) THEN
     IF TG_OP='DELETE' OR public.fn_wc_local_raw_hash(NEW) IS DISTINCT FROM public.fn_wc_local_raw_hash(OLD) THEN
       RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 已批准样本的原值及采用依据冻结，改版使用新任务/期间' USING ERRCODE='23514';
     END IF;
   END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF NEW.indicator_code=ANY(area_codes) THEN
   PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
   SELECT forest_area_m2/10000 INTO forest_ha FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND unit_type='TOWNSHIP';
   IF NOT FOUND OR NEW.unit IS DISTINCT FROM 'hm2' OR NEW.raw_code IS NOT NULL
      OR NEW.normalized_value IS NOT NULL OR NEW.assigned_score IS NOT NULL OR NEW.normalization_param_id IS NOT NULL
      OR NEW.score_rule_id IS NOT NULL OR NEW.raw_value<0 THEN
     RAISE EXCEPTION 'WC_FOREST_AREA: 面积须乡镇记录、hm2、非负原值，不能填换算值或评分' USING ERRCODE='23514';
   END IF;
   SELECT coalesce(sum(raw_value),0)+coalesce(NEW.raw_value,0) INTO area_sum FROM public.wc_fire_indicator_value
    WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND period_key=NEW.period_key
    AND indicator_code=ANY(area_codes) AND indicator_code<>NEW.indicator_code AND value_status NOT IN ('MISSING','REJECTED');
   IF NEW.value_status NOT IN ('MISSING','REJECTED') AND forest_ha IS NOT NULL AND area_sum>forest_ha THEN
     RAISE EXCEPTION 'WC_FOREST_AREA: A易+A灌不可超过本乡镇林地面积S' USING ERRCODE='23514';
   END IF;
 END IF;
 IF NEW.indicator_code NOT LIKE 'P04_%_WC_LOCAL' THEN RETURN NEW;END IF;
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
 IF NEW.indicator_code='P04_FOREST_VULNERABILITY_RAW_WC_LOCAL' AND NEW.raw_value IS NOT NULL THEN
   SELECT count(raw_value),sum(raw_value) INTO area_n,area_sum FROM public.wc_fire_indicator_value
    WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND period_key=NEW.period_key AND indicator_code=ANY(area_codes)
      AND value_status NOT IN ('MISSING','REJECTED');
   SELECT forest_area_m2/10000 INTO forest_ha FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id AND unit_type='TOWNSHIP';
   IF area_n<>2 OR forest_ha IS NULL OR forest_ha<=0 OR area_sum>forest_ha OR NEW.raw_value IS DISTINCT FROM round(area_sum/forest_ha,2) THEN
     RAISE EXCEPTION 'WC_FOREST_AREA: Q须引用同任务/乡镇/期间两种独立面积，并按(A易+A灌)/S保留两位计算' USING ERRCODE='23514';
   END IF;
 END IF;
 IF NEW.normalization_param_id IS NULL AND NEW.normalized_value IS NULL THEN RETURN NEW;END IF;
 SELECT * INTO p FROM public.wc_normalization_parameter WHERE param_id=NEW.normalization_param_id;
 IF NOT FOUND OR p.task_id IS DISTINCT FROM NEW.task_id OR p.indicator_code IS DISTINCT FROM NEW.indicator_code OR p.approval_status<>'APPROVED' THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 须采用本任务、本项已批准参数' USING ERRCODE='23514';
 END IF;
 PERFORM public.fn_wc_local_sample_validate(p);
 SELECT value INTO member FROM jsonb_array_elements(p.source_refs#>'{sample_set,members}') WHERE value->>'unit_id'=NEW.unit_id;
 IF NOT FOUND OR p.source_refs#>>'{sample_set,period_key}' IS DISTINCT FROM NEW.period_key
    OR NEW.raw_value IS DISTINCT FROM (member->>'raw_value')::numeric
    OR NEW.unit IS DISTINCT FROM p.input_unit OR public.fn_wc_local_raw_hash(NEW) IS DISTINCT FROM member->>'raw_input_hash'
    OR NEW.normalized_value IS NULL OR NEW.raw_value<p.min_value OR NEW.raw_value>p.max_value
    OR NEW.normalized_value IS DISTINCT FROM round((NEW.raw_value-p.min_value)/(p.max_value-p.min_value),8) THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 乡镇/期间/原值/依据或换算值与固定样本不符' USING ERRCODE='23514';
 END IF;
 IF EXISTS(SELECT 1 FROM public.wc_fire_indicator_value v WHERE v.task_id=NEW.task_id AND v.period_key=NEW.period_key
    AND v.indicator_code=NEW.indicator_code AND v.unit_id<>NEW.unit_id AND v.normalization_param_id IS NOT NULL
    AND v.value_status NOT IN ('MISSING','REJECTED') AND v.normalization_param_id<>NEW.normalization_param_id) THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 同次同项所有乡镇须引用同一个参数编号' USING ERRCODE='23514';
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_local_adoption_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_local_adoption_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_local_adoption_guard() IS '同任务/期间/计算项统一参数编号；面积与文昌本地换算采用校验，保留P04正式执行限制';


--
-- Name: fn_wc_local_boundary_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_boundary_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE tid text;
BEGIN
 tid:=CASE WHEN TG_OP='DELETE' THEN OLD.task_id ELSE NEW.task_id END;
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=tid FOR UPDATE;
 IF EXISTS(SELECT 1 FROM public.wc_normalization_parameter p WHERE p.task_id=tid AND p.indicator_code LIKE 'P04_%_WC_LOCAL' AND p.approval_status='APPROVED')
    OR (TG_OP='UPDATE' AND EXISTS(SELECT 1 FROM public.wc_normalization_parameter p WHERE p.task_id=OLD.task_id AND p.indicator_code LIKE 'P04_%_WC_LOCAL' AND p.approval_status='APPROVED')) THEN
   IF (TG_OP='INSERT' AND NEW.unit_type='TOWNSHIP') OR (TG_OP='DELETE' AND OLD.unit_type='TOWNSHIP')
      OR (TG_OP='UPDATE' AND (OLD.unit_type='TOWNSHIP' OR NEW.unit_type='TOWNSHIP') AND NEW IS DISTINCT FROM OLD) THEN
     RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 已批准样本的乡镇集合、边界面积及来源冻结，改版使用新任务' USING ERRCODE='23514';
   END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_local_boundary_guard() OWNER TO postgres;

--
-- Name: wc_fire_spatial_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_spatial_unit (
    unit_id character varying(80) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_type character varying(30) NOT NULL,
    admin_code character varying(30),
    admin_name character varying(120),
    parent_unit_id character varying(80),
    area_m2 numeric(18,3),
    forest_area_m2 numeric(18,3),
    geom public.geometry(Geometry,4490) NOT NULL,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    survey_date date,
    data_status character varying(30) DEFAULT 'RAW'::character varying NOT NULL,
    CONSTRAINT wc_fire_spatial_unit_data_status_check CHECK (((data_status)::text = ANY ((ARRAY['RAW'::character varying, 'NORMALIZED'::character varying, 'VALID'::character varying, 'INVALID'::character varying, 'SUPERSEDED'::character varying])::text[]))),
    CONSTRAINT wc_fire_spatial_unit_unit_type_check CHECK (((unit_type)::text = ANY ((ARRAY['FOREST_COMPARTMENT'::character varying, 'GRID_30_ARCSEC'::character varying, 'GRID_1KM'::character varying, 'TOWNSHIP'::character varying, 'COUNTY'::character varying, 'ADMIN'::character varying, 'BUILDING'::character varying, 'HAZARD_OBJECT'::character varying, 'PREVENTION_ZONE'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_spatial_unit OWNER TO postgres;

--
-- Name: TABLE wc_fire_spatial_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_spatial_unit IS '空间单元表';


--
-- Name: COLUMN wc_fire_spatial_unit.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_spatial_unit.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_spatial_unit.unit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.unit_type IS '空间单元类型；PREVENTION_ZONE为P05独立合并分区，不能冒用单个乡镇身份；组成单元与边界决策保存在对应结果calculation_refs.zoning。';


--
-- Name: COLUMN wc_fire_spatial_unit.admin_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.admin_code IS '行政区代码';


--
-- Name: COLUMN wc_fire_spatial_unit.admin_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.admin_name IS '行政区名称';


--
-- Name: COLUMN wc_fire_spatial_unit.parent_unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.parent_unit_id IS '上级空间单元编号';


--
-- Name: COLUMN wc_fire_spatial_unit.area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.area_m2 IS '空间单元总面积（平方米）';


--
-- Name: COLUMN wc_fire_spatial_unit.forest_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.forest_area_m2 IS '单元内林地面积（平方米）。
口径说明：森林面积与林地面积不是同一统计口径。本字段用于P01/P04时，按采用的正式林地分类统计，不以森林面积或行政总面积直接替代；地类、年度及边界版本以采用来源为准。';


--
-- Name: COLUMN wc_fire_spatial_unit.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.geom IS '空间单元几何
P-02隐患用途：乡镇/格网面、建筑位置/轮廓分别使用；房屋中心点、0—10/10—50/50—100米范围及米制方法另明确引用。';


--
-- Name: COLUMN wc_fire_spatial_unit.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_spatial_unit.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_spatial_unit.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_spatial_unit.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.survey_date IS '调查或源数据更新日期';


--
-- Name: COLUMN wc_fire_spatial_unit.data_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_spatial_unit.data_status IS '空间数据状态';


--
-- Name: fn_wc_local_boundary_hash(public.wc_fire_spatial_unit); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_boundary_hash(u public.wc_fire_spatial_unit) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
 SELECT md5((to_jsonb(u)-'geom')::text || coalesce(encode(ST_AsEWKB(u.geom),'hex'),''))
$$;


ALTER FUNCTION public.fn_wc_local_boundary_hash(u public.wc_fire_spatial_unit) OWNER TO postgres;

--
-- Name: fn_wc_local_parameter_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_parameter_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE relevant boolean;
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') THEN
   relevant:=OLD.indicator_code LIKE 'P04_%_WC_LOCAL';
   IF relevant THEN
     PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
     IF EXISTS(SELECT 1 FROM public.wc_fire_indicator_value WHERE normalization_param_id=OLD.param_id)
        AND (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) THEN
       RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 已引用参数与清单不可覆盖/删除，请新建参数并在新任务或期间采用' USING ERRCODE='23514';
     END IF;
   END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF NEW.indicator_code LIKE 'P04_%_WC_LOCAL' AND NEW.approval_status='APPROVED' THEN
   PERFORM public.fn_wc_local_sample_validate(NEW);
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_local_parameter_guard() OWNER TO postgres;

--
-- Name: fn_wc_local_raw_hash(public.wc_fire_indicator_value); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_raw_hash(v public.wc_fire_indicator_value) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
 SELECT md5((to_jsonb(v)-'normalized_value'-'normalization_param_id'-'assigned_score'-'score_rule_id')::text)
$$;


ALTER FUNCTION public.fn_wc_local_raw_hash(v public.wc_fire_indicator_value) OWNER TO postgres;

--
-- Name: wc_normalization_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_normalization_parameter (
    param_id bigint NOT NULL,
    task_id character varying(60),
    indicator_code character varying(60) NOT NULL,
    baseline_start date,
    baseline_end date,
    min_value numeric(18,6),
    max_value numeric(18,6),
    sample_count integer,
    formula character varying(500),
    source_name character varying(300),
    method_version character varying(50),
    sample_scope character varying(30),
    input_unit character varying(30),
    source_refs jsonb,
    approval_status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    CONSTRAINT ck_normalization_approved CHECK ((((approval_status)::text <> 'APPROVED'::text) OR ((num_nonnulls(min_value, max_value, formula, source_name, method_version, sample_scope, input_unit, source_refs) = 8) AND (max_value > min_value)))),
    CONSTRAINT ck_normalization_dates CHECK (((num_nonnulls(baseline_start, baseline_end) = ANY (ARRAY[0, 2])) AND ((baseline_end IS NULL) OR (baseline_start <= baseline_end)))),
    CONSTRAINT ck_normalization_numbers CHECK ((((min_value IS NULL) OR (min_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((max_value IS NULL) OR (max_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((min_value IS NULL) OR (max_value IS NULL) OR (max_value >= min_value)) AND ((sample_count IS NULL) OR (sample_count > 0)))),
    CONSTRAINT ck_normalization_source_object CHECK (((source_refs IS NULL) OR (jsonb_typeof(source_refs) = 'object'::text))),
    CONSTRAINT ck_normalization_status CHECK (((approval_status)::text = ANY ((ARRAY['PENDING'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_normalization_text CHECK ((((indicator_code)::text ~ '[^[:space:]]'::text) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((formula IS NULL) OR ((formula)::text ~ '[^[:space:]]'::text)) AND ((source_name IS NULL) OR ((source_name)::text ~ '[^[:space:]]'::text)) AND ((method_version IS NULL) OR ((method_version)::text ~ '[^[:space:]]'::text)) AND ((sample_scope IS NULL) OR ((sample_scope)::text ~ '[^[:space:]]'::text)) AND ((input_unit IS NULL) OR ((input_unit)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_wc_p04_local_sample_scope CHECK ((((indicator_code)::text <> ALL ((ARRAY['P04_FOREST_EXPOSURE_DENSITY_WC_LOCAL'::character varying, 'P04_BUILDING_EXPOSURE_DENSITY_WC_LOCAL'::character varying, 'P04_POPULATION_EXPOSURE_DENSITY_WC_LOCAL'::character varying, 'P04_ECONOMIC_EXPOSURE_DENSITY_WC_LOCAL'::character varying, 'P04_FOREST_VULNERABILITY_RAW_WC_LOCAL'::character varying, 'P04_BUILDING_VULNERABILITY_RAW_WC_LOCAL'::character varying, 'P04_POPULATION_VULNERABILITY_RAW_WC_LOCAL'::character varying])::text[])) OR ((((sample_scope)::text = 'WENCHANG_TOWNSHIP'::text) IS TRUE) AND (task_id IS NOT NULL))))
);


ALTER TABLE public.wc_normalization_parameter OWNER TO postgres;

--
-- Name: TABLE wc_normalization_parameter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_normalization_parameter IS '指标标准化参数表';


--
-- Name: COLUMN wc_normalization_parameter.param_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.param_id IS '标准化参数ID';


--
-- Name: COLUMN wc_normalization_parameter.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_normalization_parameter.indicator_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.indicator_code IS '参数所属指标代码';


--
-- Name: COLUMN wc_normalization_parameter.baseline_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.baseline_start IS '参数样本资料覆盖起点';


--
-- Name: COLUMN wc_normalization_parameter.baseline_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.baseline_end IS '参数样本资料覆盖终点';


--
-- Name: COLUMN wc_normalization_parameter.min_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.min_value IS '参数样本原值最小值，按sample_scope及所属指标区分。人口和综合风险WC_LOCAL七项专用代码采用文昌乡镇样本；其他规则另按各自依据。';


--
-- Name: COLUMN wc_normalization_parameter.max_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.max_value IS '参数样本原值最大值，按sample_scope及所属指标区分。人口和综合风险WC_LOCAL七项专用代码采用文昌乡镇样本；其他规则另按各自依据。';


--
-- Name: COLUMN wc_normalization_parameter.sample_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.sample_count IS '参数有效样本记录数';


--
-- Name: COLUMN wc_normalization_parameter.formula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.formula IS '标准化公式';


--
-- Name: COLUMN wc_normalization_parameter.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.source_name IS '参数来源成果名称';


--
-- Name: COLUMN wc_normalization_parameter.method_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.method_version IS '参数处理方法版本';


--
-- Name: COLUMN wc_normalization_parameter.sample_scope; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.sample_scope IS '参数样本空间范围。NATIONAL为原规范全国口径；WENCHANG_TOWNSHIP为2026-10-19用户确认的人口与综合风险项目调整，七项WC_LOCAL代码必须绑定实际任务和采用乡镇清单。';


--
-- Name: COLUMN wc_normalization_parameter.input_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.input_unit IS '参数对应的原值单位';


--
-- Name: COLUMN wc_normalization_parameter.source_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.source_refs IS '参数来源及范围证据引用';


--
-- Name: COLUMN wc_normalization_parameter.approval_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_normalization_parameter.approval_status IS '参数确认状态';


--
-- Name: fn_wc_local_sample_validate(public.wc_normalization_parameter); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_local_sample_validate(p public.wc_normalization_parameter) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE s jsonb; item jsonb; ids text[]; all_ids text[]; v public.wc_fire_indicator_value%ROWTYPE;
 u public.wc_fire_spatial_unit%ROWTYPE; n integer:=0; lo numeric; hi numeric; x numeric;
BEGIN
 PERFORM 1 FROM public.wc_fire_assessment_task WHERE task_id=p.task_id FOR UPDATE;
 s:=p.source_refs->'sample_set';
 IF p.task_id IS NULL OR p.sample_scope IS DISTINCT FROM 'WENCHANG_TOWNSHIP'
    OR p.formula IS DISTINCT FROM 'X''=(X-Xmin)/(Xmax-Xmin)'
    OR jsonb_typeof(s) IS DISTINCT FROM 'object'
    OR coalesce(s->>'period_key','') !~ '[^[:space:]]'
    OR coalesce(s->>'boundary_version','') !~ '[^[:space:]]'
    OR coalesce(s->>'source_version','') !~ '[^[:space:]]'
    OR jsonb_typeof(s->'members') IS DISTINCT FROM 'array'
    OR jsonb_typeof(s->'excluded') IS DISTINCT FROM 'array' THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 固定样本须任务、期间、边界/资料版本、成员及排除清单、正向公式' USING ERRCODE='23514';
 END IF;
 FOR item IN SELECT value FROM jsonb_array_elements(s->'members') LOOP
   IF jsonb_typeof(item->'unit_id') IS DISTINCT FROM 'string'
      OR jsonb_typeof(item->'raw_value') IS DISTINCT FROM 'number'
      OR coalesce(item->>'raw_input_hash','') !~ '^[a-f0-9]{32}$'
      OR coalesce(item->>'boundary_hash','') !~ '^[a-f0-9]{32}$' THEN
     RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 成员须乡镇编号、原值及来源/边界摘要' USING ERRCODE='23514';
   END IF;
   SELECT * INTO v FROM public.wc_fire_indicator_value WHERE task_id=p.task_id AND unit_id=item->>'unit_id'
     AND period_key=s->>'period_key' AND indicator_code=p.indicator_code;
   IF NOT FOUND OR v.value_status IN ('MISSING','REJECTED') OR v.raw_value IS DISTINCT FROM (item->>'raw_value')::numeric
      OR v.unit IS DISTINCT FROM p.input_unit OR v.input_refs IS NULL
      OR v.input_refs->>'method_version' IS DISTINCT FROM p.method_version
      OR public.fn_wc_local_raw_hash(v) IS DISTINCT FROM item->>'raw_input_hash' THEN
     RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 成员原值、单位、方法或实际采用依据不匹配' USING ERRCODE='23514';
   END IF;
   SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=p.task_id AND unit_id=v.unit_id;
   IF u.unit_type IS DISTINCT FROM 'TOWNSHIP' OR public.fn_wc_local_boundary_hash(u) IS DISTINCT FROM item->>'boundary_hash' THEN
     RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 乡镇边界、面积或来源版本已变' USING ERRCODE='23514';
   END IF;
   x:=v.raw_value; lo:=least(lo,x); hi:=greatest(hi,x); n:=n+1;
 END LOOP;
 IF n<2 OR p.sample_count IS DISTINCT FROM n OR p.min_value IS DISTINCT FROM lo OR p.max_value IS DISTINCT FROM hi OR NOT hi>lo THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 样本数或MIN/MAX不符，或极差为零' USING ERRCODE='23514';
 END IF;
 FOR item IN SELECT value FROM jsonb_array_elements(s->'excluded') LOOP
   IF jsonb_typeof(item->'unit_id') IS DISTINCT FROM 'string' OR coalesce(item->>'reason','') !~ '[^[:space:]]' THEN
     RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 排除乡镇必须写明原因' USING ERRCODE='23514';
   END IF;
 END LOOP;
 SELECT array_agg(id ORDER BY id) INTO ids FROM (
   SELECT value->>'unit_id' id FROM jsonb_array_elements((s->'members')||(s->'excluded'))) a;
 SELECT array_agg(unit_id ORDER BY unit_id) INTO all_ids FROM public.wc_fire_spatial_unit WHERE task_id=p.task_id AND unit_type='TOWNSHIP';
 IF ids IS DISTINCT FROM all_ids THEN
   RAISE EXCEPTION 'WC_LOCAL_SAMPLE: 全部任务乡镇须恰好出现一次，纳入或明确排除，不能重复/漏选' USING ERRCODE='23514';
 END IF;
END $_$;


ALTER FUNCTION public.fn_wc_local_sample_validate(p public.wc_normalization_parameter) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_local_sample_validate(p public.wc_normalization_parameter); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_local_sample_validate(p public.wc_normalization_parameter) IS '文昌乡镇固定样本校验：显式成员/排除清单、实际原值、采用依据摘要、空间来源摘要及MIN/MAX；仅结构及采用校验，不批准专项公式';


--
-- Name: fn_wc_lyt1063_2025_calculate(text, text, text, text, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_calculate(p_task text, p_unit text, p_period text, p_rule text, p_on date) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE c jsonb;x jsonb;v public.wc_fire_indicator_value%ROWTYPE;snapshot jsonb;refs jsonb:='[]';payload jsonb:='{}';answer jsonb;k text;
 resource_epoch jsonb;this_epoch jsonb;monitor_version text;
BEGIN
 c:=public.fn_wc_lyt1063_2025_context(p_task,p_unit,p_rule,p_on,true);
 IF coalesce(p_period,'') !~ '[^[:space:]]' THEN RAISE EXCEPTION '正式计算须明确期间标识' USING ERRCODE='23514';END IF;
 FOR x IN SELECT value FROM jsonb_array_elements(c#>'{rule,parameter_json,input_contract}') LOOP
  SELECT * INTO v FROM public.wc_fire_indicator_value WHERE task_id=p_task AND unit_id=p_unit AND period_key=p_period AND indicator_code=x->>'indicator_code';
  IF NOT FOUND OR v.value_status IS DISTINCT FROM 'VALID' THEN RAISE EXCEPTION '正式计算缺少已采用指标：%',x->>'indicator_code' USING ERRCODE='23514';END IF;
  IF NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=v.quality_code AND status='ACTIVE') THEN
   RAISE EXCEPTION '新版指标质量代码当前未启用' USING ERRCODE='23514';END IF;
  IF v.input_refs#>>'{lyt1063_adoption,rule_id}' IS DISTINCT FROM p_rule THEN RAISE EXCEPTION '指标采用规则与计算规则不一致' USING ERRCODE='23514';END IF;
  snapshot:=public.fn_wc_lyt1063_2025_input_adoption(v);
  IF x->>'key' IN ('easy_stock_m3','combustible_stock_m3','difficult_stock_m3','classification_total_stock_m3','forest_resource_area_ha','standing_stock_m3','forest_cover_pct') THEN
   SELECT metadata_json->>'resource_monitoring_version' INTO monitor_version FROM public.wc_fire_task_source WHERE task_id=p_task
     AND source_code=snapshot#>>'{source,source_code}' AND source_batch=snapshot#>>'{source,source_batch}';
   this_epoch:=jsonb_build_object('period_type',v.period_type,'as_of_date',v.as_of_date,'stat_start',v.stat_start,'stat_end',v.stat_end,'monitoring_version',monitor_version);
   IF resource_epoch IS NULL THEN resource_epoch:=this_epoch;
   ELSIF resource_epoch IS DISTINCT FROM this_epoch THEN RAISE EXCEPTION '资源指标的监测版本或统计时点/期间不一致' USING ERRCODE='23514';END IF;
  END IF;
  IF (snapshot->>'adopted_on')::date>p_on THEN RAISE EXCEPTION '计算日期早于指标采用日期' USING ERRCODE='23514';END IF;
  payload:=payload||jsonb_build_object(x->>'key',v.raw_value);
  IF v.indicator_code='L25_FOREST_COVER_PCT' THEN payload:=payload||jsonb_build_object('adjustment',v.input_refs->'lyt1063_adjustment','adjustment_decision',v.input_refs->'lyt1063_adjustment_decision');END IF;
  refs:=refs||jsonb_build_array(jsonb_build_object('indicator',to_jsonb(v),'current_adoption',snapshot));
 END LOOP;
 answer:=public.fn_wc_lyt1063_2025_evaluate(p_rule::varchar,payload);
 IF answer->>'status' IS DISTINCT FROM 'CALCULATED_NOT_FORMAL' OR answer->>'final_grade_code' IS NULL THEN
  RAISE EXCEPTION '正式输入仍有缺项、冲突或未明确的实际采用：%',answer USING ERRCODE='23514';END IF;
 RETURN jsonb_build_object('context',c,'indicator_snapshots',refs,'input',payload,'calculation',answer,'calculated_on',p_on);
END $$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_calculate(p_task text, p_unit text, p_period text, p_rule text, p_on date) OWNER TO postgres;

--
-- Name: fn_wc_lyt1063_2025_context(text, text, text, date, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_context(p_task text, p_unit text, p_rule text, p_on date, p_ready boolean) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE t public.wc_fire_assessment_task%ROWTYPE;r public.wc_fire_rule_definition%ROWTYPE;u public.wc_fire_spatial_unit%ROWTYPE;
BEGIN
 SELECT * INTO t FROM public.wc_fire_assessment_task WHERE task_id=p_task;
 SELECT * INTO r FROM public.wc_fire_rule_definition WHERE task_id=p_task AND rule_id=p_rule;
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=p_task AND unit_id=p_unit;
 IF t.task_id IS NULL OR r.rule_id IS NULL OR u.unit_id IS NULL THEN RAISE EXCEPTION '新版正式采用的任务、规则或单元不存在/跨任务' USING ERRCODE='23514';END IF;
 IF r.approval_status IS DISTINCT FROM 'APPROVED' OR r.source_code IS DISTINCT FROM 'SRC_WC_LYT1063_2025'
   OR r.rule_version IS DISTINCT FROM 'LYT1063_2025' OR t.rule_version IS DISTINCT FROM r.rule_version
   OR t.model_version IS DISTINCT FROM r.parameter_json->>'model_version'
   OR r.parameter_json->>'rule_stage' IS DISTINCT FROM 'COUNTY_FIRE_ZONING'
   OR r.parameter_json->>'method_code' IS DISTINCT FROM 'LYT1063_2025_SEVEN_FACTORS'
   OR r.parameter_json->>'execution_enabled' IS DISTINCT FROM 'true'
   OR r.parameter_json->>'formal_result_writes_enabled' IS DISTINCT FROM 'true'
   OR r.parameter_json->>'target_output_code' IS DISTINCT FROM 'LYT1063_2025_COUNTY_GRADE' THEN
  RAISE EXCEPTION '新版正式任务、规则批准、版本或执行开关未齐' USING ERRCODE='23514';END IF;
 IF p_on IS NULL OR p_on<r.effective_from OR p_on<(r.parameter_json#>>'{confirmation,confirmed_on}')::date OR (r.effective_to IS NOT NULL AND p_on>r.effective_to)
   OR t.data_start IS NULL OR t.data_end IS NULL OR t.data_end<>((t.data_start+INTERVAL '5 years')::date-1)
   OR t.data_end>p_on OR t.fire_season_start IS NULL OR t.fire_season_end IS NULL
   OR t.spatial_unit<>'COUNTY' OR u.unit_type<>'COUNTY' OR u.data_status NOT IN ('VALID','PUBLISHED')
   OR coalesce(u.admin_code,'') !~ '[^[:space:]]' OR coalesce(u.admin_name,'') !~ '[^[:space:]]'
   OR coalesce(u.source_code,'') !~ '[^[:space:]]' OR coalesce(u.source_batch,'') !~ '[^[:space:]]'
   OR GeometryType(u.geom)<>'MULTIPOLYGON' OR ST_SRID(u.geom)<>4490 OR ST_IsEmpty(u.geom) OR NOT ST_IsValid(u.geom)
   OR coalesce(t.source_batch,'') !~ '[^[:space:]]'
   OR t.task_status NOT IN ('DATA_LOADING','READY_FOR_CALCULATION','CALCULATED','REVIEWED','PUBLISHED')
   OR (p_ready AND t.task_status NOT IN ('READY_FOR_CALCULATION','CALCULATED','REVIEWED','PUBLISHED')) THEN
  RAISE EXCEPTION '正式五年窗口、防火期、县级边界有效状态或任务阶段未齐' USING ERRCODE='23514';END IF;
 PERFORM public.fn_wc_fire_batch_adoption(p_task,r.source_code,(SELECT source_batch FROM public.wc_fire_task_source WHERE task_id=p_task AND source_code=r.source_code));
 PERFORM public.fn_wc_fire_batch_adoption(p_task,u.source_code,u.source_batch);
 RETURN jsonb_build_object('task',to_jsonb(t),'unit',to_jsonb(u)-'geom','rule',to_jsonb(r));
END $$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_context(p_task text, p_unit text, p_rule text, p_on date, p_ready boolean) OWNER TO postgres;

--
-- Name: fn_wc_lyt1063_2025_evaluate(character varying, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_evaluate(p_rule_id character varying, p_input jsonb) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE
 r public.wc_fire_rule_definition%ROWTYPE; p jsonb; x jsonb; v jsonb;
 missing jsonb:='[]'; errors jsonb:='[]'; adjustment_missing jsonb:='[]';
 weights jsonb:='{}'; ratios jsonb; scores jsonb:='{}'; score_grades jsonb:='{}';
 matches jsonb:='[]'; selected jsonb; decision jsonb; adj jsonb;
 key text; code text; grade_name text; mode text; clause text;
 q numeric; t numeric; w numeric; total_weight numeric:=0; total_stock numeric;
 s1 numeric; s2 numeric; s3 numeric; f1 numeric; f2 numeric; f3 numeric;
 pd numeric; rd numeric; forest_share numeric; cover numeric;
 grade_rank integer; initial_rank integer:=3; final_rank integer;
 major_count numeric; larger_count numeric; general_count numeric; fire_free numeric;
 a boolean; b boolean; c1 boolean; c2 boolean; d boolean; e boolean;
 national_target boolean; border_target boolean; conflict boolean:=false;
 adjustment_status text:='PENDING_FACTS'; candidate_allowed boolean:=false;
 selected_match boolean; all_selected_match boolean:=true; all_known boolean;
 result jsonb;
BEGIN
 SELECT * INTO r FROM public.wc_fire_rule_definition WHERE rule_id=p_rule_id;
 IF NOT FOUND THEN RAISE EXCEPTION '区划规则不存在' USING ERRCODE='22023'; END IF;
 p:=r.parameter_json;
 IF r.source_code IS DISTINCT FROM 'SRC_WC_LYT1063_2025'
    OR r.rule_version IS DISTINCT FROM 'LYT1063_2025'
    OR p->>'standard_parameters_status' IS DISTINCT FROM 'CONFIRMED'
    OR jsonb_typeof(p->'input_contract') IS DISTINCT FROM 'array'
    OR jsonb_array_length(p->'weather_factors') IS DISTINCT FROM 4
    OR jsonb_array_length(p->'social_factors') IS DISTINCT FROM 2
    OR jsonb_array_length(p#>'{grade_parameters,thresholds}') IS DISTINCT FROM 3 THEN
   RAISE EXCEPTION '规则来源、版本或完整参数不适用于2025版计算' USING ERRCODE='22023';
 END IF;
 IF jsonb_typeof(p_input) IS DISTINCT FROM 'object' THEN
   RETURN jsonb_build_object('status','INVALID_INPUT','formal_result',false,'errors',jsonb_build_array('输入必须为JSON对象'));
 END IF;
 FOR x IN SELECT value FROM jsonb_array_elements(p->'input_contract') LOOP
   key:=x->>'key';v:=p_input->key;
   IF v IS NULL OR v='null'::jsonb THEN
     IF (x->>'required_for_base')::boolean THEN missing:=missing||jsonb_build_array(key); END IF;
   ELSIF jsonb_typeof(v)<>'number' THEN errors:=errors||jsonb_build_array(key||'须为数值，不能用字符串、空值或布尔值代替');
   ELSE
     q:=(v#>>'{}')::numeric;
     IF (x->>'min') IS NOT NULL AND q<(x->>'min')::numeric THEN errors:=errors||jsonb_build_array(key||'小于允许下限');END IF;
     IF (x->>'max') IS NOT NULL AND q>(x->>'max')::numeric THEN errors:=errors||jsonb_build_array(key||'超过允许上限');END IF;
   END IF;
 END LOOP;
 IF jsonb_array_length(errors)>0 OR jsonb_array_length(missing)>0 THEN
   RETURN jsonb_build_object('standard_no',p->'standard_no','rule_id',p_rule_id,'status',CASE WHEN jsonb_array_length(errors)>0 THEN 'INVALID_INPUT' ELSE 'MISSING_INPUT' END,'missing_inputs',missing,'errors',errors,'formal_result',false);
 END IF;
 IF (p_input->>'territory_area_ha')::numeric<=0 THEN errors:=errors||jsonb_build_array('territory_area_ha须大于0，不能计算零分母');END IF;
 total_stock:=(p_input->>'classification_total_stock_m3')::numeric;
 IF total_stock<=0 THEN errors:=errors||jsonb_build_array('classification_total_stock_m3须大于0；原文未规定零蓄积替代算法');END IF;
 IF (p_input->>'easy_stock_m3')::numeric+(p_input->>'combustible_stock_m3')::numeric+(p_input->>'difficult_stock_m3')::numeric<>total_stock THEN
   errors:=errors||jsonb_build_array('三类蓄积之和与分类总蓄积不一致，先核实遗漏、重复及分母范围，不能默认补齐');
 END IF;
 IF (p_input->>'forest_resource_area_ha')::numeric>(p_input->>'territory_area_ha')::numeric THEN errors:=errors||jsonb_build_array('森林资源面积超过国土面积，须核实统计范围或重复计数');END IF;
 IF jsonb_array_length(errors)>0 THEN RETURN jsonb_build_object('status','INVALID_INPUT','errors',errors,'formal_result',false);END IF;
 pd:=(p_input->>'permanent_population')::numeric/(p_input->>'territory_area_ha')::numeric;
 rd:=(p_input->>'road_length_m')::numeric/(p_input->>'territory_area_ha')::numeric;
 forest_share:=(p_input->>'forest_resource_area_ha')::numeric/(p_input->>'territory_area_ha')::numeric;
 ratios:=jsonb_build_object('population_density_per_ha',pd,'road_density_m_per_ha',rd,'forest_resource_share',forest_share);
 FOR x IN SELECT value FROM jsonb_array_elements((p->'weather_factors')||(p->'social_factors')) LOOP
   key:=x->>'key';
   IF ratios ? key THEN q:=(ratios->>key)::numeric;ELSE q:=(p_input->>key)::numeric;END IF;
   t:=(x->>'threshold')::numeric;w:=(x->>'weight')::numeric;
   IF x->>'kind'='LINEAR_CAP' THEN w:=CASE WHEN q>=t THEN w ELSE q/t*w END;
   ELSIF x->>'kind'='INVERSE_CAP' THEN w:=CASE WHEN q<=t THEN w ELSE t/q*w END;
   ELSE RAISE EXCEPTION '规则含未支持的权值公式类型' USING ERRCODE='22023'; END IF;
   weights:=weights||jsonb_build_object(x->>'symbol',w);total_weight:=total_weight+w;
 END LOOP;
 s1:=(p_input->>'easy_stock_m3')::numeric/total_stock*(p#>>'{tree_parameters,percentage_scale}')::numeric;
 s2:=(p_input->>'combustible_stock_m3')::numeric/total_stock*(p#>>'{tree_parameters,percentage_scale}')::numeric;
 s3:=(p_input->>'difficult_stock_m3')::numeric/total_stock*(p#>>'{tree_parameters,percentage_scale}')::numeric;
 t:=(p#>>'{tree_parameters,threshold_pct}')::numeric;
 f1:=CASE WHEN s1>=t THEN (p#>>'{tree_parameters,easy_weight}')::numeric ELSE s1/t*(p#>>'{tree_parameters,easy_weight}')::numeric END;
 f2:=s2/t*(p#>>'{tree_parameters,combustible_coefficient}')::numeric;
 f3:=CASE WHEN s3<=t THEN (p#>>'{tree_parameters,difficult_weight}')::numeric ELSE t/s3*(p#>>'{tree_parameters,difficult_weight}')::numeric END;
 w:=greatest(f1,f2,f3);total_weight:=total_weight+w;
 weights:=weights||jsonb_build_object('F',w);
 FOR x IN SELECT value FROM jsonb_array_elements(p#>'{grade_parameters,thresholds}') LOOP
   key:=x->>'key';
   q:=CASE WHEN key='share' THEN forest_share ELSE (p_input->>(x->>'resource_input'))::numeric/(x->>'resource_scale')::numeric END*total_weight;
   grade_rank:=CASE WHEN q>(x->>'high')::numeric THEN 1 WHEN q<(x->>'low')::numeric THEN 3 ELSE 2 END;
   SELECT value->>'code' INTO code FROM jsonb_array_elements(p#>'{grade_parameters,grades}') WHERE (value->>'rank')::integer=grade_rank;
   scores:=scores||jsonb_build_object(key,q);score_grades:=score_grades||jsonb_build_object(key,code);initial_rank:=least(initial_rank,grade_rank);
 END LOOP;
 adj:=p_input->'adjustment';
 IF adj IS NULL OR adj='null'::jsonb THEN adj:='{}';
 ELSIF jsonb_typeof(adj)<>'object' THEN errors:=errors||jsonb_build_array('adjustment须为对象');adj:='{}';END IF;
 FOR key IN SELECT jsonb_array_elements_text(p#>'{adjustment_parameters,boolean_fields}') LOOP
   IF adj->key IS NULL OR adj->key='null'::jsonb THEN adjustment_missing:=adjustment_missing||jsonb_build_array(key);
   ELSIF jsonb_typeof(adj->key)<>'boolean' THEN errors:=errors||jsonb_build_array(key||'须为布尔值');END IF;
 END LOOP;
 FOR key IN SELECT jsonb_array_elements_text(p#>'{adjustment_parameters,count_fields}') LOOP
   IF adj->key IS NULL OR adj->key='null'::jsonb THEN adjustment_missing:=adjustment_missing||jsonb_build_array(key);
   ELSIF jsonb_typeof(adj->key)<>'number' THEN errors:=errors||jsonb_build_array(key||'须为数值');
   ELSIF (adj->>key)::numeric<0 OR (adj->>key)::numeric<>trunc((adj->>key)::numeric) THEN errors:=errors||jsonb_build_array(key||'须为非负整数');END IF;
 END LOOP;
 IF jsonb_array_length(errors)>0 THEN RETURN jsonb_build_object('status','INVALID_INPUT','errors',errors,'formal_result',false);END IF;
 cover:=(p_input->>'forest_cover_pct')::numeric;
 IF cover IS NULL THEN adjustment_missing:=adjustment_missing||jsonb_build_array('forest_cover_pct');END IF;
 a:=(adj->>'critical_target_with_fire_task')::boolean;
 national_target:=(adj->>'national_target_with_fire_task')::boolean;
 border_target:=(adj->>'border_county_with_fire_task')::boolean;
 b:=cover>=(p#>>'{adjustment_parameters,forest_cover_threshold_pct}')::numeric OR national_target OR border_target;
 major_count:=(adj->>'major_or_extreme_fire_5y_count')::numeric;larger_count:=(adj->>'larger_fire_5y_count')::numeric;general_count:=(adj->>'general_fire_5y_count')::numeric;fire_free:=(adj->>'fire_free_years')::numeric;
 IF fire_free>=5 AND (major_count>0 OR larger_count>0 OR general_count>0) THEN RETURN jsonb_build_object('status','INVALID_INPUT','errors',jsonb_build_array('连续无火灾年数与近5年火灾次数矛盾'),'formal_result',false);END IF;
 c1:=major_count>0;c2:=larger_count>0 OR general_count>=(p#>>'{adjustment_parameters,general_fire_count_threshold}')::numeric;
 d:=cover<(p#>>'{adjustment_parameters,low_forest_cover_pct}')::numeric AND NOT (a OR b OR c1 OR c2);
 e:=fire_free>=(p#>>'{adjustment_parameters,fire_free_year_threshold}')::numeric;
 IF a AND cover IS NOT NULL THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.a','operation','RECOMMENDED','target_rank',CASE WHEN cover>=(p#>>'{adjustment_parameters,forest_cover_threshold_pct}')::numeric THEN 1 ELSE 2 END));END IF;
 IF b THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.b','operation','MAY_RAISE','target_rank',least(initial_rank,2)));END IF;
 IF cover<(p#>>'{adjustment_parameters,forest_cover_threshold_pct}')::numeric THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.b','operation','LEVEL_CAP','target_rank',greatest(initial_rank,2)));END IF;
 IF c1 THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.c','operation','RECOMMENDED','target_rank',1));END IF;
 IF c2 THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.c','operation','MAY_RAISE','target_rank',least(initial_rank,2)));END IF;
 IF d THEN matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.d','operation',CASE WHEN p#>>'{project_adjustment_policy,d_exclusion}'='A_B_C_RAISING_OR_RECOMMENDED_CONDITIONS_ONLY' THEN 'PROJECT_CONFIRMED_MAY_SET' ELSE 'PENDING_EXCLUSION_INTERPRETATION' END,'target_rank',3,'note','原文与用户确认的项目解释分别保存；不将纯低覆盖率上限作为排除d的提高条件'));END IF;
 IF e THEN
   matches:=matches||jsonb_build_array(jsonb_build_object('clause','5.2.e','operation','MAY_LOWER','target_rank',NULL));
   IF coalesce((p#>>'{project_adjustment_policy,no_fire_10y_auto_lower}')::boolean,true) AND coalesce(adj->>'forest_structure_distribution_ref','') !~ '[^[:space:]]' THEN adjustment_missing:=adjustment_missing||jsonb_build_array('forest_structure_distribution_ref');END IF;
 END IF;
 conflict:=cover<(p#>>'{adjustment_parameters,forest_cover_threshold_pct}')::numeric AND c1;
 conflict:=coalesce(conflict,false);
 all_known:=jsonb_array_length(adjustment_missing)=0;
 decision:=p_input->'adjustment_decision';
 IF (decision IS NULL OR decision='null'::jsonb) AND all_known
    AND p#>>'{project_adjustment_policy,status}'='USER_CONFIRMED_PROJECT_POLICY' THEN
   IF conflict AND p#>>'{project_adjustment_policy,major_fire_over_low_cover_cap}'='I' THEN
     decision:=jsonb_build_object('mode','ADOPTED','grade_code','I','clauses',jsonb_build_array('5.2.c'),'basis_ref',p#>>'{project_adjustment_policy,confirmation_ref}','decision_origin','USER_CONFIRMED_PROJECT_POLICY');
   ELSIF d AND p#>>'{project_adjustment_policy,d_exclusion}'='A_B_C_RAISING_OR_RECOMMENDED_CONDITIONS_ONLY' THEN
     decision:=jsonb_build_object('mode','ADOPTED','grade_code','III','clauses',jsonb_build_array('5.2.d'),'basis_ref',p#>>'{project_adjustment_policy,confirmation_ref}','decision_origin','USER_CONFIRMED_PROJECT_POLICY');
   ELSIF e AND p#>>'{project_adjustment_policy,no_fire_10y_auto_lower}'='false'
      AND NOT EXISTS(SELECT 1 FROM jsonb_array_elements(matches) m WHERE m->>'operation'<>'MAY_LOWER' AND ((m->>'target_rank') IS NULL OR (m->>'target_rank')::integer<>initial_rank)) THEN
     decision:=jsonb_build_object('mode','NOT_ADOPTED','basis_ref',p#>>'{project_adjustment_policy,confirmation_ref}','decision_origin','USER_CONFIRMED_NO_AUTOMATIC_DOWNGRADE');
   END IF;
 END IF;
 IF decision IS NOT NULL AND decision<>'null'::jsonb THEN
   IF jsonb_typeof(decision)<>'object' THEN errors:=errors||jsonb_build_array('adjustment_decision须为对象');
   ELSE
     mode:=decision->>'mode';
     IF mode IS NULL OR mode NOT IN ('NOT_ADOPTED','ADOPTED') THEN errors:=errors||jsonb_build_array('采用决定mode须为NOT_ADOPTED或ADOPTED');END IF;
     IF coalesce(decision->>'basis_ref','') !~ '[^[:space:]]' THEN errors:=errors||jsonb_build_array('采用决定须提供basis_ref');END IF;
     IF mode='NOT_ADOPTED' THEN final_rank:=initial_rank;adjustment_status:='EXPLICIT_NOT_ADOPTED';
     ELSIF mode='ADOPTED' THEN
       SELECT (value->>'rank')::integer INTO final_rank FROM jsonb_array_elements(p#>'{grade_parameters,grades}') WHERE value->>'code'=decision->>'grade_code';
       IF final_rank IS NULL THEN errors:=errors||jsonb_build_array('调整后等级须为规则登记的I、II或III');END IF;
       selected:=decision->'clauses';
       IF jsonb_typeof(selected) IS DISTINCT FROM 'array' THEN errors:=errors||jsonb_build_array('采用调整须有clauses数组');
       ELSIF jsonb_array_length(selected)=0 THEN errors:=errors||jsonb_build_array('采用调整的clauses不得为空');
       ELSE
         FOR v IN SELECT value FROM jsonb_array_elements(selected) LOOP
           IF jsonb_typeof(v)<>'string' THEN errors:=errors||jsonb_build_array('clauses须为条款字符串数组');CONTINUE;END IF;
           clause:=v#>>'{}';selected_match:=false;
           FOR x IN SELECT value FROM jsonb_array_elements(matches) WHERE value->>'clause'=clause LOOP
             selected_match:=true;
             IF x->>'operation'='PENDING_EXCLUSION_INTERPRETATION' THEN
               IF coalesce(decision->>'interpretation_ref','') !~ '[^[:space:]]' THEN
                 errors:=errors||jsonb_build_array('5.2.d排除范围待明确，采用须提供interpretation_ref');
               ELSIF final_rank=(x->>'target_rank')::integer THEN candidate_allowed:=true;END IF;
             ELSIF x->>'operation'='MAY_LOWER' THEN
               IF final_rank>initial_rank AND coalesce(adj->>'forest_structure_distribution_ref','') ~ '[^[:space:]]' THEN candidate_allowed:=true;END IF;
             ELSIF final_rank=(x->>'target_rank')::integer THEN candidate_allowed:=true;
             END IF;
           END LOOP;
           all_selected_match:=all_selected_match AND selected_match;
         END LOOP;
         IF NOT all_selected_match THEN errors:=errors||jsonb_build_array('存在未命中或未明确事实的采用条款');END IF;
         IF NOT candidate_allowed THEN errors:=errors||jsonb_build_array('调整后等级与所选条款的实际命中条件不一致');END IF;
       END IF;
       adjustment_status:='EXPLICIT_ADOPTED';
     END IF;
     IF conflict AND mode IN ('ADOPTED','NOT_ADOPTED') THEN
       IF p#>>'{project_adjustment_policy,major_fire_over_low_cover_cap}'='I' THEN
         IF final_rank IS DISTINCT FROM 1 THEN errors:=errors||jsonb_build_array('采用等级与用户确认的重特大火灾I级优先项目口径不符');END IF;
       ELSIF coalesce(decision->>'conflict_resolution_ref','') !~ '[^[:space:]]' THEN final_rank:=NULL;adjustment_status:='PENDING_CONFLICT_PRIORITY';END IF;
     END IF;
     IF NOT all_known THEN final_rank:=NULL;adjustment_status:='PENDING_FACTS';END IF;
   END IF;
 ELSE
   IF all_known AND jsonb_array_length(matches)=0 THEN final_rank:=initial_rank;adjustment_status:='NO_ADJUSTMENT_CONDITION_MATCHED';
   ELSIF all_known THEN adjustment_status:='PENDING_ADOPTION_DECISION';END IF;
 END IF;
 IF jsonb_array_length(errors)>0 THEN final_rank:=NULL;adjustment_status:='INVALID_DECISION';END IF;
 SELECT value->>'code' INTO code FROM jsonb_array_elements(p#>'{grade_parameters,grades}') WHERE (value->>'rank')::integer=initial_rank;
 result:=jsonb_build_object('standard_no',p->'standard_no','rule_id',p_rule_id,'status',CASE WHEN jsonb_array_length(errors)>0 THEN 'INVALID_INPUT' WHEN final_rank IS NULL THEN 'BASE_CALCULATED_ADJUSTMENT_PENDING' ELSE 'CALCULATED_NOT_FORMAL' END,'formal_result',false,'weights',weights,'tree_candidates',jsonb_build_object('S1',s1,'S2',s2,'S3',s3,'F1',f1,'F2',f2,'F3',f3),'derived_ratios',ratios,'factor_sum',total_weight,'scores',scores,'score_grades',score_grades,'initial_grade_code',code,'adjustment_matches',matches,'adjustment_missing_inputs',adjustment_missing,'adjustment_conflict',conflict,'adjustment_status',adjustment_status,'adjustment_decision',decision,'rounding',p->'rounding','project_policy',p->'project_adjustment_policy','errors',errors,'formal_execution_enabled',p->'execution_enabled','pending_adoption_items',p->'pending_adoption_items');
 SELECT value->>'code',value->>'name' INTO code,grade_name FROM jsonb_array_elements(p#>'{grade_parameters,grades}') WHERE (value->>'rank')::integer=final_rank;
 RETURN result||jsonb_build_object('final_grade_code',code,'final_grade_name',grade_name);
END;
$$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_evaluate(p_rule_id character varying, p_input jsonb) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_lyt1063_2025_evaluate(p_rule_id character varying, p_input jsonb); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_lyt1063_2025_evaluate(p_rule_id character varying, p_input jsonb) IS 'LY/T 1063—2025只读计算：按规则JSON计算七因子、三项得分及表1初判，列出5.2命中条件；实际调整须明确事实及采用依据。不写指标或成果，不代替正式任务运行。';


--
-- Name: fn_wc_lyt1063_2025_input_adoption(public.wc_fire_indicator_value); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_input_adoption(v public.wc_fire_indicator_value) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE c jsonb;contract jsonb;ref jsonb;s jsonb;x jsonb;m jsonb;adopted date;k text;ru text;
BEGIN
 IF v.normalized_value IS NOT NULL OR v.assigned_score IS NOT NULL OR v.score_rule_id IS NOT NULL OR v.normalization_param_id IS NOT NULL
   OR jsonb_typeof(v.input_refs->'lyt1063_adoption') IS DISTINCT FROM 'object' THEN
  RAISE EXCEPTION '新版发布统计采用只接收有专用引用的原值，不混用旧评分或归一化' USING ERRCODE='23514';END IF;
 adopted:=public.fn_wc_fire_result_date(v.input_refs#>>'{lyt1063_adoption,adopted_on}');
 c:=public.fn_wc_lyt1063_2025_context(v.task_id,v.unit_id,v.input_refs#>>'{lyt1063_adoption,rule_id}',adopted,false);
 SELECT value INTO contract FROM jsonb_array_elements(c#>'{rule,parameter_json,input_contract}') WHERE value->>'indicator_code'=v.indicator_code;
 IF contract IS NULL OR v.unit IS DISTINCT FROM contract->>'unit' OR v.raw_value IS NULL
   OR jsonb_typeof(v.input_refs->'inputs') IS DISTINCT FROM 'array' OR jsonb_array_length(v.input_refs->'inputs')<>1
   OR v.input_refs->>'method_version' IS DISTINCT FROM c#>>'{rule,parameter_json,method_version}' THEN
  RAISE EXCEPTION '新版指标、单位、具体统计来源或采用版本不一致' USING ERRCODE='23514';END IF;
 ref:=v.input_refs->'inputs'->0;s:=public.fn_wc_fire_source_record(ref,v.task_id);x:=s->'record';
 SELECT metadata_json INTO m FROM public.wc_fire_task_source WHERE task_id=v.task_id AND source_code=ref->>'source_code' AND source_batch=ref->>'source_batch';
 k:=contract->>'key';
 IF ((contract->>'min') IS NOT NULL AND v.raw_value<(contract->>'min')::numeric)
   OR ((contract->>'max') IS NOT NULL AND v.raw_value>(contract->>'max')::numeric) THEN
  RAISE EXCEPTION '新版统计值超出原指标有效范围' USING ERRCODE='23514';END IF;
 IF s->>'source_object' IS DISTINCT FROM 'PUBLISHED_STATISTICS' OR x->>'unit_id' IS DISTINCT FROM v.unit_id OR x->>'period_key' IS DISTINCT FROM v.period_key
   OR jsonb_typeof(x->k) IS DISTINCT FROM 'number' OR v.raw_value IS DISTINCT FROM (x->>k)::numeric
   OR x->'field_units'->>k IS DISTINCT FROM v.unit OR coalesce(x->'definition_refs'->>k,'') !~ '[^[:space:]]'
   OR v.period_type NOT IN ('SNAPSHOT','INTERVAL') OR v.period_type IS NULL
   OR (v.period_type='SNAPSHOT' AND (v.as_of_date IS NULL OR x->>'as_of_date' IS DISTINCT FROM v.as_of_date::text OR v.as_of_date>adopted))
   OR (v.period_type='INTERVAL' AND (v.stat_start IS NULL OR v.stat_end IS NULL OR x->>'stat_start' IS DISTINCT FROM v.stat_start::text OR x->>'stat_end' IS DISTINCT FROM v.stat_end::text OR v.stat_end>adopted)) THEN
  RAISE EXCEPTION '发布统计的原值、单位、定义、单元或期间与具体清单记录不符' USING ERRCODE='23514';END IF;
 IF v.indicator_code IN ('L25_FIRE_PERIOD_TEMP','L25_FIRE_PERIOD_WIND','L25_FIRE_PERIOD_PRECIP','L25_FIRE_PERIOD_MIN_RH') THEN
  IF m->>'authority_category' IS DISTINCT FROM 'METEOROLOGICAL_AUTHORITY'
    OR coalesce(m->>'authority_level','') NOT IN ('COUNTY','PREFECTURE','PROVINCE','NATIONAL')
    OR v.period_type<>'INTERVAL' OR v.stat_start::text IS DISTINCT FROM c#>>'{task,data_start}' OR v.stat_end::text IS DISTINCT FROM c#>>'{task,data_end}'
    OR x->>'fire_season_start' IS DISTINCT FROM c#>>'{task,fire_season_start}' OR x->>'fire_season_end' IS DISTINCT FROM c#>>'{task,fire_season_end}'
    OR coalesce(x->>'statistical_method_ref','') !~ '[^[:space:]]' THEN
   RAISE EXCEPTION '新版气象须县级及以上气象部门正式五年防火期统计，不套旧合成或自补月份算法' USING ERRCODE='23514';END IF;
 ELSIF v.indicator_code IN ('L25_EASY_STOCK','L25_COMBUSTIBLE_STOCK','L25_DIFFICULT_STOCK','L25_CLASS_TOTAL_STOCK','L25_FOREST_RESOURCE_AREA','L25_STANDING_STOCK','L25_FOREST_COVER_PCT') THEN
  IF m->>'resource_monitoring_basis' IS DISTINCT FROM 'LATEST_NATIONAL_FOREST_GRASS_MONITORING'
    OR coalesce(m->>'resource_monitoring_version','') !~ '[^[:space:]]' OR m->>'latest_version_confirmed' IS DISTINCT FROM 'true'
    OR coalesce(m->>'latest_version_review_ref','') !~ '[^[:space:]]' THEN
   RAISE EXCEPTION '新版资源统计须最新全国林草生态综合监测成果及最新性核验' USING ERRCODE='23514';END IF;
  IF v.indicator_code IN ('L25_EASY_STOCK','L25_COMBUSTIBLE_STOCK','L25_DIFFICULT_STOCK','L25_CLASS_TOTAL_STOCK')
    AND (x->>'classification_version' IS DISTINCT FROM 'LYT1063_2025' OR x->>'classification_coverage' IS DISTINCT FROM 'COMPLETE'
      OR coalesce(x->>'classification_basis_ref','') !~ '[^[:space:]]') THEN
   RAISE EXCEPTION '三类蓄积须新版分类完整覆盖依据，不忽略未知树种或重复计数' USING ERRCODE='23514';END IF;
 END IF;
 IF v.indicator_code='L25_FOREST_COVER_PCT' THEN
  IF v.input_refs->'lyt1063_adjustment' IS DISTINCT FROM x->'adjustment' OR jsonb_typeof(x->'adjustment') IS DISTINCT FROM 'object'
    OR coalesce(x#>>'{adjustment,facts_ref}','') !~ '[^[:space:]]'
    OR v.input_refs->'lyt1063_adjustment_decision' IS DISTINCT FROM x->'adjustment_decision' THEN
   RAISE EXCEPTION '调整事实与采用决定须来自已核验来源记录，不接受临时夹带' USING ERRCODE='23514';END IF;
 END IF;
 RETURN jsonb_build_object('adoption_kind','LYT1063_PUBLISHED_STATISTIC','rule',c->'rule','source',s,'adopted_on',adopted,'statistic_key',k);
END $$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_input_adoption(v public.wc_fire_indicator_value) OWNER TO postgres;

--
-- Name: fn_wc_lyt1063_2025_result_adoption(public.wc_fire_result_layer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_result_adoption(v public.wc_fire_result_layer) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE snapshot jsonb;c jsonb;u public.wc_fire_spatial_unit%ROWTYPE;refs jsonb:=v.calculation_refs;adopted date;
BEGIN
 IF v.unit_id IS NULL OR v.period_key IS NULL OR v.source_rule_id IS NULL OR coalesce(v.source_batch,'') !~ '[^[:space:]]'
    OR v.upstream_result_id IS NOT NULL OR v.index_value IS NOT NULL OR num_nonnulls(v.zone_code,v.zone_name)>0 THEN
  RAISE EXCEPTION '新版县级成果须确切任务、单元、期间、规则及成果批次，不混用指数或旧图上游' USING ERRCODE='23514';END IF;
 adopted:=public.fn_wc_fire_result_date(refs->>'calculated_on');
 IF NOT EXISTS(SELECT 1 FROM public.wc_fire_output_catalog WHERE output_code='LYT1063_2025_COUNTY_GRADE'
   AND enabled AND allowed_unit_types='["COUNTY"]'::jsonb AND content_contract_json->>'formal_execution_enabled'='true') THEN
  RAISE EXCEPTION '新版县级成果目录及正式采用开关未启用' USING ERRCODE='23514';END IF;
 snapshot:=public.fn_wc_lyt1063_2025_calculate(v.task_id,v.unit_id,v.period_key,v.source_rule_id,adopted);
 c:=snapshot->'context';
 IF refs->>'model_version' IS DISTINCT FROM c#>>'{task,model_version}' OR refs->>'rule_version' IS DISTINCT FROM c#>>'{rule,rule_version}'
   OR refs->>'method_version' IS DISTINCT FROM c#>>'{rule,parameter_json,method_version}'
   OR v.grade_code IS DISTINCT FROM snapshot#>>'{calculation,final_grade_code}' OR v.grade_name IS DISTINCT FROM snapshot#>>'{calculation,final_grade_name}' THEN
  RAISE EXCEPTION '新版成果版本或等级与实际完整指标计算不一致' USING ERRCODE='23514';END IF;
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=v.task_id AND unit_id=v.unit_id;
 IF GeometryType(v.geom)<>'MULTIPOLYGON' OR ST_SRID(v.geom)<>4490 OR NOT ST_Equals(v.geom,u.geom) THEN
  RAISE EXCEPTION '新版县级成果边界须与正式县级空间单元完全对应' USING ERRCODE='23514';END IF;
 RETURN snapshot;
END $$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_result_adoption(v public.wc_fire_result_layer) OWNER TO postgres;

--
-- Name: fn_wc_lyt1063_2025_run(text, text, text, text, text, text, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_lyt1063_2025_run(p_task text, p_unit text, p_period text, p_rule text, p_result text, p_batch text, p_on date) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO 'pg_catalog', 'public'
    AS $$
DECLARE snapshot jsonb;r public.wc_fire_result_layer%ROWTYPE;u public.wc_fire_spatial_unit%ROWTYPE;c jsonb;
BEGIN
 snapshot:=public.fn_wc_lyt1063_2025_calculate(p_task,p_unit,p_period,p_rule,p_on);c:=snapshot->'context';
 IF coalesce(p_result,'') !~ '[^[:space:]]' OR coalesce(p_batch,'') !~ '[^[:space:]]' THEN RAISE EXCEPTION '成果编号和成果批次须显式提供' USING ERRCODE='23514';END IF;
 SELECT * INTO u FROM public.wc_fire_spatial_unit WHERE task_id=p_task AND unit_id=p_unit;
 INSERT INTO public.wc_fire_result_layer(result_id,task_id,output_code,unit_id,source_rule_id,grade_code,grade_name,data_status,source_batch,geom,period_key,calculation_refs)
 VALUES(p_result,p_task,'LYT1063_2025_COUNTY_GRADE',p_unit,p_rule,snapshot#>>'{calculation,final_grade_code}',snapshot#>>'{calculation,final_grade_name}','VALID',p_batch,u.geom,p_period,
 jsonb_build_object('model_version',c#>>'{task,model_version}','rule_version',c#>>'{rule,rule_version}','method_version',c#>>'{rule,parameter_json,method_version}','calculated_on',p_on::text)) RETURNING * INTO r;
 UPDATE public.wc_fire_assessment_task SET task_status='CALCULATED' WHERE task_id=p_task AND task_status='READY_FOR_CALCULATION';
 RETURN jsonb_build_object('result_id',r.result_id,'grade_code',r.grade_code,'grade_name',r.grade_name,'data_status',r.data_status,'output_code',r.output_code,'formal_result',true,'period_key',r.period_key,'source_batch',r.source_batch);
END $$;


ALTER FUNCTION public.fn_wc_lyt1063_2025_run(p_task text, p_unit text, p_period text, p_rule text, p_result text, p_batch text, p_on date) OWNER TO postgres;

--
-- Name: fn_wc_normalization_adoption(bigint, character varying, character varying, character varying, numeric, numeric, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_normalization_adoption(parameter_id bigint, adoption_task character varying, indicator character varying, actual_unit character varying, actual_raw numeric, actual_normalized numeric, require_complete boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE p public.wc_normalization_parameter%ROWTYPE; hazard_member boolean;
BEGIN
 SELECT * INTO p FROM public.wc_normalization_parameter WHERE param_id=parameter_id;
 IF NOT FOUND OR p.indicator_code IS DISTINCT FROM indicator OR (p.task_id IS NOT NULL AND p.task_id<>adoption_task) THEN
   RAISE EXCEPTION '标准化参数与任务或指标不匹配' USING ERRCODE='23503'; END IF;
 IF NOT require_complete THEN RETURN; END IF;
 IF p.approval_status<>'APPROVED' OR p.min_value IS NULL OR p.max_value IS NULL OR NOT(p.max_value>p.min_value)
    OR p.formula IS NULL OR p.method_version IS NULL OR p.input_unit IS NULL OR p.sample_scope IS NULL THEN
   RAISE EXCEPTION '标准化参数尚未确认或采用信息不完整' USING ERRCODE='23514'; END IF;
 IF p.sample_count IS NULL AND (p.source_refs->>'parameter_origin' IS DISTINCT FROM 'OFFICIAL_PROVIDED' OR p.sample_scope IS DISTINCT FROM 'NATIONAL') THEN
   RAISE EXCEPTION '非全国直接提供参数须真实样本数' USING ERRCODE='23514'; END IF;
 PERFORM public.fn_wc_normalization_source_refs(p.source_refs,adoption_task,true);
 IF actual_unit IS DISTINCT FROM p.input_unit THEN
   RAISE EXCEPTION '指标原值单位与标准化参数单位不一致，须先明确换算' USING ERRCODE='23514'; END IF;
 hazard_member := indicator IN ('TOTAL_FUEL_LOAD','FINE_FUEL_LOAD','FIRE_USE_FREQUENCY','IMPORTANT_SOURCE_DENSITY','SPECIAL_POPULATION_DENSITY');
 IF hazard_member THEN
   IF p.sample_scope IS DISTINCT FROM 'NATIONAL' OR p.formula IS DISTINCT FROM 'X''=(X-Xmin)/(Xmax-Xmin)' THEN
     RAISE EXCEPTION '危险性五项须采用全国正向离差标准化' USING ERRCODE='23514'; END IF;
   IF actual_raw IS NULL OR actual_raw<p.min_value OR actual_raw>p.max_value
      OR actual_normalized IS NULL OR round((actual_raw-p.min_value)/(p.max_value-p.min_value),8) IS DISTINCT FROM actual_normalized THEN
     RAISE EXCEPTION '标准化值与原值/参数正向公式不一致或原值超出范围，未截断或补零' USING ERRCODE='23514'; END IF;
 END IF;
END $$;


ALTER FUNCTION public.fn_wc_normalization_adoption(parameter_id bigint, adoption_task character varying, indicator character varying, actual_unit character varying, actual_raw numeric, actual_normalized numeric, require_complete boolean) OWNER TO postgres;

--
-- Name: fn_wc_normalization_parameter_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_normalization_parameter_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE hazard_member boolean;
BEGIN
 IF TG_OP IN ('UPDATE','DELETE') THEN
   IF EXISTS(SELECT 1 FROM public.wc_fire_indicator_value WHERE normalization_param_id=OLD.param_id AND value_status='VALID')
      OR EXISTS(SELECT 1 FROM public.wc_fire_result_layer r
        CROSS JOIN LATERAL jsonb_array_elements(r.calculation_refs#>'{adopted_snapshot,indicator_values}') item
        WHERE r.output_code IN ('HAZARD_INDEX','HAZARD_GRADE') AND r.data_status IN ('VALID','REVIEWED','PUBLISHED')
          AND item#>>'{normalization_parameter,param_id}'=OLD.param_id::text) THEN
     IF TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD THEN
       RAISE EXCEPTION '已正式采用的标准化参数不可覆盖或删除，请采用新参数记录' USING ERRCODE='23514'; END IF;
   END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 hazard_member := NEW.indicator_code IN ('TOTAL_FUEL_LOAD','FINE_FUEL_LOAD','FIRE_USE_FREQUENCY','IMPORTANT_SOURCE_DENSITY','SPECIAL_POPULATION_DENSITY');
 PERFORM public.fn_wc_normalization_source_refs(NEW.source_refs,NEW.task_id,NEW.approval_status='APPROVED');
 IF NEW.approval_status='APPROVED' THEN
   IF NEW.sample_count IS NULL AND (NEW.source_refs->>'parameter_origin' IS DISTINCT FROM 'OFFICIAL_PROVIDED' OR NEW.sample_scope IS DISTINCT FROM 'NATIONAL') THEN
     RAISE EXCEPTION '只有有依据的全国直接提供参数允许样本数未知；自行统计需真实样本数' USING ERRCODE='23514'; END IF;
   IF hazard_member AND (NEW.sample_scope IS DISTINCT FROM 'NATIONAL'
      OR NEW.formula IS DISTINCT FROM 'X''=(X-Xmin)/(Xmax-Xmin)'
      OR NEW.min_value<0 OR NEW.max_value<0) THEN
     RAISE EXCEPTION '危险性五项须全国、非负同口径原值的正向离差参数' USING ERRCODE='23514'; END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_normalization_parameter_prerequisites() OWNER TO postgres;

--
-- Name: fn_wc_normalization_source_refs(jsonb, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_normalization_source_refs(refs jsonb, adoption_task character varying, require_complete boolean) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE item jsonb; key_name text; batch_quality text;
BEGIN
 IF refs IS NULL THEN
   IF require_complete THEN RAISE EXCEPTION '已确认参数需要来源引用' USING ERRCODE='23514'; END IF;
   RETURN;
 END IF;
 IF jsonb_typeof(refs) IS DISTINCT FROM 'object' OR jsonb_typeof(refs->'inputs') IS DISTINCT FROM 'array' THEN
   RAISE EXCEPTION '参数来源须为含inputs数组的对象' USING ERRCODE='23514'; END IF;
 IF require_complete THEN
   IF jsonb_array_length(refs->'inputs')=0 OR refs->>'coverage_status' IS DISTINCT FROM 'COMPLETE'
      OR jsonb_typeof(refs->'parameter_version') IS DISTINCT FROM 'string'
      OR coalesce(refs->>'parameter_version','') !~ '[^[:space:]]'
      OR jsonb_typeof(refs->'scope_evidence') IS DISTINCT FROM 'string'
      OR coalesce(refs->>'scope_evidence','') !~ '[^[:space:]]'
      OR coalesce(refs->>'parameter_origin','') NOT IN ('OFFICIAL_PROVIDED','DERIVED') THEN
     RAISE EXCEPTION '参数来源缺参数版本、范围依据、完整覆盖或来源类型' USING ERRCODE='23514'; END IF;
   IF refs->>'parameter_origin'='DERIVED' AND NOT EXISTS
      (SELECT 1 FROM jsonb_array_elements(refs->'inputs') e WHERE jsonb_typeof(e->'manifest_ref')='string'
         AND e->>'manifest_ref' ~ '[^[:space:]]' AND jsonb_typeof(e->'manifest_sha256')='string'
         AND e->>'manifest_sha256' ~ '^[0-9A-Fa-f]{64}$') THEN
     RAISE EXCEPTION '自行统计参数须引用样本清单' USING ERRCODE='23514'; END IF;
 END IF;
 FOR item IN SELECT value FROM jsonb_array_elements(refs->'inputs') LOOP
   IF jsonb_typeof(item) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION '参数来源项须为对象' USING ERRCODE='23514'; END IF;
   FOREACH key_name IN ARRAY ARRAY['source_code','source_batch','source_object'] LOOP
     IF jsonb_typeof(item->key_name) IS DISTINCT FROM 'string' OR item->>key_name !~ '[^[:space:]]' THEN
       RAISE EXCEPTION '参数来源缺有效字段：%',key_name USING ERRCODE='23514'; END IF;
   END LOOP;
   IF NOT ((jsonb_typeof(item->'record_id')='string' AND item->>'record_id' ~ '[^[:space:]]') IS TRUE)
      AND NOT ((jsonb_typeof(item->'manifest_ref')='string' AND item->>'manifest_ref' ~ '[^[:space:]]'
        AND jsonb_typeof(item->'manifest_sha256')='string' AND item->>'manifest_sha256' ~ '^[0-9A-Fa-f]{64}$') IS TRUE) THEN
     RAISE EXCEPTION '参数来源须定位记录或带校验值的清单' USING ERRCODE='23514'; END IF;
   IF NOT EXISTS(SELECT 1 FROM public.wc_fire_source_registry WHERE source_code=item->>'source_code') THEN
     RAISE EXCEPTION '参数来源代码未登记' USING ERRCODE='23503'; END IF;
   IF adoption_task IS NOT NULL THEN
     SELECT quality_status INTO batch_quality FROM public.wc_fire_task_source
      WHERE task_id=adoption_task AND source_code=item->>'source_code' AND source_batch=item->>'source_batch';
     IF NOT FOUND THEN RAISE EXCEPTION '参数来源批次未关联采用任务' USING ERRCODE='23503'; END IF;
     IF require_complete AND batch_quality<>'PASSED' THEN RAISE EXCEPTION '参数来源批次尚未通过质量检查' USING ERRCODE='23514'; END IF;
   END IF;
 END LOOP;
END $_$;


ALTER FUNCTION public.fn_wc_normalization_source_refs(refs jsonb, adoption_task character varying, require_complete boolean) OWNER TO postgres;

--
-- Name: fn_wc_p03_county_parent_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_county_parent_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
 IF (TG_OP='DELETE' OR NEW.task_id IS DISTINCT FROM OLD.task_id OR NEW.unit_id IS DISTINCT FROM OLD.unit_id
    OR NEW.unit_type IS DISTINCT FROM OLD.unit_type OR NEW.parent_unit_id IS DISTINCT FROM OLD.parent_unit_id)
  AND EXISTS(SELECT 1 FROM wc_fire_indicator_value v WHERE v.task_id=OLD.task_id
   AND v.indicator_code='DISASTER_REDUCTION_CAPACITY' AND v.value_status='VALID'
   AND v.input_refs#>>'{p03_county_shared_snapshot,policy_code}' IN('WC_P03_COUNTY_SHARED_20261020','WC_P03_TOWNSHIP_6_7_20261020')
   AND (v.unit_id=OLD.unit_id OR v.input_refs#>>'{p03_county_shared_snapshot,county_unit_id}'=OLD.unit_id)) THEN
  RAISE EXCEPTION 'P03_COUNTY_SHARED: 县乡归属已被有效乡镇合成采用，不可原位换挂或删除' USING ERRCODE='23514';END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_county_parent_guard() OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_p03_county_parent_guard(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_p03_county_parent_guard() IS 'P03县级6项共同采用后保护父县关系；不自动分摊财政或共用物资';


--
-- Name: fn_wc_p03_downstream_source_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_downstream_source_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF OLD.indicator_code NOT IN('P11','P12','P13','P14','P15','P21','P22','P23','P31','P32','P33','P41','P42','DISASTER_REDUCTION_CAPACITY') THEN
  IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
 END IF;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
 IF (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) AND (
  EXISTS(SELECT 1 FROM wc_fire_indicator_value v WHERE v.task_id=OLD.task_id AND v.period_key=OLD.period_key AND v.value_status='VALID'
   AND EXISTS(SELECT 1 FROM jsonb_array_elements(v.input_refs->'p03_component_snapshot')a WHERE a->>'unit_id'=OLD.unit_id AND a->>'indicator_code'=OLD.indicator_code))
  OR (OLD.indicator_code='DISASTER_REDUCTION_CAPACITY' AND EXISTS(SELECT 1 FROM wc_fire_rule_definition q
   WHERE q.task_id=OLD.task_id AND q.approval_status='APPROVED' AND q.parameter_json->>'record_purpose'='P03_GRADE_SAMPLE'
    AND q.parameter_json#>>'{sample_set,period_key}'=OLD.period_key
    AND EXISTS(SELECT 1 FROM jsonb_array_elements(q.parameter_json#>'{sample_set,members}')a WHERE a->>'unit_id'=OLD.unit_id)))) THEN
  RAISE EXCEPTION 'P03_SOURCE: 原值/指数已进入有效合成或已确认分级样本，不可原位改写或删除' USING ERRCODE='23514';END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_downstream_source_guard() OWNER TO postgres;

--
-- Name: fn_wc_p03_grade(numeric, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_grade(x numeric, samples jsonb) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE n int; mu numeric; sd numeric; lo numeric; hi numeric; code text;
BEGIN
 IF jsonb_typeof(samples) IS DISTINCT FROM 'array' OR jsonb_array_length(samples)<2
  OR EXISTS(SELECT 1 FROM jsonb_array_elements(samples)e WHERE jsonb_typeof(e)<>'number') THEN
  RAISE EXCEPTION 'P03_GRADE: 须两个以上真实同尺度分数，不能单值分级' USING ERRCODE='23514'; END IF;
 SELECT count(*),avg(v),stddev_samp(v),min(v),max(v) INTO n,mu,sd,lo,hi
 FROM (SELECT value::text::numeric v FROM jsonb_array_elements(samples))a;
 IF lo<0 OR hi>1 OR x IS NULL OR x IN('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric)
 OR x<lo OR x>hi OR sd IS NULL OR sd=0 THEN
  RAISE EXCEPTION 'P03_GRADE: 样本无差异、分数越界或不在采用样本范围，禁止补档' USING ERRCODE='23514'; END IF;
 code:=CASE WHEN x>=mu+2*sd THEN 'HIGH' WHEN x>=mu+sd THEN 'MID_HIGH'
 WHEN x>=mu THEN 'MEDIUM' WHEN x>=mu-sd THEN 'MID_LOW' ELSE 'LOW' END;
 RETURN jsonb_build_object('grade_code',code,'sample_count',n,'mu',mu,'sigma',sd,'sigma_denominator','N-1');
END $$;


ALTER FUNCTION public.fn_wc_p03_grade(x numeric, samples jsonb) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_p03_grade(x numeric, samples jsonb); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_p03_grade(x numeric, samples jsonb) IS 'P03附录C五档核验，样本标准差分母N-1；正式保存须绑定实际同尺度样本及批准规则，不提供缺样本默认等级。';


--
-- Name: fn_wc_p03_parameter_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_parameter_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF TG_OP IN('UPDATE','DELETE') AND OLD.indicator_code IN('P14','P15','P33') THEN
  PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
  IF EXISTS(SELECT 1 FROM wc_fire_indicator_value WHERE normalization_param_id=OLD.param_id)
    AND (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) THEN
   RAISE EXCEPTION 'P03_SAMPLE: 已引用参数不可原位改写或删除' USING ERRCODE='23514'; END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 IF NEW.indicator_code IN('P14','P15','P33') AND NEW.approval_status='APPROVED' THEN
  PERFORM fn_wc_p03_sample_validate(NEW);
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_parameter_guard() OWNER TO postgres;

--
-- Name: fn_wc_p03_raw_hash(public.wc_fire_indicator_value); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_raw_hash(v public.wc_fire_indicator_value) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
 SELECT CASE WHEN v.indicator_code IN('P14','P15') THEN md5((md5(jsonb_build_object('task',v.task_id,'unit',v.unit_id,'code',v.indicator_code,'period',v.period_key,
 'raw',v.raw_value,'raw_code',v.raw_code,'unit_name',v.unit,'period_type',v.period_type,
 'start',v.stat_start,'end',v.stat_end,'as_of',v.as_of_date,'quality',v.quality_code,
 'source_record',v.source_record_id,'inputs',v.input_refs->'inputs',
 'method',v.input_refs->>'method_version','source_version',v.input_refs->>'source_version')::text))||
 jsonb_build_object('project_policy',v.input_refs#>>'{p03,project_policy}',
 'resource_ids',v.input_refs#>'{p03,resource_ids}','raw_calculation_ref',v.input_refs#>>'{p03,raw_calculation_ref}',
 'funding_basis',v.input_refs#>>'{p03,funding_basis}','funding_year',v.input_refs#>>'{p03,funding_year}',
 'inventory_as_of_date',v.input_refs#>>'{p03,inventory_as_of_date}')::text)
 ELSE md5(jsonb_build_object('task',v.task_id,'unit',v.unit_id,'code',v.indicator_code,'period',v.period_key,
 'raw',v.raw_value,'raw_code',v.raw_code,'unit_name',v.unit,'period_type',v.period_type,
 'start',v.stat_start,'end',v.stat_end,'as_of',v.as_of_date,'quality',v.quality_code,
 'source_record',v.source_record_id,'inputs',v.input_refs->'inputs',
 'method',v.input_refs->>'method_version','source_version',v.input_refs->>'source_version')::text) END
$$;


ALTER FUNCTION public.fn_wc_p03_raw_hash(v public.wc_fire_indicator_value) OWNER TO postgres;

--
-- Name: fn_wc_p03_rule_source_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_rule_source_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) AND (
  EXISTS(SELECT 1 FROM wc_fire_indicator_value v WHERE v.task_id=OLD.task_id AND v.value_status='VALID' AND
   (v.input_refs#>>'{p03,grade_rule_id}'=OLD.rule_id OR v.input_refs#>>'{p03,configuration_rule_id}'=OLD.rule_id))
  OR EXISTS(SELECT 1 FROM wc_fire_result_layer z WHERE z.task_id=OLD.task_id AND z.output_code='PREVENTION_ZONING' AND z.data_status='VALID'
   AND (z.source_rule_id=OLD.rule_id OR EXISTS(SELECT 1 FROM jsonb_array_elements(z.calculation_refs->'p03_pair_snapshot')e WHERE e->>'risk_rule_id'=OLD.rule_id)))) THEN
  RAISE EXCEPTION 'P03_SOURCE: 已采用的分级/配置规则不可原位变更，应另建版本' USING ERRCODE='23514';END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_rule_source_guard() OWNER TO postgres;

--
-- Name: fn_wc_p03_sample_validate(public.wc_normalization_parameter); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_sample_validate(p public.wc_normalization_parameter) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE s jsonb:=p.source_refs->'sample_set'; e jsonb; v wc_fire_indicator_value%ROWTYPE;
 u wc_fire_spatial_unit%ROWTYPE; typ text; ids text[]; allids text[]; n int:=0; lo numeric; hi numeric; raw_snap jsonb; other wc_normalization_parameter%ROWTYPE; otherids text[]; memberids text[];
BEGIN
 typ:=CASE WHEN p.indicator_code IN('P14','P15','P33') THEN 'TOWNSHIP' END;
 IF typ IS NULL THEN RAISE EXCEPTION 'P03_SAMPLE: 不是三项换算项目'; END IF;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=p.task_id FOR UPDATE;
 IF p.task_id IS NULL OR p.sample_scope IS DISTINCT FROM 'WENCHANG_'||typ
 OR p.formula IS DISTINCT FROM 'X''=(X-Xmin)/(Xmax-Xmin)'
 OR jsonb_typeof(s) IS DISTINCT FROM 'object' OR coalesce(s->>'period_key','')=''
 OR coalesce(s->>'boundary_version','')='' OR coalesce(s->>'source_version','')=''
 OR jsonb_typeof(s->'members') IS DISTINCT FROM 'array' OR jsonb_typeof(s->'excluded') IS DISTINCT FROM 'array' THEN
  RAISE EXCEPTION 'P03_SAMPLE: 必须固定本任务文昌同尺度成员、期间、边界、来源版本和排除清单' USING ERRCODE='23514'; END IF;
 IF s->>'project_policy' IS DISTINCT FROM 'WC_P03_TOWNSHIP_6_7_20261020' THEN
  RAISE EXCEPTION 'P03_SAMPLE: 须明确6+7乡镇项目版本' USING ERRCODE='23514';END IF;
 IF p.indicator_code='P14' AND (s->>'funding_basis' IS DISTINCT FROM 'SINGLE_YEAR'
   OR coalesce(s->>'funding_year','') !~ '^[0-9]{4}$') THEN
  RAISE EXCEPTION 'P03_SAMPLE: P14样本必须固定单年度' USING ERRCODE='23514';END IF;
 IF p.indicator_code='P15' AND coalesce(s->>'inventory_as_of_date','') !~ '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN
  RAISE EXCEPTION 'P03_SAMPLE: P15样本必须固定库存时点' USING ERRCODE='23514';END IF;
 FOR e IN SELECT value FROM jsonb_array_elements(s->'members') LOOP
  SELECT * INTO v FROM wc_fire_indicator_value WHERE task_id=p.task_id AND unit_id=e->>'unit_id'
   AND period_key=s->>'period_key' AND indicator_code=p.indicator_code;
  IF NOT FOUND OR v.raw_value IS NULL OR v.value_status IN('MISSING','REJECTED','SUPERSEDED')
    OR jsonb_typeof(e->'raw_value') IS DISTINCT FROM 'number' OR v.raw_value IS DISTINCT FROM (e->>'raw_value')::numeric
    OR v.unit IS DISTINCT FROM p.input_unit OR v.input_refs->>'method_version' IS DISTINCT FROM p.method_version
    OR fn_wc_p03_raw_hash(v) IS DISTINCT FROM e->>'raw_input_hash' THEN
    RAISE EXCEPTION 'P03_SAMPLE: 样本原值、单位、方法或实际来源不匹配' USING ERRCODE='23514'; END IF;
  SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=p.task_id AND unit_id=v.unit_id;
  IF u.unit_type IS DISTINCT FROM typ OR u.admin_code NOT LIKE '469005%'
    OR fn_wc_local_boundary_hash(u) IS DISTINCT FROM e->>'boundary_hash' THEN
    RAISE EXCEPTION 'P03_SAMPLE: 须本乡镇原值、林地面积和边界，不能复制全市值伪造乡镇样本' USING ERRCODE='23514'; END IF;
  IF p.indicator_code IN('P14','P15') THEN
   raw_snap:=fn_wc_p03_township_inputs_validate(v);
   IF md5(raw_snap::text) IS DISTINCT FROM e->>'raw_source_hash'
    OR (p.indicator_code='P14' AND s->>'funding_year' IS DISTINCT FROM v.input_refs#>>'{p03,funding_year}')
    OR (p.indicator_code='P15' AND s->>'inventory_as_of_date' IS DISTINCT FROM v.input_refs#>>'{p03,inventory_as_of_date}') THEN
    RAISE EXCEPTION 'P03_SAMPLE: 乡镇原始台账或财政年度/库存时点与固定样本不符' USING ERRCODE='23514';END IF;
  END IF;
  n:=n+1;lo:=least(lo,v.raw_value);hi:=greatest(hi,v.raw_value);
 END LOOP;
 IF n<2 OR p.sample_count IS DISTINCT FROM n OR p.min_value IS DISTINCT FROM lo OR p.max_value IS DISTINCT FROM hi OR NOT hi>lo THEN
  RAISE EXCEPTION 'P03_SAMPLE: 乡镇样本不足、极值不符或极差为零，不得补0/1' USING ERRCODE='23514'; END IF;
 FOR e IN SELECT value FROM jsonb_array_elements(s->'excluded') LOOP
  IF jsonb_typeof(e->'unit_id') IS DISTINCT FROM 'string' OR coalesce(e->>'reason','')='' THEN
   RAISE EXCEPTION 'P03_SAMPLE: 排除记录必须说明原因' USING ERRCODE='23514'; END IF;
 END LOOP;
 SELECT array_agg(id ORDER BY id) INTO ids FROM
 (SELECT value->>'unit_id' id FROM jsonb_array_elements((s->'members')||(s->'excluded')))a;
 SELECT array_agg(unit_id ORDER BY unit_id) INTO allids FROM wc_fire_spatial_unit
 WHERE task_id=p.task_id AND unit_type=typ AND admin_code LIKE '469005%';
 IF ids IS DISTINCT FROM allids THEN
  RAISE EXCEPTION 'P03_SAMPLE: 同尺度文昌单元须恰好出现一次，不得重复、遗漏或混入其他地区' USING ERRCODE='23514'; END IF;
 SELECT array_agg(value->>'unit_id' ORDER BY value->>'unit_id') INTO memberids FROM jsonb_array_elements(s->'members');
 FOR other IN SELECT * FROM wc_normalization_parameter q WHERE q.task_id=p.task_id
  AND q.indicator_code IN('P14','P15','P33') AND q.indicator_code<>p.indicator_code
  AND q.approval_status='APPROVED' AND q.source_refs#>>'{sample_set,period_key}'=s->>'period_key' LOOP
  SELECT array_agg(value->>'unit_id' ORDER BY value->>'unit_id') INTO otherids
   FROM jsonb_array_elements(other.source_refs#>'{sample_set,members}');
  IF memberids IS DISTINCT FROM otherids
   OR s->>'boundary_version' IS DISTINCT FROM other.source_refs#>>'{sample_set,boundary_version}' THEN
   RAISE EXCEPTION 'P03_SAMPLE: 同次三项须统一乡镇成员与边界版本，各项极值和参数分别保存' USING ERRCODE='23514';END IF;
 END LOOP;

END $_$;


ALTER FUNCTION public.fn_wc_p03_sample_validate(p public.wc_normalization_parameter) OWNER TO postgres;

--
-- Name: fn_wc_p03_score(text, numeric, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_score(code text, x numeric, area_class text DEFAULT NULL::text) RETURNS numeric
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE b numeric[]; scores numeric[]; i int; base numeric;
BEGIN
 IF x IS NULL OR x IN('NaN'::numeric,'Infinity'::numeric,'-Infinity'::numeric) OR x<0 THEN
  RAISE EXCEPTION 'P03_SCORE: 原值必须是有限非负数' USING ERRCODE='23514'; END IF;
 IF code IN('P11','P12','P13') THEN
  IF x NOT IN(0,1) THEN RAISE EXCEPTION 'P03_SCORE: 有无判断只能0或1' USING ERRCODE='23514';END IF;RETURN x;
 ELSIF code='P31' THEN
  IF x<33.33 THEN RAISE EXCEPTION 'P03_SCORE: 小于33.33的处理原文未明确，待核而非自动满分' USING ERRCODE='23514'; END IF;
  RETURN greatest(0,1-round((x/33.33-1)/0.1,0)*0.1);
 ELSIF code IN('P21','P22','P23') THEN b:=ARRAY[75,85,95,100];scores:=ARRAY[0,0.2,0.5,0.8,1];
 ELSIF code='P41' THEN b:=ARRAY[0.5,1.8,2.5,3.1,18];scores:=ARRAY[0,0.2,0.4,0.6,0.8,1];
 ELSIF code='P42' THEN b:=ARRAY[0.8,2.7,4,4.7,10];scores:=ARRAY[0,0.2,0.4,0.6,0.8,1];
 ELSIF code='P32' THEN
  IF x>100 THEN RAISE EXCEPTION 'P03_SCORE: 有效覆盖率不能超过100%%' USING ERRCODE='23514';END IF;
  IF area_class='KEY' THEN b:=ARRAY[75,85,95];
  ELSIF area_class='NON_KEY' THEN b:=ARRAY[60,75,85];
  ELSE RAISE EXCEPTION 'P03_SCORE: 须明确采用重点或非重点地区依据' USING ERRCODE='23514';END IF;
  scores:=ARRAY[0,0.3,0.6,1];
 ELSE RAISE EXCEPTION 'P03_SCORE: 此项不适用区间评分' USING ERRCODE='23514'; END IF;
 -- User-confirmed project interpretation: lower inclusive, upper exclusive.
 IF x<b[1] THEN RETURN scores[1];END IF;
 IF x>=b[array_length(b,1)] THEN RETURN scores[array_length(scores,1)]; END IF;
 FOR i IN 1..array_length(b,1)-1 LOOP
  IF x>=b[i] AND x<b[i+1] THEN RETURN scores[i+1]; END IF;
 END LOOP;
 RAISE EXCEPTION 'P03_SCORE: 未覆盖取值' USING ERRCODE='23514';
END $$;


ALTER FUNCTION public.fn_wc_p03_score(code text, x numeric, area_class text) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_p03_score(code text, x numeric, area_class text); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_p03_score(code text, x numeric, area_class text) IS 'P03原文明确区间的评分核验；相接端点、P31低于标准等未明确处主动报错，不添加项目解释。';


--
-- Name: fn_wc_p03_source_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_source_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE tid text; id text; relevant boolean;
BEGIN
 IF TG_OP='INSERT' AND TG_TABLE_NAME='wc_fire_spatial_unit' THEN
  PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
  IF NEW.unit_type IN('COUNTY','TOWNSHIP') AND NEW.admin_code LIKE '469005%'
   AND EXISTS(SELECT 1 FROM wc_normalization_parameter p WHERE p.task_id=NEW.task_id AND p.approval_status='APPROVED'
     AND (NEW.unit_type='TOWNSHIP' AND p.indicator_code IN('P14','P15','P33'))) THEN
   RAISE EXCEPTION 'P03_SAMPLE: 已确认样本的文昌单元集合冻结，新增单元须新任务/版本' USING ERRCODE='23514';END IF;
  RETURN NEW;
 END IF;
 tid:=OLD.task_id;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=tid FOR UPDATE;
 IF TG_TABLE_NAME='wc_fire_capacity_resource' THEN
  id:=OLD.capacity_id;
  IF (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) AND (EXISTS(SELECT 1 FROM wc_fire_indicator_value v
   WHERE v.task_id=tid AND v.value_status='VALID' AND v.input_refs#>'{p03,resource_ids}' ? id) OR EXISTS(SELECT 1 FROM wc_fire_indicator_value v JOIN wc_normalization_parameter p
   ON p.task_id=v.task_id AND p.indicator_code=v.indicator_code
   AND p.source_refs#>>'{sample_set,period_key}'=v.period_key
   WHERE v.task_id=tid AND v.indicator_code IN('P14','P15') AND p.approval_status='APPROVED'
    AND v.input_refs#>'{p03,resource_ids}' ? id
    AND EXISTS(SELECT 1 FROM jsonb_array_elements(p.source_refs#>'{sample_set,members}') e WHERE e->>'unit_id'=v.unit_id))) THEN
   RAISE EXCEPTION 'P03_SOURCE: 台账已被有效计算采用，不可原位改写或删除' USING ERRCODE='23514'; END IF;
 ELSIF TG_TABLE_NAME='wc_fire_spatial_unit' THEN
  IF (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) AND EXISTS(SELECT 1 FROM wc_normalization_parameter p
   WHERE p.task_id=tid AND p.indicator_code IN('P14','P15','P33') AND p.approval_status='APPROVED'
    AND EXISTS(SELECT 1 FROM jsonb_array_elements((p.source_refs#>'{sample_set,members}')||(p.source_refs#>'{sample_set,excluded}'))e WHERE e->>'unit_id'=OLD.unit_id)) THEN
   RAISE EXCEPTION 'P03_SAMPLE: 已确认样本的单元、面积、边界及成员集合冻结' USING ERRCODE='23514'; END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_source_guard() OWNER TO postgres;

--
-- Name: fn_wc_p03_township_inputs_validate(public.wc_fire_indicator_value); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_township_inputs_validate(v public.wc_fire_indicator_value) RETURNS jsonb
    LANGUAGE plpgsql
    AS $_$
DECLARE refs jsonb:=v.input_refs->'p03'; u wc_fire_spatial_unit%ROWTYPE;
 r wc_fire_capacity_resource%ROWTYPE; d jsonb; id text; amount numeric:=0; n int:=0;
 source_snap jsonb:='[]'; year_value int; inventory_date date; expected numeric;
BEGIN
 IF v.indicator_code NOT IN('P14','P15') THEN RETURN NULL; END IF;
 SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=v.task_id AND unit_id=v.unit_id;
 IF NOT FOUND OR u.unit_type IS DISTINCT FROM 'TOWNSHIP' OR u.admin_code NOT LIKE '469005%'
  OR u.forest_area_m2 IS NULL OR u.forest_area_m2<=0
  OR u.forest_area_m2::text IN('NaN','Infinity','-Infinity') THEN
  RAISE EXCEPTION 'P03_TOWN_INPUT: 须采用文昌本乡镇及有效林地面积' USING ERRCODE='23514'; END IF;
 IF v.unit IS DISTINCT FROM '万元/hm2' OR v.raw_value IS NULL
  OR v.raw_value::text IN('NaN','Infinity','-Infinity') OR v.raw_value<0
  OR refs->>'project_policy' IS DISTINCT FROM 'WC_P03_TOWNSHIP_6_7_20261020'
  OR coalesce(btrim(refs->>'raw_calculation_ref'),'')=''
  OR jsonb_typeof(refs->'resource_ids') IS DISTINCT FROM 'array'
  OR jsonb_array_length(refs->'resource_ids')=0 THEN
  RAISE EXCEPTION 'P03_TOWN_INPUT: 乡镇原值须单位、6+7项目口径、核算依据及确切台账清单' USING ERRCODE='23514'; END IF;
 IF EXISTS(SELECT 1 FROM jsonb_array_elements(refs->'resource_ids') e WHERE jsonb_typeof(e) IS DISTINCT FROM 'string')
  OR (SELECT count(*)<>count(DISTINCT value) FROM jsonb_array_elements_text(refs->'resource_ids')) THEN
  RAISE EXCEPTION 'P03_TOWN_INPUT: 台账编号须非重复字符串' USING ERRCODE='23514'; END IF;
 IF v.indicator_code='P14' THEN
  IF refs->>'funding_basis' IS DISTINCT FROM 'SINGLE_YEAR'
   OR coalesce(refs->>'funding_year','') !~ '^[0-9]{4}$' THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: P14须指定单年度，不能以五年年均代替' USING ERRCODE='23514'; END IF;
  year_value:=(refs->>'funding_year')::int;
  IF year_value NOT BETWEEN 1900 AND 2200 OR v.period_type IS DISTINCT FROM 'YEAR'
   OR v.stat_start IS DISTINCT FROM make_date(year_value,1,1)
   OR v.stat_end IS DISTINCT FROM make_date(year_value,12,31) THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: P14年度及YEAR起止日期须一致' USING ERRCODE='23514'; END IF;
 ELSE
  IF coalesce(refs->>'inventory_as_of_date','') !~ '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: P15须明确库存时点' USING ERRCODE='23514'; END IF;
  BEGIN inventory_date:=(refs->>'inventory_as_of_date')::date;
  EXCEPTION WHEN invalid_datetime_format OR datetime_field_overflow THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: P15库存日期无效' USING ERRCODE='23514'; END;
  IF v.as_of_date IS DISTINCT FROM inventory_date THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: P15采用时点与记录日期不一致' USING ERRCODE='23514'; END IF;
 END IF;
 FOR id IN SELECT value FROM jsonb_array_elements_text(refs->'resource_ids') ORDER BY value LOOP
  SELECT * INTO r FROM wc_fire_capacity_resource WHERE task_id=v.task_id AND capacity_id=id FOR SHARE;
  IF NOT FOUND OR r.unit_id IS DISTINCT FROM v.unit_id OR r.period_key IS DISTINCT FROM v.period_key
   OR r.record_status IS DISTINCT FROM 'VALID'
   OR r.survey_form_code IS DISTINCT FROM (CASE WHEN v.indicator_code='P14' THEN 'A.1' ELSE 'A.4' END) THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: 台账须同任务、乡镇、期间、有效状态及对应F06表式' USING ERRCODE='23514'; END IF;
  IF v.indicator_code='P14' THEN
   SELECT to_jsonb(x) INTO d FROM wc_fire_capacity_command_detail x
    WHERE task_id=v.task_id AND capacity_id=id AND period_key=v.period_key FOR SHARE;
   IF d IS NULL OR (d->>'annual_funding_year')::int IS DISTINCT FROM year_value
    OR d->>'annual_funding_wan' IS NULL OR coalesce(btrim(d->>'annual_funding_ref'),'')='' THEN
    RAISE EXCEPTION 'P03_TOWN_INPUT: P14须来源明细的同年度经费总额及依据' USING ERRCODE='23514'; END IF;
   amount:=amount+(d->>'annual_funding_wan')::numeric;
  ELSE
   SELECT to_jsonb(x) INTO d FROM wc_fire_capacity_warehouse_detail x
    WHERE task_id=v.task_id AND capacity_id=id AND period_key=v.period_key FOR SHARE;
   IF d IS NULL OR (d->>'as_of_date')::date IS DISTINCT FROM inventory_date
    OR d->>'stock_value_wan' IS NULL OR coalesce(btrim(d->>'stock_value_ref'),'')='' THEN
    RAISE EXCEPTION 'P03_TOWN_INPUT: P15须同库存时点的库总金额及依据，不重复加物资明细' USING ERRCODE='23514'; END IF;
   amount:=amount+(d->>'stock_value_wan')::numeric;
  END IF;
  IF amount<0 OR amount::text IN('NaN','Infinity','-Infinity') THEN
   RAISE EXCEPTION 'P03_TOWN_INPUT: 采用金额须有限非负数' USING ERRCODE='23514'; END IF;
  source_snap:=source_snap||jsonb_build_array(jsonb_build_object('capacity_id',id,
   'source_hash',md5(jsonb_build_object('header',to_jsonb(r),'detail',d)::text)));
  n:=n+1;
 END LOOP;
 expected:=round(amount/(u.forest_area_m2/10000),8);
 IF v.raw_value IS DISTINCT FROM expected THEN
  RAISE EXCEPTION 'P03_TOWN_INPUT: 原值不等于采用金额除以本乡镇林地公顷' USING ERRCODE='23514'; END IF;
 RETURN jsonb_build_object('policy_code','WC_P03_TOWNSHIP_6_7_20261020','unit_id',v.unit_id,
  'period_key',v.period_key,'indicator_code',v.indicator_code,'funding_year',year_value,
  'inventory_as_of_date',inventory_date,'amount_wan',amount,'forest_area_ha',u.forest_area_m2/10000,
  'raw_value',expected,'source_count',n,'source_snapshots',source_snap);
END $_$;


ALTER FUNCTION public.fn_wc_p03_township_inputs_validate(v public.wc_fire_indicator_value) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_p03_township_inputs_validate(v public.wc_fire_indicator_value); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_p03_township_inputs_validate(v public.wc_fire_indicator_value) IS '文昌项目P14单年度乡镇经费、P15乡镇库存时点金额及林地分母核验；不生成台账或分配共用物资';


--
-- Name: fn_wc_p03_value_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_value_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE p wc_normalization_parameter%ROWTYPE; m jsonb; u wc_fire_spatial_unit%ROWTYPE; native text;
 c text; src wc_fire_indicator_value%ROWTYPE; r wc_fire_capacity_resource%ROWTYPE;
 s jsonb:='{}'; snap jsonb:='[]'; expected numeric; refs jsonb; id text;
 arr jsonb:='[]'; g jsonb; adopted_rule wc_fire_rule_definition%ROWTYPE; member jsonb;
 child wc_fire_spatial_unit%ROWTYPE; numerator numeric:=0; denominator numeric:=0; childids text[]; actualids text[];
BEGIN
 IF TG_OP IN('UPDATE','DELETE') AND OLD.indicator_code IN('P14','P15','P33') THEN
  PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=OLD.task_id FOR UPDATE;
  IF EXISTS(SELECT 1 FROM wc_normalization_parameter q WHERE q.task_id=OLD.task_id AND q.indicator_code=OLD.indicator_code
   AND q.approval_status='APPROVED' AND q.source_refs#>>'{sample_set,period_key}'=OLD.period_key
   AND EXISTS(SELECT 1 FROM jsonb_array_elements(q.source_refs#>'{sample_set,members}')e WHERE e->>'unit_id'=OLD.unit_id)) THEN
   IF TG_OP='DELETE' OR fn_wc_p03_raw_hash(NEW) IS DISTINCT FROM fn_wc_p03_raw_hash(OLD)
    OR NEW.value_status IN('MISSING','REJECTED','SUPERSEDED') THEN
    RAISE EXCEPTION 'P03_SAMPLE: 已确认样本原值与来源不可覆盖、作废或删除' USING ERRCODE='23514'; END IF;
  END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD; END IF;
 IF NEW.indicator_code NOT IN('P11','P12','P13','P14','P15','P21','P22','P23','P31','P32','P33','P41','P42','DISASTER_REDUCTION_CAPACITY','DISASTER_REDUCTION_CAPACITY_GRADE') THEN RETURN NEW; END IF;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
 SELECT * INTO u FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.unit_id;
 IF NEW.indicator_code IN('P14','P15') AND NEW.raw_value IS NOT NULL
  AND NEW.value_status NOT IN('MISSING','REJECTED','SUPERSEDED') THEN
  NEW.input_refs:=jsonb_set(NEW.input_refs,'{p03_township_input_snapshot}',fn_wc_p03_township_inputs_validate(NEW),true);
 END IF;
 IF NEW.indicator_code IN('P14','P15','P33') AND (NEW.normalized_value IS NOT NULL OR NEW.normalization_param_id IS NOT NULL) THEN
  SELECT * INTO p FROM wc_normalization_parameter WHERE param_id=NEW.normalization_param_id;
  IF NOT FOUND OR p.task_id IS DISTINCT FROM NEW.task_id OR p.indicator_code IS DISTINCT FROM NEW.indicator_code OR p.approval_status<>'APPROVED' THEN
   RAISE EXCEPTION 'P03_SAMPLE: 必须绑定本任务本项已确认参数' USING ERRCODE='23514'; END IF;
  PERFORM fn_wc_p03_sample_validate(p);
  SELECT value INTO m FROM jsonb_array_elements(p.source_refs#>'{sample_set,members}') WHERE value->>'unit_id'=NEW.unit_id;
  IF m IS NULL OR p.source_refs#>>'{sample_set,period_key}' IS DISTINCT FROM NEW.period_key
   OR fn_wc_p03_raw_hash(NEW) IS DISTINCT FROM m->>'raw_input_hash'
   OR NEW.unit IS DISTINCT FROM p.input_unit OR NEW.normalized_value IS DISTINCT FROM round((NEW.raw_value-p.min_value)/(p.max_value-p.min_value),8) THEN
   RAISE EXCEPTION 'P03_SAMPLE: 取值、期间、单位、来源或换算结果与固定样本不符' USING ERRCODE='23514'; END IF;
  IF EXISTS(SELECT 1 FROM wc_fire_indicator_value v WHERE v.task_id=NEW.task_id AND v.indicator_code=NEW.indicator_code
   AND v.period_key=NEW.period_key AND v.unit_id<>NEW.unit_id AND v.normalization_param_id IS NOT NULL
   AND v.value_status NOT IN('MISSING','REJECTED','SUPERSEDED') AND v.normalization_param_id<>NEW.normalization_param_id) THEN
   RAISE EXCEPTION 'P03_SAMPLE: 同次同项须统一参数编号' USING ERRCODE='23514'; END IF;
 END IF;
 IF NEW.value_status<>'VALID' THEN RETURN NEW; END IF;
 refs:=NEW.input_refs->'p03';
 IF jsonb_typeof(refs) IS DISTINCT FROM 'object' THEN RAISE EXCEPTION 'P03_CHAIN: 缺明确的P03采用关系' USING ERRCODE='23514';END IF;
 IF NEW.indicator_code IN('P11','P12','P13','P14','P15','P21','P22','P23','P31','P32','P33','P41','P42') THEN
  native:=CASE WHEN NEW.indicator_code IN('P11','P12','P13','P21','P22','P23') THEN 'COUNTY' ELSE 'TOWNSHIP' END;
  IF u.unit_type IS DISTINCT FROM native THEN RAISE EXCEPTION 'P03_CHAIN: 项目取数尺度不匹配；县级6项、乡镇7项分别保存，P14/P15必须取本乡镇' USING ERRCODE='23514';END IF;
  IF NEW.unit IS DISTINCT FROM (SELECT default_unit FROM wc_fire_indicator_definition WHERE indicator_code=NEW.indicator_code)
   OR coalesce(refs->>'raw_calculation_ref','')='' OR jsonb_typeof(refs->'resource_ids') IS DISTINCT FROM 'array'
   OR jsonb_array_length(refs->'resource_ids')=0 THEN
   RAISE EXCEPTION 'P03_CHAIN: 原值单位、核算依据和确切台账编号必须完整' USING ERRCODE='23514'; END IF;
  IF (SELECT count(*)<>count(DISTINCT value) FROM jsonb_array_elements(refs->'resource_ids')) THEN
   RAISE EXCEPTION 'P03_CHAIN: 台账编号重复' USING ERRCODE='23514'; END IF;
  FOR id IN SELECT value FROM jsonb_array_elements_text(refs->'resource_ids') LOOP
   SELECT * INTO r FROM wc_fire_capacity_resource WHERE task_id=NEW.task_id AND capacity_id=id FOR SHARE;
   IF NOT FOUND OR r.unit_id IS DISTINCT FROM NEW.unit_id OR r.record_status<>'VALID'
    OR (CASE WHEN r.survey_form_code IS NOT NULL THEN r.period_key ELSE r.resource_attributes#>>'{p03,period_key}' END) IS DISTINCT FROM NEW.period_key THEN
    RAISE EXCEPTION 'P03_CHAIN: 台账任务、单元、期间或状态不匹配' USING ERRCODE='23514';END IF;
   snap:=snap||jsonb_build_array(jsonb_build_object('capacity_id',id,'snapshot',md5(to_jsonb(r)::text)));
  END LOOP;
  IF NEW.indicator_code IN('P22','P23') AND coalesce(refs->>'team_count','')<>'1' THEN
   RAISE EXCEPTION 'P03_CHAIN: 多队伍原文措辞待核，不能擅自确定汇总算法' USING ERRCODE='23514';END IF;
  IF NEW.indicator_code IN('P21','P22','P23') AND NOT EXISTS(SELECT 1 FROM wc_fire_rule_definition q WHERE q.task_id=NEW.task_id
   AND q.rule_id=refs->>'configuration_rule_id' AND q.approval_status='APPROVED'
   AND q.parameter_json->>'record_purpose'='P03_ADOPTED_CONFIGURATION_TARGETS') THEN
   RAISE EXCEPTION 'P03_CHAIN: 必须引用本任务已确认的实际适用配置目标；不能仅凭目录推测应配数' USING ERRCODE='23514';END IF;
  IF NEW.indicator_code IN('P14','P15','P33') THEN
   IF NEW.normalization_param_id IS NULL OR NEW.normalized_value IS NULL THEN RAISE EXCEPTION 'P03_CHAIN: 三项须完成各自换算' USING ERRCODE='23514';END IF;
   IF NEW.assigned_score IS NOT NULL AND NEW.assigned_score IS DISTINCT FROM NEW.normalized_value THEN RAISE EXCEPTION 'P03_CHAIN: 不重复评分' USING ERRCODE='23514';END IF;
  ELSE
   IF NEW.normalized_value IS NOT NULL THEN RAISE EXCEPTION 'P03_CHAIN: 本项按评分处理，不重复极值换算' USING ERRCODE='23514';END IF;
   IF NEW.indicator_code='P32' AND coalesce(refs->>'area_class_ref','')='' THEN RAISE EXCEPTION 'P03_CHAIN: 地区类别须依据' USING ERRCODE='23514';END IF;
   expected:=fn_wc_p03_score(NEW.indicator_code,NEW.raw_value,refs->>'area_class');
   IF NEW.assigned_score IS DISTINCT FROM expected THEN RAISE EXCEPTION 'P03_CHAIN: 分数不符合原文或遇未确认端点' USING ERRCODE='23514';END IF;
  END IF;
  NEW.input_refs:=jsonb_set(NEW.input_refs,'{p03_resource_snapshot}',snap,true);
 ELSIF NEW.indicator_code='DISASTER_REDUCTION_CAPACITY' THEN
  IF u.unit_type='TOWNSHIP' AND refs->>'method'='P03_13_TERM_SUM' THEN
   IF refs->>'county_unit_id' IS NULL OR refs->>'county_unit_id' IS DISTINCT FROM u.parent_unit_id
    OR refs->>'county_shared_policy' IS DISTINCT FROM 'WC_P03_TOWNSHIP_6_7_20261020'
    OR NOT EXISTS(SELECT 1 FROM wc_fire_spatial_unit county WHERE county.task_id=NEW.task_id
      AND county.unit_id=refs->>'county_unit_id' AND county.unit_type='COUNTY') THEN
    RAISE EXCEPTION 'P03_COUNTY_SHARED: 须明确引用本乡镇所属县、同任务的县级单元及已确认共用口径' USING ERRCODE='23514';END IF;
   IF (SELECT processing_contract_json->>'county_to_township' FROM wc_fire_indicator_definition
     WHERE indicator_code='DISASTER_REDUCTION_CAPACITY') IS DISTINCT FROM 'USER_CONFIRMED_SHARED_COUNTY_SCORES' THEN
    RAISE EXCEPTION 'P03_COUNTY_SHARED: 县级共用口径尚未确认' USING ERRCODE='23514';END IF;
   FOREACH c IN ARRAY ARRAY['P11','P12','P13','P14','P15','P21','P22','P23','P31','P32','P33','P41','P42'] LOOP
    SELECT * INTO src FROM wc_fire_indicator_value WHERE task_id=NEW.task_id
     AND unit_id=CASE WHEN c IN('P11','P12','P13','P21','P22','P23') THEN refs->>'county_unit_id' ELSE NEW.unit_id END
     AND period_key=NEW.period_key AND indicator_code=c FOR SHARE;
    IF NOT FOUND OR src.value_status IS DISTINCT FROM 'VALID' THEN
     RAISE EXCEPTION 'P03_COUNTY_SHARED: 缺少本县6项或本乡镇7项的同任务同期间有效分数：%',c USING ERRCODE='23514';END IF;
    IF c='P14' AND (coalesce(refs->>'funding_year','')=''
      OR refs->>'funding_year' IS DISTINCT FROM src.input_refs#>>'{p03,funding_year}') THEN
     RAISE EXCEPTION 'P03_TOTAL: 合成所采用财政年度须与本乡镇P14一致' USING ERRCODE='23514';END IF;
    IF c='P15' AND (coalesce(refs->>'inventory_as_of_date','')=''
      OR refs->>'inventory_as_of_date' IS DISTINCT FROM src.input_refs#>>'{p03,inventory_as_of_date}') THEN
     RAISE EXCEPTION 'P03_TOTAL: 合成所采用库存时点须与本乡镇P15一致' USING ERRCODE='23514';END IF;
    s:=s||jsonb_build_object(c,CASE WHEN c IN('P14','P15','P33') THEN src.normalized_value ELSE src.assigned_score END);
    snap:=snap||jsonb_build_array(jsonb_build_object('unit_id',src.unit_id,'indicator_code',c,'period_key',src.period_key,
     'source_scope',CASE WHEN c IN('P11','P12','P13','P21','P22','P23') THEN 'COUNTY_SHARED' ELSE 'TOWNSHIP_LOCAL' END,
     'normalization_param_id',src.normalization_param_id,'score_rule_id',src.score_rule_id,'snapshot',md5(to_jsonb(src)::text)));
   END LOOP;
   NEW.input_refs:=jsonb_set(NEW.input_refs,'{p03_county_shared_snapshot}',jsonb_build_object(
    'policy_code','WC_P03_TOWNSHIP_6_7_20261020','evidence_status','USER_CONFIRMED_PROJECT_INTERPRETATION',
    'confirmed_on','2026-10-20','task_id',NEW.task_id,'period_key',NEW.period_key,
    'county_unit_id',refs->>'county_unit_id','town_unit_id',NEW.unit_id,'parent_unit_id',u.parent_unit_id,
    'county_components',jsonb_build_array('P11','P12','P13','P21','P22','P23'),
    'township_components',jsonb_build_array('P14','P15','P31','P32','P33','P41','P42'),
    'funding_year',refs->>'funding_year','inventory_as_of_date',refs->>'inventory_as_of_date'),true);
   expected:=fn_wc_p03_weighted_score(s);
  ELSIF u.unit_type='COUNTY' AND refs->>'method'='P03_COUNTY_FOREST_WEIGHTED' THEN
   IF jsonb_typeof(refs->'child_unit_ids') IS DISTINCT FROM 'array' THEN RAISE EXCEPTION 'P03_TOTAL: 县级须辖区乡镇清单' USING ERRCODE='23514';END IF;
   SELECT array_agg(value ORDER BY value) INTO childids FROM jsonb_array_elements_text(refs->'child_unit_ids');
   SELECT array_agg(unit_id ORDER BY unit_id) INTO actualids FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND parent_unit_id=NEW.unit_id AND unit_type='TOWNSHIP';
   IF childids IS NULL OR childids IS DISTINCT FROM actualids THEN RAISE EXCEPTION 'P03_TOTAL: 辖区乡镇须完整且仅出现一次' USING ERRCODE='23514';END IF;
   FOREACH id IN ARRAY childids LOOP
    SELECT * INTO child FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=id FOR SHARE;
    SELECT * INTO src FROM wc_fire_indicator_value WHERE task_id=NEW.task_id AND unit_id=id AND period_key=NEW.period_key AND indicator_code='DISASTER_REDUCTION_CAPACITY' FOR SHARE;
    IF NOT FOUND OR src.value_status<>'VALID' OR src.raw_value IS NULL OR child.forest_area_m2 IS NULL OR child.forest_area_m2<=0 THEN RAISE EXCEPTION 'P03_TOTAL: 乡镇有效指数与林地面积须完整' USING ERRCODE='23514';END IF;
    numerator:=numerator+src.raw_value*child.forest_area_m2;denominator:=denominator+child.forest_area_m2;
    snap:=snap||jsonb_build_array(jsonb_build_object('unit_id',id,'indicator_code',src.indicator_code,'period_key',src.period_key,'snapshot',md5(to_jsonb(src)::text),'boundary_hash',fn_wc_local_boundary_hash(child)));
   END LOOP;
   expected:=round(numerator/denominator,8);
  ELSE RAISE EXCEPTION 'P03_TOTAL: 乡镇13项合成与县级林地面积加权必须分别标明' USING ERRCODE='23514';END IF;
  IF NEW.raw_value IS DISTINCT FROM expected THEN RAISE EXCEPTION 'P03_TOTAL: 总分与13项全局权重之和不符' USING ERRCODE='23514';END IF;
  NEW.input_refs:=jsonb_set(NEW.input_refs,'{p03_component_snapshot}',snap,true);
 ELSE
  -- Exact identity and native five-level code are shared by official adoption and calculated grades.
  IF NEW.raw_code NOT IN('HIGH','MID_HIGH','MEDIUM','MID_LOW','LOW') OR NEW.raw_code IS NULL THEN RAISE EXCEPTION 'P03_GRADE: 只能使用专用五档项目代码' USING ERRCODE='23514';END IF;
  IF refs->>'method'='OFFICIAL_GRADE_ADOPTION' THEN
   IF jsonb_typeof(NEW.input_refs->'direct_adoption') IS DISTINCT FROM 'object' OR coalesce(refs->>'grade_mapping_ref','')=''
    OR NOT EXISTS(SELECT 1 FROM wc_fire_rule_definition a WHERE a.task_id=NEW.task_id AND a.rule_id=refs->>'grade_rule_id' AND a.approval_status='APPROVED' AND a.parameter_json->>'record_purpose'='P03_OFFICIAL_GRADE_ADOPTION') THEN
    RAISE EXCEPTION 'P03_GRADE: 正式共享等级须直接采用依据及已确认的五档代码对应规则' USING ERRCODE='23514';END IF;
  ELSIF refs->>'method'='P03_SIGMA_GRADE' THEN
   SELECT * INTO adopted_rule FROM wc_fire_rule_definition WHERE task_id=NEW.task_id AND rule_id=refs->>'grade_rule_id' FOR SHARE;
   IF NOT FOUND OR adopted_rule.approval_status<>'APPROVED' OR adopted_rule.parameter_json->>'record_purpose' IS DISTINCT FROM 'P03_GRADE_SAMPLE'
    OR adopted_rule.parameter_json#>>'{sample_set,period_key}' IS DISTINCT FROM NEW.period_key
    OR adopted_rule.parameter_json#>>'{sample_set,unit_type}' IS DISTINCT FROM u.unit_type
    OR jsonb_typeof(adopted_rule.parameter_json#>'{sample_set,members}') IS DISTINCT FROM 'array' THEN
    RAISE EXCEPTION 'P03_GRADE: 缺同任务同期间同尺度已确认分级样本规则' USING ERRCODE='23514';END IF;
   SELECT array_agg(value->>'unit_id' ORDER BY value->>'unit_id') INTO childids FROM jsonb_array_elements(adopted_rule.parameter_json#>'{sample_set,members}');
   IF childids IS NULL OR cardinality(childids)<>(SELECT count(DISTINCT x) FROM unnest(childids)x) OR NOT NEW.unit_id=ANY(childids) THEN RAISE EXCEPTION 'P03_GRADE: 分级样本重复或不含目标单元' USING ERRCODE='23514';END IF;
   FOR member IN SELECT value FROM jsonb_array_elements(adopted_rule.parameter_json#>'{sample_set,members}') LOOP
    SELECT * INTO src FROM wc_fire_indicator_value WHERE task_id=NEW.task_id AND unit_id=member->>'unit_id' AND period_key=NEW.period_key AND indicator_code='DISASTER_REDUCTION_CAPACITY' FOR SHARE;
    SELECT * INTO child FROM wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=member->>'unit_id';
    IF src.value_status IS DISTINCT FROM 'VALID' OR src.raw_value IS NULL OR child.unit_type IS DISTINCT FROM u.unit_type
     OR md5(to_jsonb(src)::text) IS DISTINCT FROM member->>'index_snapshot' OR fn_wc_local_boundary_hash(child) IS DISTINCT FROM member->>'boundary_hash' THEN RAISE EXCEPTION 'P03_GRADE: 样本指数身份、版本、边界或实际值不符' USING ERRCODE='23514';END IF;
    arr:=arr||to_jsonb(src.raw_value);
    IF src.unit_id=NEW.unit_id THEN expected:=src.raw_value;END IF;
   END LOOP;
   g:=fn_wc_p03_grade(expected,arr);
   IF NEW.raw_code IS DISTINCT FROM g->>'grade_code' THEN RAISE EXCEPTION 'P03_GRADE: 等级与实际分级样本不符' USING ERRCODE='23514';END IF;
   NEW.input_refs:=jsonb_set(NEW.input_refs,'{p03_grade_snapshot}',jsonb_build_object('rule_id',adopted_rule.rule_id,'rule_version',adopted_rule.rule_version,'rule_snapshot',md5(to_jsonb(adopted_rule)::text),'index_value',expected,'statistics',g),true);
  ELSE RAISE EXCEPTION 'P03_GRADE: 须明确按P03实际样本计算或采用正式共享等级' USING ERRCODE='23514';END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p03_value_guard() OWNER TO postgres;

--
-- Name: fn_wc_p03_weighted_score(jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p03_weighted_score(s jsonb) RETURNS numeric
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE weights jsonb:='{"P11":0.08,"P12":0.05,"P13":0.05,"P14":0.08,"P15":0.05,"P21":0.10,"P22":0.08,"P23":0.08,"P31":0.07,"P32":0.09,"P33":0.08,"P41":0.10,"P42":0.09}';
 k text; x numeric; total numeric:=0;
BEGIN
 IF jsonb_typeof(s) IS DISTINCT FROM 'object' OR (SELECT count(*) FROM jsonb_object_keys(s))<>13
 OR EXISTS(SELECT 1 FROM jsonb_object_keys(s)a WHERE NOT weights?a) THEN
  RAISE EXCEPTION 'P03_TOTAL: 必须完整且仅有13项分数' USING ERRCODE='23514'; END IF;
 FOR k IN SELECT jsonb_object_keys(weights) LOOP
  IF jsonb_typeof(s->k) IS DISTINCT FROM 'number' THEN RAISE EXCEPTION 'P03_TOTAL: 分数须数值' USING ERRCODE='23514'; END IF;
  x:=(s->>k)::numeric;
  IF x<0 OR x>1 THEN RAISE EXCEPTION 'P03_TOTAL: 分数应在0至1之间' USING ERRCODE='23514'; END IF;
  total:=total+x*(weights->>k)::numeric;
 END LOOP;
 RETURN round(total,8);
END $$;


ALTER FUNCTION public.fn_wc_p03_weighted_score(s jsonb) OWNER TO postgres;

--
-- Name: FUNCTION fn_wc_p03_weighted_score(s jsonb); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.fn_wc_p03_weighted_score(s jsonb) IS 'P03第8.1式1，13项全局权重直接求和；不是原始台账自动汇总程序。';


--
-- Name: fn_wc_p05_capacity_source_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p05_capacity_source_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF OLD.indicator_code='DISASTER_REDUCTION_CAPACITY_GRADE' AND (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD)
  AND EXISTS(SELECT 1 FROM wc_fire_result_layer z WHERE z.task_id=OLD.task_id AND z.period_key=OLD.period_key
   AND z.output_code='PREVENTION_ZONING' AND z.data_status='VALID'
   AND EXISTS(SELECT 1 FROM jsonb_array_elements(z.calculation_refs#>'{zoning,input_pairs}')p WHERE p->>'member_unit_id'=OLD.unit_id)) THEN
  RAISE EXCEPTION 'P05_PAIR: 能力等级已被正式分区采用，不可原位改写或删除' USING ERRCODE='23514';END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p05_capacity_source_guard() OWNER TO postgres;

--
-- Name: fn_wc_p05_investment(numeric, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p05_investment(r numeric, capacity_code text) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE i int; j int; matrix int[][]:=ARRAY[[1,1,2,3,3],[1,2,2,3,3],[2,2,3,4,4],[3,3,4,4,4],[3,3,4,4,4]];
BEGIN
 i:=CASE WHEN r=1 THEN 1 WHEN r>1 AND r<=1.5 THEN 2 WHEN r>1.5 AND r<=2 THEN 3 WHEN r>2 AND r<=3 THEN 4 WHEN r>3 AND r<=4 THEN 5 END;
 j:=CASE capacity_code WHEN 'LOW' THEN 1 WHEN 'MID_LOW' THEN 2 WHEN 'MEDIUM' THEN 3 WHEN 'MID_HIGH' THEN 4 WHEN 'HIGH' THEN 5 END;
 IF i IS NULL OR j IS NULL THEN RAISE EXCEPTION 'P05_PAIR: 风险须P04综合风险R，能力须专用五档代码' USING ERRCODE='23514';END IF;
 RETURN matrix[i][j];
END $$;


ALTER FUNCTION public.fn_wc_p05_investment(r numeric, capacity_code text) OWNER TO postgres;

--
-- Name: fn_wc_p05_pair_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_p05_pair_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE z jsonb; e jsonb; pairs jsonb; member text; risk wc_fire_result_layer%ROWTYPE; cap wc_fire_indicator_value%ROWTYPE;
 risk_rule wc_fire_rule_definition%ROWTYPE;
 rowno int; colno int; expected int; snap jsonb:='[]'; matrix int[][]:=ARRAY[[1,1,2,3,3],[1,2,2,3,3],[2,2,3,4,4],[3,3,4,4,4],[3,3,4,4,4]];
BEGIN
 IF TG_OP IN('UPDATE','DELETE') AND (TG_OP='DELETE' OR NEW IS DISTINCT FROM OLD) THEN
  IF EXISTS(SELECT 1 FROM wc_fire_result_layer v WHERE v.task_id=OLD.task_id AND v.output_code='PREVENTION_ZONING'
    AND v.data_status='VALID' AND EXISTS(SELECT 1 FROM jsonb_array_elements(v.calculation_refs#>'{zoning,input_pairs}')a WHERE a->>'risk_result_id'=OLD.result_id)) THEN
   RAISE EXCEPTION 'P05_PAIR: 综合风险等级已被正式分区引用，不可原位改写或删除' USING ERRCODE='23514'; END IF;
 END IF;
 IF TG_OP='DELETE' THEN RETURN OLD;END IF;
 IF NEW.output_code<>'PREVENTION_ZONING' OR NEW.data_status<>'VALID' OR NEW.zoning_level IS DISTINCT FROM 2 THEN RETURN NEW;END IF;
 PERFORM 1 FROM wc_fire_assessment_task WHERE task_id=NEW.task_id FOR UPDATE;
 z:=NEW.calculation_refs->'zoning';pairs:=z->'input_pairs';
 IF jsonb_typeof(pairs) IS DISTINCT FROM 'array' OR jsonb_array_length(pairs)<>jsonb_array_length(z->'member_unit_ids') THEN
  RAISE EXCEPTION 'P05_PAIR: 二级区每个成员须一对综合风险等级与能力等级' USING ERRCODE='23514';END IF;
 FOR member IN SELECT value FROM jsonb_array_elements_text(z->'member_unit_ids') LOOP
  IF (SELECT count(*) FROM jsonb_array_elements(pairs)a WHERE a->>'member_unit_id'=member)<>1 THEN RAISE EXCEPTION 'P05_PAIR: 成员配对遗漏或重复' USING ERRCODE='23514';END IF;
  SELECT value INTO e FROM jsonb_array_elements(pairs)a WHERE a->>'member_unit_id'=member;
  IF e->>'capacity_indicator_code' IS DISTINCT FROM 'DISASTER_REDUCTION_CAPACITY_GRADE' THEN RAISE EXCEPTION 'P05_PAIR: 能力输入须五档能力等级，不接受能力分数或其他性质等级' USING ERRCODE='23514';END IF;
  SELECT * INTO risk FROM wc_fire_result_layer WHERE task_id=NEW.task_id AND result_id=e->>'risk_result_id' FOR SHARE;
  IF NOT FOUND OR risk.output_code<>'COMPREHENSIVE_RISK_GRADE' OR risk.unit_id IS DISTINCT FROM member
   OR risk.period_key IS DISTINCT FROM NEW.period_key OR risk.data_status<>'VALID' OR risk.source_rule_id IS NULL
   OR risk.source_batch IS NULL OR NOT EXISTS(SELECT 1 FROM wc_fire_rule_definition q WHERE q.task_id=risk.task_id AND q.rule_id=risk.source_rule_id AND q.approval_status='APPROVED') THEN
   RAISE EXCEPTION 'P05_PAIR: 综合风险来源类型、任务、单元、期间、状态、规则或批次不符' USING ERRCODE='23514';END IF;
  SELECT * INTO cap FROM wc_fire_indicator_value WHERE task_id=NEW.task_id AND unit_id=member AND period_key=NEW.period_key
   AND indicator_code='DISASTER_REDUCTION_CAPACITY_GRADE' FOR SHARE;
  IF NOT FOUND OR cap.value_status<>'VALID' THEN RAISE EXCEPTION 'P05_PAIR: 缺少同任务同成员同期间的有效能力等级' USING ERRCODE='23514';END IF;
  rowno:=CASE WHEN risk.index_value=1 THEN 1 WHEN risk.index_value>1 AND risk.index_value<=1.5 THEN 2
   WHEN risk.index_value>1.5 AND risk.index_value<=2 THEN 3 WHEN risk.index_value>2 AND risk.index_value<=3 THEN 4
   WHEN risk.index_value>3 AND risk.index_value<=4 THEN 5 ELSE NULL END;
  SELECT * INTO risk_rule FROM wc_fire_rule_definition WHERE task_id=risk.task_id AND rule_id=risk.source_rule_id FOR SHARE;
  colno:=CASE cap.raw_code WHEN 'LOW' THEN 1 WHEN 'MID_LOW' THEN 2 WHEN 'MEDIUM' THEN 3 WHEN 'MID_HIGH' THEN 4 WHEN 'HIGH' THEN 5 END;
  IF rowno IS NULL OR colno IS NULL THEN RAISE EXCEPTION 'P05_PAIR: 综合风险或能力五档含义无法按采用规则确认' USING ERRCODE='23514';END IF;
  expected:=fn_wc_p05_investment(risk.index_value,cap.raw_code);
  IF NEW.investment_level IS DISTINCT FROM expected THEN RAISE EXCEPTION 'P05_PAIR: 投入类别不符合P05表1，须拆分不同类别的成员' USING ERRCODE='23514';END IF;
  snap:=snap||jsonb_build_array(jsonb_build_object('member_unit_id',member,'risk_result_id',risk.result_id,
   'risk_snapshot',md5(to_jsonb(risk)::text),'risk_rule_id',risk.source_rule_id,'risk_rule_version',risk_rule.rule_version,
   'risk_rule_snapshot',md5(to_jsonb(risk_rule)::text),'risk_batch',risk.source_batch,
   'capacity_indicator_code',cap.indicator_code,'capacity_period',cap.period_key,'capacity_snapshot',md5(to_jsonb(cap)::text),
   'capacity_grade_code',cap.raw_code,'investment_level',expected));
 END LOOP;
 NEW.calculation_refs:=jsonb_set(NEW.calculation_refs,'{p03_pair_snapshot}',snap,true);
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_p05_pair_guard() OWNER TO postgres;

--
-- Name: fn_wc_special_population_density(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_special_population_density(population_id bigint) RETURNS numeric
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE p public.wc_special_population%ROWTYPE;b public.wc_fire_task_source%ROWTYPE;n bigint;
BEGIN
 SELECT * INTO p FROM public.wc_special_population WHERE pop_id=population_id;
 IF NOT FOUND THEN RAISE EXCEPTION '人口统计记录不存在' USING ERRCODE='23503';END IF;
 SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=p.task_id AND source_code=p.source_code AND source_batch=p.source_batch;
 IF p.data_status<>'VALID' OR NOT FOUND OR b.quality_status<>'PASSED'
  OR NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=p.quality_code AND status='ACTIVE')
  OR b.metadata_json->>'population_scope' IS DISTINCT FROM 'FOREST_AREA'
  OR b.metadata_json->>'coverage_status' IS DISTINCT FROM 'COMPLETE'
  OR coalesce(b.metadata_json->>'forest_area_version','') !~ '[^[:space:]]'
  OR b.metadata_json->>'p01_definition_confirmed' IS DISTINCT FROM 'true'
  OR coalesce(b.metadata_json->>'p01_definition_ref','') !~ '[^[:space:]]' THEN
  RAISE EXCEPTION '人口合计尚无P01定义对应证据或来源质量已变化' USING ERRCODE='23514';END IF;
 IF p.forest_area_ha IS NULL OR p.forest_area_ha<=0 THEN RAISE EXCEPTION '人口密度须正数林地面积，不补零' USING ERRCODE='23514';END IF;
 IF b.metadata_json->>'population_count_form'='TOTAL_ONLY' AND p.special_population_total IS NOT NULL AND num_nonnulls(p.no_civil_capacity,p.limited_civil_capacity)=0 THEN n:=p.special_population_total;
 ELSIF b.metadata_json->>'population_count_form'='SPLIT_ONLY' AND p.special_population_total IS NULL AND num_nonnulls(p.no_civil_capacity,p.limited_civil_capacity)=2 THEN n:=p.no_civil_capacity::bigint+p.limited_civil_capacity::bigint;
 ELSIF b.metadata_json->>'population_count_form'='TOTAL_AND_SPLIT' AND b.metadata_json->>'total_split_same_definition'='true' AND num_nonnulls(p.special_population_total,p.no_civil_capacity,p.limited_civil_capacity)=3 AND p.special_population_total::bigint=p.no_civil_capacity::bigint+p.limited_civil_capacity::bigint THEN n:=p.special_population_total;
 ELSE RAISE EXCEPTION '当前统计形式/定义不完整，不能计算密度' USING ERRCODE='23514';END IF;
 RETURN round(n/p.forest_area_ha,8);
END $$;


ALTER FUNCTION public.fn_wc_special_population_density(population_id bigint) OWNER TO postgres;

--
-- Name: fn_wc_special_population_prerequisites(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_special_population_prerequisites() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE utype text;b public.wc_fire_task_source%ROWTYPE;form text;
BEGIN
 SELECT unit_type INTO utype FROM public.wc_fire_spatial_unit WHERE task_id=NEW.task_id AND unit_id=NEW.town_id;
 IF NOT FOUND THEN RAISE EXCEPTION '人口统计乡镇不存在或不属于本任务' USING ERRCODE='23503';END IF;
 IF utype<>'TOWNSHIP' THEN RAISE EXCEPTION '人口统计必须关联乡镇空间单元' USING ERRCODE='23514';END IF;
 IF NEW.data_status='VALID' THEN
  SELECT * INTO b FROM public.wc_fire_task_source WHERE task_id=NEW.task_id AND source_code=NEW.source_code AND source_batch=NEW.source_batch;
  IF NOT FOUND OR b.quality_status<>'PASSED' THEN RAISE EXCEPTION '有效人口统计需要已通过检查的来源批次' USING ERRCODE='23514';END IF;
  IF NOT EXISTS(SELECT 1 FROM public.wc_fire_quality_dictionary WHERE quality_code=NEW.quality_code AND status='ACTIVE') THEN RAISE EXCEPTION '有效人口统计需要启用质量代码' USING ERRCODE='23514';END IF;
  IF b.metadata_json->>'population_scope' IS DISTINCT FROM 'FOREST_AREA'
   OR b.metadata_json->>'coverage_status' IS DISTINCT FROM 'COMPLETE'
   OR coalesce(b.metadata_json->>'population_definition_ref','') !~ '[^[:space:]]'
   OR coalesce(b.metadata_json->>'forest_area_version','') !~ '[^[:space:]]' THEN
   RAISE EXCEPTION '人口批次须说明林区口径、完整覆盖及面积版本' USING ERRCODE='23514';END IF;
  form:=b.metadata_json->>'population_count_form';
  IF form IS NULL OR form NOT IN ('TOTAL_ONLY','SPLIT_ONLY','TOTAL_AND_SPLIT') THEN RAISE EXCEPTION '来源须明确合计/分项统计形式' USING ERRCODE='23514';END IF;
  IF (form='TOTAL_ONLY' AND (NEW.special_population_total IS NULL OR num_nonnulls(NEW.no_civil_capacity,NEW.limited_civil_capacity)<>0))
   OR (form='SPLIT_ONLY' AND (NEW.special_population_total IS NOT NULL OR num_nonnulls(NEW.no_civil_capacity,NEW.limited_civil_capacity)<>2))
   OR (form='TOTAL_AND_SPLIT' AND num_nonnulls(NEW.special_population_total,NEW.no_civil_capacity,NEW.limited_civil_capacity)<>3) THEN
   RAISE EXCEPTION '人数存储与来源统计形式不一致，不伪造分项' USING ERRCODE='23514';END IF;
  IF form='TOTAL_AND_SPLIT' THEN
   IF b.metadata_json->>'total_split_same_definition' IS DISTINCT FROM 'true' THEN RAISE EXCEPTION '总分并存须已确认定义/范围相同' USING ERRCODE='23514';END IF;
   IF NEW.special_population_total::bigint<>NEW.no_civil_capacity::bigint+NEW.limited_civil_capacity::bigint THEN RAISE EXCEPTION '同口径合计与分项不一致' USING ERRCODE='23514';END IF;
  END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_special_population_prerequisites() OWNER TO postgres;

--
-- Name: fn_wc_species_detail_assert(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_species_detail_assert(detail text, catalog text) RETURNS void
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE d public.wc_species_detail%ROWTYPE;
BEGIN
 IF detail IS NULL THEN RETURN;END IF;
 SELECT * INTO d FROM public.wc_species_detail WHERE detail_id=detail;
 IF NOT FOUND THEN RAISE EXCEPTION '树种细分记录不存在' USING ERRCODE='23503';END IF;
 IF catalog IS DISTINCT FROM d.catalog_species_code THEN RAISE EXCEPTION '树种细分与目录代码不一致' USING ERRCODE='23514';END IF;
 IF d.status<>'ACTIVE' OR NOT EXISTS(SELECT 1 FROM public.wc_species_dictionary WHERE species_code=catalog AND status='ACTIVE') THEN RAISE EXCEPTION '树种细分及所属目录须已确认有效' USING ERRCODE='23514';END IF;
END $$;


ALTER FUNCTION public.fn_wc_species_detail_assert(detail text, catalog text) OWNER TO postgres;

--
-- Name: fn_wc_species_detail_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_species_detail_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE parent_status text; cycle boolean;
BEGIN
 -- Serialize edits within a catalog so concurrent changes cannot introduce a cycle.
 PERFORM 1 FROM public.wc_species_dictionary WHERE species_code=NEW.catalog_species_code FOR UPDATE;
 IF NEW.parent_detail_id IS NOT NULL THEN
  SELECT status INTO parent_status FROM public.wc_species_detail WHERE detail_id=NEW.parent_detail_id AND catalog_species_code=NEW.catalog_species_code;
  IF NOT FOUND THEN RAISE EXCEPTION '上级细分不存在或属于其他目录' USING ERRCODE='23503';END IF;
  WITH RECURSIVE chain(id,parent,path) AS (
   SELECT detail_id,parent_detail_id,ARRAY[detail_id::text] FROM public.wc_species_detail WHERE detail_id=NEW.parent_detail_id
   UNION ALL SELECT d.detail_id,d.parent_detail_id,c.path||d.detail_id::text FROM public.wc_species_detail d JOIN chain c ON d.detail_id=c.parent WHERE NOT(d.detail_id=ANY(c.path))
  ) SELECT EXISTS(SELECT 1 FROM chain WHERE id=NEW.detail_id OR parent=NEW.detail_id) INTO cycle;
  IF cycle THEN RAISE EXCEPTION '树种细分上下级不能成环' USING ERRCODE='23514';END IF;
 END IF;
 IF NEW.status='ACTIVE' THEN
  IF NOT EXISTS(SELECT 1 FROM public.wc_species_dictionary WHERE species_code=NEW.catalog_species_code AND status='ACTIVE') OR (NEW.parent_detail_id IS NOT NULL AND parent_status<>'ACTIVE') THEN
   RAISE EXCEPTION '启用细分前所属目录及上级须有效' USING ERRCODE='23514';
  END IF;
 END IF;
 IF TG_OP='UPDATE' AND OLD.status='ACTIVE' AND NEW.status='INACTIVE' THEN
  IF EXISTS(SELECT 1 FROM public.wc_species_detail WHERE parent_detail_id=OLD.detail_id AND status='ACTIVE')
   OR EXISTS(SELECT 1 FROM public.wc_fire_forest_resource WHERE species_detail_id=OLD.detail_id)
   OR EXISTS(SELECT 1 FROM public.wc_forest_resource_survey_raw WHERE species_detail_id=OLD.detail_id)
   OR EXISTS(SELECT 1 FROM public.wc_fire_fuel_sample WHERE species_detail_id=OLD.detail_id)
   OR EXISTS(SELECT 1 FROM public.wc_biomass_conversion_parameter WHERE species_detail_id=OLD.detail_id)
   OR EXISTS(SELECT 1 FROM public.wc_species_combustibility WHERE species_detail_id=OLD.detail_id) THEN
    RAISE EXCEPTION '细分已有有效子级或记录引用，保留历史并采用新记录' USING ERRCODE='23514';
  END IF;
 END IF;
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_species_detail_guard() OWNER TO postgres;

--
-- Name: fn_wc_species_detail_reference_guard(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_wc_species_detail_reference_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 PERFORM public.fn_wc_species_detail_assert(NEW.species_detail_id,to_jsonb(NEW)->>TG_ARGV[0]);
 RETURN NEW;
END $$;


ALTER FUNCTION public.fn_wc_species_detail_reference_guard() OWNER TO postgres;

--
-- Name: wc_fire_indicator_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_indicator_definition (
    indicator_code character varying(60) NOT NULL,
    indicator_name character varying(200) NOT NULL,
    indicator_group character varying(40) NOT NULL,
    value_type character varying(20) NOT NULL,
    default_unit character varying(40),
    source_code character varying(60),
    evidence_status character varying(40) NOT NULL,
    standard_field_name character varying(200),
    standard_field_status character varying(30) DEFAULT 'NOT_CONFIRMED'::character varying NOT NULL,
    description text,
    processing_contract_json jsonb,
    CONSTRAINT ck_fire_indicator_confirmed_evidence CHECK ((((standard_field_status)::text <> 'CONFIRMED'::text) OR ((standard_field_name IS NOT NULL) AND (source_code IS NOT NULL)))),
    CONSTRAINT ck_fire_indicator_optional_text CHECK ((((default_unit IS NULL) OR ((default_unit)::text ~ '[^[:space:]]'::text)) AND ((standard_field_name IS NULL) OR ((standard_field_name)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_fire_indicator_required_text CHECK ((((indicator_code)::text ~ '[^[:space:]]'::text) AND ((indicator_name)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_r15_identity_text CHECK ((((indicator_code IS NULL) OR ((indicator_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r18_processing_contract CHECK (((processing_contract_json IS NULL) OR (jsonb_typeof(processing_contract_json) = 'object'::text))),
    CONSTRAINT wc_fire_indicator_definition_evidence_status_check CHECK (((evidence_status)::text = ANY ((ARRAY['VERIFIED_PUBLIC'::character varying, 'OFFICIAL_REQUEST_REQUIRED'::character varying, 'DESIGN_ONLY'::character varying, 'PENDING_FULL_TEXT'::character varying])::text[]))),
    CONSTRAINT wc_fire_indicator_definition_indicator_group_check CHECK (((indicator_group)::text = ANY ((ARRAY['FUEL'::character varying, 'FIRE_SOURCE'::character varying, 'WEATHER'::character varying, 'TERRAIN'::character varying, 'HISTORY'::character varying, 'POPULATION'::character varying, 'ECONOMY'::character varying, 'BUILDING'::character varying, 'FOREST_RESOURCE'::character varying, 'CAPACITY'::character varying, 'HAZARD'::character varying])::text[]))),
    CONSTRAINT wc_fire_indicator_definition_standard_field_status_check CHECK (((standard_field_status)::text = ANY ((ARRAY['CONFIRMED'::character varying, 'REFERENCE_ONLY'::character varying, 'NOT_CONFIRMED'::character varying])::text[]))),
    CONSTRAINT wc_fire_indicator_definition_value_type_check CHECK (((value_type)::text = ANY ((ARRAY['NUMERIC'::character varying, 'TEXT'::character varying, 'BOOLEAN'::character varying, 'DATE'::character varying, 'CODE'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_indicator_definition OWNER TO postgres;

--
-- Name: TABLE wc_fire_indicator_definition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_indicator_definition IS '指标定义表';


--
-- Name: COLUMN wc_fire_indicator_definition.indicator_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.indicator_code IS '指标代码';


--
-- Name: COLUMN wc_fire_indicator_definition.indicator_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.indicator_name IS '指标中文名称';


--
-- Name: COLUMN wc_fire_indicator_definition.indicator_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.indicator_group IS '业务分类';


--
-- Name: COLUMN wc_fire_indicator_definition.value_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.value_type IS '取值类型';


--
-- Name: COLUMN wc_fire_indicator_definition.default_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.default_unit IS '默认取值单位';


--
-- Name: COLUMN wc_fire_indicator_definition.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_indicator_definition.evidence_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.evidence_status IS '依据核验状态';


--
-- Name: COLUMN wc_fire_indicator_definition.standard_field_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.standard_field_name IS '标准对应字段名';


--
-- Name: COLUMN wc_fire_indicator_definition.standard_field_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.standard_field_status IS '标准字段对应状态';


--
-- Name: COLUMN wc_fire_indicator_definition.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.description IS '指标详细说明
P-02隐患用途：区分减灾能力等级、房屋RIE及乡镇PRIE的定义与取值类型。';


--
-- Name: COLUMN wc_fire_indicator_definition.processing_contract_json; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_indicator_definition.processing_contract_json IS '指标设计计算链：阶段、前置指标、原始表/分母、公式、参数与证据定位；不是已执行规则。原始值与派生值独立代码；正式执行仍由规则和指标采用校验控制。';


--
-- Name: wc_fire_source_registry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_source_registry (
    source_code character varying(60) NOT NULL,
    source_name character varying(300) NOT NULL,
    source_type character varying(30) NOT NULL,
    issuing_org character varying(300) NOT NULL,
    official_url text,
    standard_no character varying(80),
    version_note character varying(300),
    evidence_status character varying(40) NOT NULL,
    field_dictionary_status character varying(40) NOT NULL,
    applicable_scope character varying(500),
    checked_on date DEFAULT CURRENT_DATE NOT NULL,
    note text,
    CONSTRAINT ck_r15_dictionary_evidence CHECK (((field_dictionary_status)::text = ANY ((ARRAY['CONFIRMED'::character varying, 'PARTIAL'::character varying, 'NOT_PUBLIC'::character varying, 'NOT_APPLICABLE'::character varying, 'NOT_CONFIRMED'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK (((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_r20_text_nonblank CHECK ((((source_name)::text ~ '[^[:space:]]'::text) AND ((issuing_org)::text ~ '[^[:space:]]'::text) AND ((standard_no IS NULL) OR ((standard_no)::text ~ '[^[:space:]]'::text)) AND ((version_note IS NULL) OR ((version_note)::text ~ '[^[:space:]]'::text)) AND ((applicable_scope IS NULL) OR ((applicable_scope)::text ~ '[^[:space:]]'::text)) AND ((official_url IS NULL) OR (official_url ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_fire_source_registry_evidence_status_check CHECK (((evidence_status)::text = ANY ((ARRAY['VERIFIED_PUBLIC'::character varying, 'OFFICIAL_REQUEST_REQUIRED'::character varying, 'DESIGN_ONLY'::character varying, 'PENDING_FULL_TEXT'::character varying])::text[]))),
    CONSTRAINT wc_fire_source_registry_source_type_check CHECK (((source_type)::text = ANY ((ARRAY['国家标准'::character varying, '行业标准'::character varying, '官方项目文件'::character varying, '官方公开数据'::character varying, '海南官方资料'::character varying, '项目设计'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_source_registry OWNER TO postgres;

--
-- Name: TABLE wc_fire_source_registry; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_source_registry IS '数据来源登记表';


--
-- Name: COLUMN wc_fire_source_registry.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_source_registry.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_source_registry.source_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.source_type IS '来源类型';


--
-- Name: COLUMN wc_fire_source_registry.issuing_org; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.issuing_org IS '发布或提供机构';


--
-- Name: COLUMN wc_fire_source_registry.official_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.official_url IS '官方资料链接';


--
-- Name: COLUMN wc_fire_source_registry.standard_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.standard_no IS '标准或规范编号';


--
-- Name: COLUMN wc_fire_source_registry.version_note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.version_note IS '来源版本说明';


--
-- Name: COLUMN wc_fire_source_registry.evidence_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.evidence_status IS '证据登记状态';


--
-- Name: COLUMN wc_fire_source_registry.field_dictionary_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.field_dictionary_status IS '字段字典核定状态';


--
-- Name: COLUMN wc_fire_source_registry.applicable_scope; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.applicable_scope IS '适用范围';


--
-- Name: COLUMN wc_fire_source_registry.checked_on; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.checked_on IS '资料核对日期';


--
-- Name: COLUMN wc_fire_source_registry.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_registry.note IS '备注';


--
-- Name: vw_wc_fire_field_source_matrix; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_wc_fire_field_source_matrix AS
 SELECT d.indicator_code,
    d.indicator_name,
    d.indicator_group,
    d.value_type,
    d.default_unit,
    d.standard_field_name,
    d.standard_field_status,
    d.evidence_status,
    s.source_name,
    s.standard_no,
    s.issuing_org,
    s.official_url,
    s.field_dictionary_status,
    s.note AS source_note
   FROM (public.wc_fire_indicator_definition d
     LEFT JOIN public.wc_fire_source_registry s ON (((s.source_code)::text = (d.source_code)::text)));


ALTER VIEW public.vw_wc_fire_field_source_matrix OWNER TO postgres;

--
-- Name: wc_compartment_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_compartment_weather (
    task_id character varying(50) NOT NULL,
    unit_id character varying(18) CONSTRAINT wc_compartment_weather_bsm_not_null NOT NULL,
    weather_unit_id character varying(100) NOT NULL,
    overlap_area_m2 numeric(18,3),
    assign_method character varying(50) NOT NULL,
    method_version character varying(50) NOT NULL,
    weather_unit_type character varying(20) NOT NULL,
    assign_weight numeric(12,8) NOT NULL,
    source_code character varying(60) NOT NULL,
    source_record_id character varying(120) NOT NULL,
    source_batch character varying(200) NOT NULL,
    quality_code character varying(30) NOT NULL,
    CONSTRAINT chk_compartment_weather_grid_overlap CHECK ((((weather_unit_type)::text = 'STATION'::text) OR (overlap_area_m2 IS NOT NULL))),
    CONSTRAINT chk_compartment_weather_overlap_nonnegative CHECK (((overlap_area_m2 IS NULL) OR (overlap_area_m2 >= (0)::numeric))),
    CONSTRAINT chk_compartment_weather_unit_type CHECK (((weather_unit_type)::text = ANY ((ARRAY['STATION'::character varying, 'GRID'::character varying])::text[]))),
    CONSTRAINT chk_compartment_weather_weight_range CHECK (((assign_weight >= (0)::numeric) AND (assign_weight <= (1)::numeric)))
);


ALTER TABLE public.wc_compartment_weather OWNER TO postgres;

--
-- Name: TABLE wc_compartment_weather; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_compartment_weather IS '空间气象关联表';


--
-- Name: COLUMN wc_compartment_weather.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_compartment_weather.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_compartment_weather.weather_unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.weather_unit_id IS '气象统计单元编号';


--
-- Name: COLUMN wc_compartment_weather.overlap_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.overlap_area_m2 IS '空间单元与气象格网重叠面积（平方米）';


--
-- Name: COLUMN wc_compartment_weather.assign_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.assign_method IS '气象赋值方法';


--
-- Name: COLUMN wc_compartment_weather.method_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.method_version IS '空间赋值方法版本';


--
-- Name: COLUMN wc_compartment_weather.weather_unit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.weather_unit_type IS '气象统计单元类型';


--
-- Name: COLUMN wc_compartment_weather.assign_weight; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.assign_weight IS '空间赋值权重';


--
-- Name: COLUMN wc_compartment_weather.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_compartment_weather.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_compartment_weather.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.source_batch IS '来源批次';


--
-- Name: COLUMN wc_compartment_weather.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_compartment_weather.quality_code IS '数据质量代码';


--
-- Name: wc_fire_assessment_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_assessment_task (
    task_id character varying(60) NOT NULL,
    task_name character varying(300) NOT NULL,
    assessment_year smallint NOT NULL,
    data_start date,
    data_end date,
    fire_season_start character varying(20),
    fire_season_end character varying(20),
    spatial_unit character varying(30) NOT NULL,
    crs_code character varying(80) NOT NULL,
    model_version character varying(100) NOT NULL,
    rule_version character varying(100),
    source_batch character varying(200),
    task_status character varying(30) DEFAULT 'DRAFT'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    note text,
    CONSTRAINT ck_fire_task_assessment_year CHECK (((assessment_year >= 1) AND (assessment_year <= 9999))),
    CONSTRAINT ck_fire_task_calculation_config CHECK ((((task_status)::text = ANY ((ARRAY['DRAFT'::character varying, 'DATA_LOADING'::character varying])::text[])) OR ((data_start IS NOT NULL) AND (data_end IS NOT NULL) AND (rule_version IS NOT NULL)))),
    CONSTRAINT ck_fire_task_data_period CHECK ((((data_start IS NULL) AND (data_end IS NULL)) OR ((data_start IS NOT NULL) AND (data_end IS NOT NULL) AND (data_start <= data_end)))),
    CONSTRAINT ck_fire_task_optional_text CHECK ((((rule_version IS NULL) OR ((rule_version)::text ~ '[^[:space:]]'::text)) AND ((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_fire_task_required_text CHECK ((((task_id)::text ~ '[^[:space:]]'::text) AND ((task_name)::text ~ '[^[:space:]]'::text) AND ((crs_code)::text ~ '[^[:space:]]'::text) AND ((model_version)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_fire_task_season_end_mmdd CHECK (((fire_season_end IS NULL) OR ((fire_season_end)::text ~ '^((01|03|05|07|08|10|12)-(0[1-9]|[12][0-9]|3[01])|(04|06|09|11)-(0[1-9]|[12][0-9]|30)|02-(0[1-9]|1[0-9]|2[0-9]))$'::text))),
    CONSTRAINT ck_fire_task_season_pair CHECK (((fire_season_start IS NULL) = (fire_season_end IS NULL))),
    CONSTRAINT ck_fire_task_season_start_mmdd CHECK (((fire_season_start IS NULL) OR ((fire_season_start)::text ~ '^((01|03|05|07|08|10|12)-(0[1-9]|[12][0-9]|3[01])|(04|06|09|11)-(0[1-9]|[12][0-9]|30)|02-(0[1-9]|1[0-9]|2[0-9]))$'::text))),
    CONSTRAINT ck_r15_identity_text CHECK ((((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((crs_code IS NULL) OR ((crs_code)::text ~ '[^[:space:]]'::text)) AND ((model_version IS NULL) OR ((model_version)::text ~ '[^[:space:]]'::text)) AND ((rule_version IS NULL) OR ((rule_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_fire_assessment_task_spatial_unit_check CHECK (((spatial_unit)::text = ANY ((ARRAY['SMALL_COMPARTMENT'::character varying, 'GRID_30_ARCSEC'::character varying, 'GRID_1KM'::character varying, 'TOWNSHIP'::character varying, 'COUNTY'::character varying, 'BUILDING'::character varying, 'MIXED'::character varying])::text[]))),
    CONSTRAINT wc_fire_assessment_task_task_status_check CHECK (((task_status)::text = ANY ((ARRAY['DRAFT'::character varying, 'DATA_LOADING'::character varying, 'READY_FOR_CALCULATION'::character varying, 'CALCULATED'::character varying, 'REVIEWED'::character varying, 'PUBLISHED'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_assessment_task OWNER TO postgres;

--
-- Name: TABLE wc_fire_assessment_task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_assessment_task IS '森林火灾评估任务表';


--
-- Name: COLUMN wc_fire_assessment_task.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_assessment_task.task_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.task_name IS '任务中文名称';


--
-- Name: COLUMN wc_fire_assessment_task.assessment_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.assessment_year IS '评估年度';


--
-- Name: COLUMN wc_fire_assessment_task.data_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.data_start IS '资料窗口起始日期';


--
-- Name: COLUMN wc_fire_assessment_task.data_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.data_end IS '资料窗口结束日期';


--
-- Name: COLUMN wc_fire_assessment_task.fire_season_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.fire_season_start IS '年度防火期开始月日';


--
-- Name: COLUMN wc_fire_assessment_task.fire_season_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.fire_season_end IS '年度防火期结束月日';


--
-- Name: COLUMN wc_fire_assessment_task.spatial_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.spatial_unit IS '任务计算尺度';


--
-- Name: COLUMN wc_fire_assessment_task.crs_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.crs_code IS '任务几何坐标系';


--
-- Name: COLUMN wc_fire_assessment_task.model_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.model_version IS '计算模型版本';


--
-- Name: COLUMN wc_fire_assessment_task.rule_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.rule_version IS '采用规则包版本';


--
-- Name: COLUMN wc_fire_assessment_task.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_assessment_task.task_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.task_status IS '任务阶段';


--
-- Name: COLUMN wc_fire_assessment_task.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.created_at IS '任务建立时间';


--
-- Name: COLUMN wc_fire_assessment_task.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_assessment_task.note IS '备注';


--
-- Name: wc_fire_base_terrain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_base_terrain (
    terrain_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80) NOT NULL,
    dem_mean_m numeric(12,4),
    dem_min_m numeric(12,4),
    dem_max_m numeric(12,4),
    slope_degree numeric(8,4),
    aspect_degree numeric(8,4),
    aspect_code character varying(20),
    slope_position_code character varying(20),
    distance_to_road_m numeric(14,3),
    distance_to_water_m numeric(14,3),
    source_code character varying(60) NOT NULL,
    source_record_id character varying(120) NOT NULL,
    source_batch character varying(200) NOT NULL,
    quality_code character varying(30) NOT NULL,
    geom public.geometry(Geometry,4490),
    center_point public.geometry(Point,4490),
    center_method character varying(50),
    assign_method character varying(50),
    dem_algorithm character varying(100),
    method_version character varying(100),
    CONSTRAINT wc_fire_base_terrain_aspect_range_check CHECK (((aspect_degree IS NULL) OR ((aspect_degree >= (0)::numeric) AND (aspect_degree < (360)::numeric)))),
    CONSTRAINT wc_fire_base_terrain_center_method_complete_check CHECK ((((slope_degree IS NULL) AND (aspect_degree IS NULL)) OR ((center_point IS NOT NULL) AND (center_method IS NOT NULL) AND ((center_method)::text ~ '[^[:space:]]'::text) AND (assign_method IS NOT NULL) AND ((assign_method)::text ~ '[^[:space:]]'::text) AND (dem_algorithm IS NOT NULL) AND ((dem_algorithm)::text ~ '[^[:space:]]'::text) AND (method_version IS NOT NULL) AND ((method_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT wc_fire_base_terrain_center_nonempty_check CHECK (((center_point IS NULL) OR (NOT public.st_isempty(center_point)))),
    CONSTRAINT wc_fire_base_terrain_elevation_order_check CHECK ((((dem_min_m IS NULL) OR (dem_mean_m IS NULL) OR (dem_min_m <= dem_mean_m)) AND ((dem_mean_m IS NULL) OR (dem_max_m IS NULL) OR (dem_mean_m <= dem_max_m)) AND ((dem_min_m IS NULL) OR (dem_max_m IS NULL) OR (dem_min_m <= dem_max_m)))),
    CONSTRAINT wc_fire_base_terrain_geom_valid_check CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom)))),
    CONSTRAINT wc_fire_base_terrain_required_text_check CHECK ((((terrain_id)::text ~ '[^[:space:]]'::text) AND ((task_id)::text ~ '[^[:space:]]'::text) AND ((unit_id)::text ~ '[^[:space:]]'::text) AND ((source_code)::text ~ '[^[:space:]]'::text) AND ((source_record_id)::text ~ '[^[:space:]]'::text) AND ((source_batch)::text ~ '[^[:space:]]'::text) AND ((quality_code)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT wc_fire_base_terrain_road_distance_check CHECK (((distance_to_road_m IS NULL) OR (distance_to_road_m >= (0)::numeric))),
    CONSTRAINT wc_fire_base_terrain_slope_range_check CHECK (((slope_degree IS NULL) OR ((slope_degree >= (0)::numeric) AND (slope_degree <= (90)::numeric)))),
    CONSTRAINT wc_fire_base_terrain_water_distance_check CHECK (((distance_to_water_m IS NULL) OR (distance_to_water_m >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_base_terrain OWNER TO postgres;

--
-- Name: TABLE wc_fire_base_terrain; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_base_terrain IS '地形基础表';


--
-- Name: COLUMN wc_fire_base_terrain.terrain_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.terrain_id IS '地形记录编号';


--
-- Name: COLUMN wc_fire_base_terrain.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_base_terrain.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_base_terrain.dem_mean_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.dem_mean_m IS '区域平均高程（米）';


--
-- Name: COLUMN wc_fire_base_terrain.dem_min_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.dem_min_m IS '区域最低高程（米）';


--
-- Name: COLUMN wc_fire_base_terrain.dem_max_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.dem_max_m IS '区域最高高程（米）';


--
-- Name: COLUMN wc_fire_base_terrain.slope_degree; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.slope_degree IS '中心点坡度角度（度）';


--
-- Name: COLUMN wc_fire_base_terrain.aspect_degree; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.aspect_degree IS '中心点坡向方位角（度）';


--
-- Name: COLUMN wc_fire_base_terrain.aspect_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.aspect_code IS '坡向类别代码';


--
-- Name: COLUMN wc_fire_base_terrain.slope_position_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.slope_position_code IS '坡位类别代码';


--
-- Name: COLUMN wc_fire_base_terrain.distance_to_road_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.distance_to_road_m IS '到道路距离（米）';


--
-- Name: COLUMN wc_fire_base_terrain.distance_to_water_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.distance_to_water_m IS '到水体或取水点距离（米）';


--
-- Name: COLUMN wc_fire_base_terrain.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_base_terrain.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_base_terrain.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_base_terrain.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_base_terrain.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.geom IS '地形计算范围几何';


--
-- Name: COLUMN wc_fire_base_terrain.center_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.center_point IS '实际取值中心点';


--
-- Name: COLUMN wc_fire_base_terrain.center_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.center_method IS '中心点确定方法';


--
-- Name: COLUMN wc_fire_base_terrain.assign_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.assign_method IS '栅格赋值方法';


--
-- Name: COLUMN wc_fire_base_terrain.dem_algorithm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.dem_algorithm IS 'DEM派生算法';


--
-- Name: COLUMN wc_fire_base_terrain.method_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_base_terrain.method_version IS '处理方法版本';


--
-- Name: wc_fire_building_exposure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_building_exposure (
    building_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    building_name character varying(200),
    address character varying(300),
    building_use_code character varying(60),
    building_use_name character varying(120),
    structure_type_code character varying(60),
    structure_type_name character varying(120),
    floor_count integer,
    aboveground_floor_count integer,
    underground_floor_count integer,
    building_area_m2 numeric(18,4),
    building_height_m numeric(10,3),
    built_year smallint,
    household_count integer,
    protection_level character varying(60),
    protected_building boolean,
    forest_distance_m numeric(14,3),
    in_forest_edge_100m boolean,
    exposure_flag boolean,
    vulnerability_score numeric(10,5),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    survey_date date,
    quality_code character varying(30),
    geom public.geometry(Geometry,4490) NOT NULL,
    record_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    spatial_relation_refs jsonb,
    assessment_refs jsonb,
    raw_record_id character varying(120),
    CONSTRAINT ck_building_counts CHECK ((((floor_count IS NULL) OR (floor_count >= 0)) AND ((aboveground_floor_count IS NULL) OR (aboveground_floor_count >= 0)) AND ((underground_floor_count IS NULL) OR (underground_floor_count >= 0)) AND ((household_count IS NULL) OR (household_count >= 0)))),
    CONSTRAINT ck_building_derived_refs CHECK ((((exposure_flag IS NULL) OR ((assessment_refs -> 'exposure'::text) IS NOT NULL)) AND ((vulnerability_score IS NULL) OR ((assessment_refs -> 'vulnerability'::text) IS NOT NULL)))),
    CONSTRAINT ck_building_distance CHECK (((forest_distance_m IS NULL) OR (forest_distance_m >= (0)::numeric))),
    CONSTRAINT ck_building_finite CHECK ((((building_area_m2 IS NULL) OR (building_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((building_height_m IS NULL) OR (building_height_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((forest_distance_m IS NULL) OR (forest_distance_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((vulnerability_score IS NULL) OR (vulnerability_score <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_building_geometry CHECK ((((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.geometrytype(geom) = ANY (ARRAY['POINT'::text, 'POLYGON'::text, 'MULTIPOLYGON'::text]))) IS TRUE)),
    CONSTRAINT ck_building_optional_text CHECK ((((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((building_name IS NULL) OR ((building_name)::text ~ '[^[:space:]]'::text)) AND ((address IS NULL) OR ((address)::text ~ '[^[:space:]]'::text)) AND ((building_use_code IS NULL) OR ((building_use_code)::text ~ '[^[:space:]]'::text)) AND ((building_use_name IS NULL) OR ((building_use_name)::text ~ '[^[:space:]]'::text)) AND ((structure_type_code IS NULL) OR ((structure_type_code)::text ~ '[^[:space:]]'::text)) AND ((structure_type_name IS NULL) OR ((structure_type_name)::text ~ '[^[:space:]]'::text)) AND ((protection_level IS NULL) OR ((protection_level)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_building_raw_ref_source CHECK (((raw_record_id IS NULL) OR ((source_code IS NOT NULL) AND (source_batch IS NOT NULL) AND (source_record_id IS NOT NULL)))),
    CONSTRAINT ck_building_record_status CHECK (((record_status)::text = ANY ((ARRAY['PENDING'::character varying, 'VALID'::character varying, 'MISSING'::character varying, 'REJECTED'::character varying, 'SUPERSEDED'::character varying])::text[]))),
    CONSTRAINT ck_building_refs_objects CHECK ((((spatial_relation_refs IS NULL) OR (jsonb_typeof(spatial_relation_refs) = 'object'::text)) AND ((assessment_refs IS NULL) OR (jsonb_typeof(assessment_refs) = 'object'::text)))),
    CONSTRAINT ck_building_required_text CHECK ((((building_id)::text ~ '[^[:space:]]'::text) AND ((task_id)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_building_sizes CHECK ((((building_area_m2 IS NULL) OR (building_area_m2 > (0)::numeric)) AND ((building_height_m IS NULL) OR (building_height_m > (0)::numeric)))),
    CONSTRAINT ck_building_valid_basic CHECK ((((record_status)::text <> 'VALID'::text) OR ((unit_id IS NOT NULL) AND (source_code IS NOT NULL) AND (source_record_id IS NOT NULL) AND (source_batch IS NOT NULL) AND (quality_code IS NOT NULL) AND (spatial_relation_refs IS NOT NULL)))),
    CONSTRAINT ck_building_year CHECK (((built_year IS NULL) OR (((built_year >= 1) AND (built_year <= 9998)) AND ((survey_date IS NULL) OR ((built_year)::numeric <= EXTRACT(year FROM survey_date))))))
);


ALTER TABLE public.wc_fire_building_exposure OWNER TO postgres;

--
-- Name: TABLE wc_fire_building_exposure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_building_exposure IS '房屋承灾体表';


--
-- Name: COLUMN wc_fire_building_exposure.building_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_id IS '房屋记录编号';


--
-- Name: COLUMN wc_fire_building_exposure.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_building_exposure.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.unit_id IS '建筑空间单元编号';


--
-- Name: COLUMN wc_fire_building_exposure.building_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_name IS '建筑名称';


--
-- Name: COLUMN wc_fire_building_exposure.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.address IS '原始地址';


--
-- Name: COLUMN wc_fire_building_exposure.building_use_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_use_code IS '用途原代码';


--
-- Name: COLUMN wc_fire_building_exposure.building_use_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_use_name IS '用途原名称';


--
-- Name: COLUMN wc_fire_building_exposure.structure_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.structure_type_code IS '结构原代码';


--
-- Name: COLUMN wc_fire_building_exposure.structure_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.structure_type_name IS '结构原名称';


--
-- Name: COLUMN wc_fire_building_exposure.floor_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.floor_count IS '来源主体层数';


--
-- Name: COLUMN wc_fire_building_exposure.aboveground_floor_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.aboveground_floor_count IS '地上主体层数';


--
-- Name: COLUMN wc_fire_building_exposure.underground_floor_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.underground_floor_count IS '地下主体层数';


--
-- Name: COLUMN wc_fire_building_exposure.building_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_area_m2 IS '总建筑面积（平方米）';


--
-- Name: COLUMN wc_fire_building_exposure.building_height_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.building_height_m IS '建筑高度（米）';


--
-- Name: COLUMN wc_fire_building_exposure.built_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.built_year IS '来源建造年份';


--
-- Name: COLUMN wc_fire_building_exposure.household_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.household_count IS '来源户数';


--
-- Name: COLUMN wc_fire_building_exposure.protection_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.protection_level IS '来源保护级别';


--
-- Name: COLUMN wc_fire_building_exposure.protected_building; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.protected_building IS '保护性建筑标志';


--
-- Name: COLUMN wc_fire_building_exposure.forest_distance_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.forest_distance_m IS '与森林的距离（米）';


--
-- Name: COLUMN wc_fire_building_exposure.in_forest_edge_100m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.in_forest_edge_100m IS '历史100米参考标志';


--
-- Name: COLUMN wc_fire_building_exposure.exposure_flag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.exposure_flag IS '模型暴露纳入判断';


--
-- Name: COLUMN wc_fire_building_exposure.vulnerability_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.vulnerability_score IS '建筑脆弱性派生值';


--
-- Name: COLUMN wc_fire_building_exposure.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_building_exposure.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_building_exposure.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_building_exposure.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.survey_date IS '调查/核验日期';


--
-- Name: COLUMN wc_fire_building_exposure.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_building_exposure.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.geom IS '建筑位置或轮廓几何';


--
-- Name: COLUMN wc_fire_building_exposure.record_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.record_status IS '房屋记录处理状态';


--
-- Name: COLUMN wc_fire_building_exposure.spatial_relation_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.spatial_relation_refs IS '空间关系与采用引用
P-02隐患用途：引用森林范围、建筑中心点和乡镇归属的处理依据。';


--
-- Name: COLUMN wc_fire_building_exposure.assessment_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.assessment_refs IS '派生采用依据
P-02隐患用途：引用单栋房屋RIE及等级的采用依据。';


--
-- Name: COLUMN wc_fire_building_exposure.raw_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_exposure.raw_record_id IS '库内房屋调查原始记录编号。与source_code、source_batch、source_record_id共同关联原始表，校验来源一致；允许空以保留既有记录，原始编号source_record_id含义不变。';


--
-- Name: wc_fire_building_survey_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_building_survey_raw (
    raw_record_id character varying(120) NOT NULL,
    source_code character varying(60) NOT NULL,
    source_batch character varying(200) NOT NULL,
    source_record_id character varying(120) NOT NULL,
    building_survey_type character varying(10),
    raw_building_name character varying(200),
    raw_address text,
    raw_structure_code character varying(60),
    raw_structure_name character varying(120),
    structure_dictionary_ref text,
    survey_date date,
    raw_geom public.geometry,
    raw_crs text,
    raw_attributes jsonb NOT NULL,
    source_locator text,
    imported_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_building_raw_attributes CHECK ((jsonb_typeof(raw_attributes) = 'object'::text)),
    CONSTRAINT ck_building_raw_identity CHECK ((((raw_record_id)::text ~ '[^[:space:]]'::text) AND ((source_code)::text ~ '[^[:space:]]'::text) AND ((source_batch)::text ~ '[^[:space:]]'::text) AND ((source_record_id)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_building_raw_survey_type CHECK (((building_survey_type IS NULL) OR ((building_survey_type)::text = ANY ((ARRAY['URBAN'::character varying, 'RURAL'::character varying])::text[]))))
);


ALTER TABLE public.wc_fire_building_survey_raw OWNER TO postgres;

--
-- Name: TABLE wc_fire_building_survey_raw; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_building_survey_raw IS '房屋调查原始表。逐条保存房屋建筑普查或调查来源记录，覆盖全部调查房屋；结构、位置及属性保持来源含义，P04易燃分类和计数在下游完成。原始成果文件及字段、代码字典通过来源和批次追溯。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_record_id IS '库内原始记录编号；项目追溯主键，不替代上游房屋编号。';


--
-- Name: COLUMN wc_fire_building_survey_raw.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.source_code IS '来源代码，关联数据来源登记表。';


--
-- Name: COLUMN wc_fire_building_survey_raw.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.source_batch IS '来源批次；区分不同交付和版本，同批次保留原始记录。';


--
-- Name: COLUMN wc_fire_building_survey_raw.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.source_record_id IS '上游原始房屋记录编号，与来源和批次共同唯一。';


--
-- Name: COLUMN wc_fire_building_survey_raw.building_survey_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.building_survey_type IS '调查类型：URBAN城镇、RURAL农村；未明确时允许空，不据此推断房屋结构。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_building_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_building_name IS '来源原始房屋名称。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_address IS '来源原始房屋地址。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_structure_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_structure_code IS '来源原始结构代码，不替换为项目代码或P04分类代码。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_structure_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_structure_name IS '来源原始结构名称，与原代码一并保留。';


--
-- Name: COLUMN wc_fire_building_survey_raw.structure_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.structure_dictionary_ref IS '来源结构字典及版本引用，用于解释原始结构代码；P04判定规则另存规则表。';


--
-- Name: COLUMN wc_fire_building_survey_raw.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.survey_date IS '来源记载的调查或核验日期，不用导入日期代替。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_geom IS '来源原始位置或轮廓，保留原坐标及SRID，不强制转换为4490；坐标依据见raw_crs及来源。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_crs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_crs IS '来源坐标系、坐标参考说明或WKT；与原始几何含义一致。';


--
-- Name: COLUMN wc_fire_building_survey_raw.raw_attributes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.raw_attributes IS '来源逐栋属性的JSON对象快照，保持字段和值的来源含义；不是P04派生计算结果。';


--
-- Name: COLUMN wc_fire_building_survey_raw.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.source_locator IS '原始文件、图层、工作表或行号等记录定位信息，结合来源批次定位原件。';


--
-- Name: COLUMN wc_fire_building_survey_raw.imported_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_building_survey_raw.imported_at IS '原始记录入库时间，带时区；不是调查日期。';


--
-- Name: wc_fire_capacity_barrier_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_barrier_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.5'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    barrier_type_code character varying(100),
    barrier_type_name character varying(200),
    barrier_type_dictionary_ref text,
    facility_code character varying(100),
    start_address text,
    end_address text,
    start_point public.geometry(Point,4490),
    end_point public.geometry(Point,4490),
    width_m numeric(18,4),
    length_km numeric(18,4),
    built_ym character varying(7),
    condition_name text,
    CONSTRAINT ck_f06_5_form CHECK (((survey_form_code)::text = 'A.5'::text)),
    CONSTRAINT wc_fire_capacity_barrier_deta_barrier_type_dictionary_ref_check CHECK ((barrier_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_barrier_type_code_check CHECK (((barrier_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_barrier_type_name_check CHECK (((barrier_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_built_ym_check CHECK (((built_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_built_ym_check1 CHECK (((built_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_barrier_detail_condition_name_check CHECK ((condition_name ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_end_address_check CHECK ((end_address ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_end_point_check CHECK (((NOT public.st_isempty(end_point)) AND public.st_isvalid(end_point))),
    CONSTRAINT wc_fire_capacity_barrier_detail_facility_code_check CHECK (((facility_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_length_km_check CHECK (((length_km <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (length_km >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_barrier_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_start_address_check CHECK ((start_address ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_start_point_check CHECK (((NOT public.st_isempty(start_point)) AND public.st_isvalid(start_point))),
    CONSTRAINT wc_fire_capacity_barrier_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_barrier_detail_width_m_check CHECK (((width_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (width_m >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_capacity_barrier_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_barrier_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_barrier_detail IS '防火阻隔设施明细表；F06 A.5，PDF第13页。P42：筛选、去重和按采用范围处理后，阻隔带公里数×1000÷林地公顷。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.barrier_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.barrier_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.barrier_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.barrier_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.barrier_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.barrier_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.facility_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.facility_code IS '来源设施编号。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.start_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.start_address IS '起始地址。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.end_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.end_address IS '终止地址。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.start_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.start_point IS '起点坐标。经核对转换为4490；原投影和转换依据仍在总表来源';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.end_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.end_point IS '终点坐标。';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.width_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.width_m IS '平均宽度。米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.length_km; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.length_km IS '来源总里程。公里；P41/P42使用时×1000换成米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.built_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.built_ym IS '建设年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_barrier_detail.condition_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_barrier_detail.condition_name IS '来源设施状况。';


--
-- Name: wc_fire_capacity_command_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_command_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.1'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    agency_code character varying(100),
    agency_level character varying(40),
    affiliation_name character varying(200),
    established_ym character varying(7),
    management_staff_count integer,
    has_management_agency boolean,
    has_active_plan boolean,
    active_plan_ref text,
    has_active_response_plan boolean,
    response_plan_ref text,
    fund_in_budget boolean,
    five_year_mean_funding_wan numeric(18,4),
    capital_fund_sufficient boolean,
    five_year_mean_capital_wan numeric(18,4),
    annual_funding_year integer,
    annual_funding_wan numeric(18,4),
    annual_funding_ref text,
    CONSTRAINT ck_f06_1_form CHECK (((survey_form_code)::text = 'A.1'::text)),
    CONSTRAINT wc_fire_capacity_command_detai_five_year_mean_capital_wan_check CHECK (((five_year_mean_capital_wan <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (five_year_mean_capital_wan >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_command_detai_five_year_mean_funding_wan_check CHECK (((five_year_mean_funding_wan <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (five_year_mean_funding_wan >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_command_detail_active_plan_ref_check CHECK ((active_plan_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_affiliation_name_check CHECK (((affiliation_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_agency_code_check CHECK (((agency_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_agency_level_check CHECK (((agency_level)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_annual_funding_ref_check CHECK ((annual_funding_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_annual_funding_wan_check CHECK (((annual_funding_wan <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (annual_funding_wan >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_command_detail_annual_funding_year_check CHECK (((annual_funding_year IS NULL) OR ((annual_funding_year >= 1900) AND (annual_funding_year <= 2200)))),
    CONSTRAINT wc_fire_capacity_command_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_command_detail_check1 CHECK ((((annual_funding_wan IS NULL) AND (annual_funding_year IS NULL)) OR ((annual_funding_wan IS NOT NULL) AND (annual_funding_year IS NOT NULL) AND (annual_funding_ref IS NOT NULL)))),
    CONSTRAINT wc_fire_capacity_command_detail_established_ym_check CHECK (((established_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_established_ym_check1 CHECK (((established_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_management_staff_count_check CHECK ((management_staff_count >= 0)),
    CONSTRAINT wc_fire_capacity_command_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_response_plan_ref_check CHECK ((response_plan_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_command_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_command_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_command_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_command_detail IS '防火指挥机构明细表；F06 A.1，PDF第7页。P11—P13机构/规划/预案判断；P14年财政投入。F06年均和P03单年分别保存。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_command_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_command_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_command_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_command_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_command_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_command_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.agency_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.agency_code IS '机构编码。统一社会信用代码或原组织机构代码';


--
-- Name: COLUMN wc_fire_capacity_command_detail.agency_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.agency_level IS '机构级别。保留来源解释，不与空间层级自动等同';


--
-- Name: COLUMN wc_fire_capacity_command_detail.affiliation_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.affiliation_name IS '职责隶属。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.established_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.established_ym IS '机构成立年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_command_detail.management_staff_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.management_staff_count IS '防火管理人员总数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_command_detail.has_management_agency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.has_management_agency IS '是否设防火管理机构。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_command_detail.has_active_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.has_active_plan IS '是否有正在执行专项防火规划。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_command_detail.active_plan_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.active_plan_ref IS '执行中规划依据。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.has_active_response_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.has_active_response_plan IS '是否有正在执行应急预案。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_command_detail.response_plan_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.response_plan_ref IS '执行中预案依据。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.fund_in_budget; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.fund_in_budget IS '防火经费是否纳入财政预算。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_command_detail.five_year_mean_funding_wan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.five_year_mean_funding_wan IS '近五年年均防火财政经费。万元/年，F06 A.1原始年均金额；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_command_detail.capital_fund_sufficient; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.capital_fund_sufficient IS '防火基本建设经费是否足额到位。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_command_detail.five_year_mean_capital_wan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.five_year_mean_capital_wan IS '近五年年均防火基建投资。万元/年；不与防火财政经费混加；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_command_detail.annual_funding_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.annual_funding_year IS 'P14采用的指定单年度。各乡镇同一任务、期间统一年度；文昌项目口径，不默认当前年。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.annual_funding_wan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.annual_funding_wan IS '指定单年度的本乡镇防火财政经费总额，万元。P14分子；非乡镇财政总支出，不以五年年均替代；缺失NULL，有限非负。';


--
-- Name: COLUMN wc_fire_capacity_command_detail.annual_funding_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_command_detail.annual_funding_ref IS '单年度防火财政经费来源及采用依据。与年度、总表乡镇和期间对应；同笔拨付与接收不重复计入。';


--
-- Name: wc_fire_capacity_communication_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_communication_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.10'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    reporting_level character varying(40),
    is_cumulative boolean NOT NULL,
    total_count integer,
    radio_subtotal integer,
    radio_fixed_count integer,
    radio_handheld_count integer,
    radio_vehicle_count integer,
    satellite_subtotal integer,
    vsat_subtotal integer,
    vsat_fixed_count integer,
    vsat_vehicle_count integer,
    vsat_portable_count integer,
    maritime_satellite_count integer,
    maritime_operator text,
    satellite_handset_count integer,
    satellite_names text,
    communication_coverage_pct numeric(18,4),
    coverage_scope_ref text,
    CONSTRAINT ck_f06_10_form CHECK (((survey_form_code)::text = 'A.10'::text)),
    CONSTRAINT wc_fire_capacity_communicatio_communication_coverage_pct_check1 CHECK (((communication_coverage_pct IS NULL) OR (communication_coverage_pct <= (100)::numeric))),
    CONSTRAINT wc_fire_capacity_communication_communication_coverage_pct_check CHECK (((communication_coverage_pct <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (communication_coverage_pct >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_communication_d_maritime_satellite_count_check CHECK ((maritime_satellite_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_de_satellite_handset_count_check CHECK ((satellite_handset_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detai_radio_handheld_count_check CHECK ((radio_handheld_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_communication_detail_coverage_scope_ref_check CHECK ((coverage_scope_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_maritime_operator_check CHECK ((maritime_operator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_radio_fixed_count_check CHECK ((radio_fixed_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_radio_subtotal_check CHECK ((radio_subtotal >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_radio_vehicle_count_check CHECK ((radio_vehicle_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_reporting_level_check CHECK (((reporting_level)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_satellite_names_check CHECK ((satellite_names ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_satellite_subtotal_check CHECK ((satellite_subtotal >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_communication_detail_total_count_check CHECK ((total_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_vsat_fixed_count_check CHECK ((vsat_fixed_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_vsat_portable_count_check CHECK ((vsat_portable_count >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_vsat_subtotal_check CHECK ((vsat_subtotal >= 0)),
    CONSTRAINT wc_fire_capacity_communication_detail_vsat_vehicle_count_check CHECK ((vsat_vehicle_count >= 0))
);


ALTER TABLE public.wc_fire_capacity_communication_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_communication_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_communication_detail IS '通信指挥系统明细表；F06 A.10，PDF第18页。保留累计、小计、分项层次；不得把这些层次再相加。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.reporting_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.reporting_level IS '来源统计级别。累计/省级/市级/县级等；一个层级一条记录';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.is_cumulative; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.is_cumulative IS '是否累计行。true累计，false本级；不可累计行和各级明细重复相加';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.total_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.total_count IS '来源总计。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.radio_subtotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.radio_subtotal IS '电台小计。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.radio_fixed_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.radio_fixed_count IS '固定电台数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.radio_handheld_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.radio_handheld_count IS '手持电台数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.radio_vehicle_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.radio_vehicle_count IS '车载电台数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.satellite_subtotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.satellite_subtotal IS '卫星通信系统小计。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.vsat_subtotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.vsat_subtotal IS 'VSAT小计。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.vsat_fixed_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.vsat_fixed_count IS 'VSAT固定站数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.vsat_vehicle_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.vsat_vehicle_count IS 'VSAT车载站数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.vsat_portable_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.vsat_portable_count IS 'VSAT便携站数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.maritime_satellite_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.maritime_satellite_count IS '海事卫星数量。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.maritime_operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.maritime_operator IS '海事卫星运营商。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.satellite_handset_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.satellite_handset_count IS '手持卫星电话数量。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.satellite_names; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.satellite_names IS '手持电话使用卫星。';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.communication_coverage_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.communication_coverage_pct IS '通讯覆盖率。百分数0—100；明确采用范围；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_communication_detail.coverage_scope_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_communication_detail.coverage_scope_ref IS '通信覆盖范围及口径依据。';


--
-- Name: wc_fire_capacity_information_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_information_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.9'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    system_code character varying(100),
    system_type_code character varying(100),
    system_type_name character varying(200),
    system_type_dictionary_ref text,
    system_level character varying(40),
    built_ym character varying(7),
    main_functions text,
    maintenance_condition text,
    CONSTRAINT ck_f06_9_form CHECK (((survey_form_code)::text = 'A.9'::text)),
    CONSTRAINT wc_fire_capacity_information_d_system_type_dictionary_ref_check CHECK ((system_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_built_ym_check CHECK (((built_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_built_ym_check1 CHECK (((built_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_information_detail_main_functions_check CHECK ((main_functions ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_maintenance_condition_check CHECK ((maintenance_condition ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_system_code_check CHECK (((system_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_system_level_check CHECK (((system_level)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_system_type_code_check CHECK (((system_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_system_type_name_check CHECK (((system_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_information_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_information_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_information_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_information_detail IS '信息指挥系统明细表；F06 A.9，PDF第17页。每套信息系统一条；支撑资料，不额外增加第14项能力分数。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_information_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_information_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_information_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_information_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_information_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_information_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.system_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.system_code IS '来源系统编号。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.system_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.system_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_information_detail.system_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.system_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.system_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.system_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.system_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.system_level IS '系统级别。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.built_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.built_ym IS '建成年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_information_detail.main_functions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.main_functions IS '主要功能。';


--
-- Name: COLUMN wc_fire_capacity_information_detail.maintenance_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_information_detail.maintenance_condition IS '维护状况。';


--
-- Name: wc_fire_capacity_lookout_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_lookout_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.6'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    record_kind character varying(20) NOT NULL,
    facility_code character varying(100),
    lookout_type_code character varying(100),
    lookout_type_name character varying(200),
    lookout_type_dictionary_ref text,
    tower_height_m numeric(18,4),
    built_ym character varying(7),
    max_observation_area_ha numeric(18,4),
    has_maintenance_fund boolean,
    effective_coverage_ha numeric(18,4),
    coverage_scope_ref text,
    CONSTRAINT ck_f06_6_form CHECK (((survey_form_code)::text = 'A.6'::text)),
    CONSTRAINT wc_fire_capacity_lookout_deta_lookout_type_dictionary_ref_check CHECK ((lookout_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_built_ym_check CHECK (((built_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_built_ym_check1 CHECK (((built_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_lookout_detail_check1 CHECK (((((record_kind)::text = 'FACILITY'::text) AND (effective_coverage_ha IS NULL)) OR (((record_kind)::text = 'AREA_SUMMARY'::text) AND (max_observation_area_ha IS NULL) AND (tower_height_m IS NULL) AND (has_maintenance_fund IS NULL)))),
    CONSTRAINT wc_fire_capacity_lookout_detail_coverage_scope_ref_check CHECK ((coverage_scope_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_effective_coverage_ha_check CHECK (((effective_coverage_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (effective_coverage_ha >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_lookout_detail_facility_code_check CHECK (((facility_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_lookout_type_code_check CHECK (((lookout_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_lookout_type_name_check CHECK (((lookout_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_max_observation_area_ha_check CHECK (((max_observation_area_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (max_observation_area_ha >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_lookout_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_record_kind_check CHECK (((record_kind)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_record_kind_check1 CHECK (((record_kind)::text = ANY ((ARRAY['FACILITY'::character varying, 'AREA_SUMMARY'::character varying])::text[]))),
    CONSTRAINT wc_fire_capacity_lookout_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_lookout_detail_tower_height_m_check CHECK (((tower_height_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (tower_height_m >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_capacity_lookout_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_lookout_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_lookout_detail IS '瞭望监测明细表；F06 A.6，PDF第14页。P32使用AREA_SUMMARY的总体有效覆盖面积；FACILITY用于设施台账。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.record_kind; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.record_kind IS '明细记录类型。FACILITY为单设施；AREA_SUMMARY为乡镇总体统计；分行保存';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.facility_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.facility_code IS '来源设施编号。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.lookout_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.lookout_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.lookout_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.lookout_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.lookout_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.lookout_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.tower_height_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.tower_height_m IS '塔体总高度。米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.built_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.built_ym IS '建设年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.max_observation_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.max_observation_area_ha IS '单设施最大观测面积。公顷；不能直接相加当总体有效覆盖；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.has_maintenance_fund; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.has_maintenance_fund IS '是否有固定维护经费。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.effective_coverage_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.effective_coverage_ha IS '乡镇总体有效覆盖面积。公顷；仅AREA_SUMMARY，已处理覆盖重叠；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_lookout_detail.coverage_scope_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_lookout_detail.coverage_scope_ref IS '总体覆盖范围与去重依据。';


--
-- Name: wc_fire_capacity_other_facility_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_other_facility_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.11'::character varying CONSTRAINT wc_fire_capacity_other_facility_detai_survey_form_code_not_null NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    facility_code character varying(100),
    facility_type_code character varying(100),
    facility_type_name character varying(200),
    facility_type_dictionary_ref text,
    elevation_m numeric(14,4),
    building_area_m2 numeric(18,4),
    building_height_m numeric(18,4),
    structure_type_code character varying(100),
    structure_type_name character varying(200),
    structure_type_dictionary_ref text,
    staff_count integer,
    CONSTRAINT ck_f06_11_form CHECK (((survey_form_code)::text = 'A.11'::text)),
    CONSTRAINT wc_fire_capacity_other_facil_facility_type_dictionary_ref_check CHECK ((facility_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facil_structure_type_dictionary_re_check CHECK ((structure_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detai_structure_type_code_check CHECK (((structure_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detai_structure_type_name_check CHECK (((structure_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_building_area_m2_check CHECK (((building_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (building_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_other_facility_detail_building_height_m_check CHECK (((building_height_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (building_height_m >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_other_facility_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_other_facility_detail_elevation_m_check CHECK ((elevation_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))),
    CONSTRAINT wc_fire_capacity_other_facility_detail_facility_code_check CHECK (((facility_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_facility_type_code_check CHECK (((facility_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_facility_type_name_check CHECK (((facility_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_staff_count_check CHECK ((staff_count >= 0)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_other_facility_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_other_facility_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_other_facility_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_other_facility_detail IS '其他防火设施明细表；F06 A.11，PDF第19页。按规定类型筛选管护站、检查站、宣传设施等参与P33；不能全部设施无差别计数。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.facility_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.facility_code IS '来源设施编号。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.facility_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.facility_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.facility_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.facility_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.facility_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.facility_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.elevation_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.elevation_m IS '高程。米；允许负值，必须有限';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.building_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.building_area_m2 IS '设施建筑面积。平方米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.building_height_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.building_height_m IS '设施建筑高度。米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.structure_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.structure_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.structure_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.structure_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.structure_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.structure_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_other_facility_detail.staff_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_other_facility_detail.staff_count IS '站点涉及人员数量。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: wc_fire_capacity_ranger_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_ranger_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.3'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    ranger_count integer,
    patrol_area_ha numeric(18,4),
    reported_mean_area_ha numeric(18,4),
    has_personal_terminal boolean,
    CONSTRAINT ck_f06_3_form CHECK (((survey_form_code)::text = 'A.3'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_ranger_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_patrol_area_ha_check CHECK (((patrol_area_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (patrol_area_ha >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_ranger_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_ranger_count_check CHECK ((ranger_count >= 0)),
    CONSTRAINT wc_fire_capacity_ranger_detail_reported_mean_area_ha_check CHECK (((reported_mean_area_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (reported_mean_area_ha >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_ranger_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_ranger_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_ranger_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_ranger_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_ranger_detail IS '护林员乡镇明细表；F06 A.3，PDF第10页。每乡镇统计一条；P31＝总管护面积÷护林员人数。';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.ranger_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.ranger_count IS '护林员总人数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.patrol_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.patrol_area_ha IS '总管护面积。公顷；实际巡护覆盖，不默认等于林地面积；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.reported_mean_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.reported_mean_area_ha IS '来源平均管护面积。公顷/人；保留来源值以核对总管护面积÷人数；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_ranger_detail.has_personal_terminal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_ranger_detail.has_personal_terminal IS '是否配备信息化个人终端。true是/有，false否/无，NULL未知；不默认否';


--
-- Name: wc_fire_capacity_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_resource (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    capacity_type character varying(60) NOT NULL,
    resource_name character varying(200),
    quantity numeric(18,4),
    unit character varying(40),
    service_radius_m numeric(14,3),
    response_time_min numeric(10,3),
    availability_status character varying(40),
    responsible_org character varying(300),
    contact_phone character varying(80),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    survey_date date,
    quality_code character varying(30),
    geom public.geometry(Geometry,4490),
    record_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    resource_attributes jsonb,
    verification_refs jsonb,
    service_refs jsonb,
    survey_form_code character varying(8),
    period_key character varying(40),
    CONSTRAINT ck_cap_f06_identity CHECK ((((survey_form_code IS NULL) AND (period_key IS NULL)) OR ((survey_form_code IS NOT NULL) AND ((survey_form_code)::text = ANY ((ARRAY['A.1'::character varying, 'A.2'::character varying, 'A.3'::character varying, 'A.4'::character varying, 'A.5'::character varying, 'A.6'::character varying, 'A.7'::character varying, 'A.8'::character varying, 'A.9'::character varying, 'A.10'::character varying, 'A.11'::character varying])::text[])) AND (period_key IS NOT NULL) AND ((period_key)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_capacity_finite CHECK ((((quantity IS NULL) OR (quantity <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((service_radius_m IS NULL) OR (service_radius_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((response_time_min IS NULL) OR (response_time_min <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_capacity_geometry CHECK (((geom IS NULL) OR (((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.geometrytype(geom) = ANY (ARRAY['POINT'::text, 'MULTIPOINT'::text, 'LINESTRING'::text, 'MULTILINESTRING'::text, 'POLYGON'::text, 'MULTIPOLYGON'::text]))) IS TRUE))),
    CONSTRAINT ck_capacity_nonnegative CHECK ((((quantity IS NULL) OR (quantity >= (0)::numeric)) AND ((service_radius_m IS NULL) OR (service_radius_m >= (0)::numeric)) AND ((response_time_min IS NULL) OR (response_time_min >= (0)::numeric)))),
    CONSTRAINT ck_capacity_optional_text CHECK ((((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((resource_name IS NULL) OR ((resource_name)::text ~ '[^[:space:]]'::text)) AND ((unit IS NULL) OR ((unit)::text ~ '[^[:space:]]'::text)) AND ((availability_status IS NULL) OR ((availability_status)::text ~ '[^[:space:]]'::text)) AND ((responsible_org IS NULL) OR ((responsible_org)::text ~ '[^[:space:]]'::text)) AND ((contact_phone IS NULL) OR ((contact_phone)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_capacity_quantity_unit CHECK (((quantity IS NULL) OR (unit IS NOT NULL))),
    CONSTRAINT ck_capacity_record_status CHECK (((record_status)::text = ANY ((ARRAY['PENDING'::character varying, 'VALID'::character varying, 'MISSING'::character varying, 'REJECTED'::character varying, 'SUPERSEDED'::character varying])::text[]))),
    CONSTRAINT ck_capacity_refs_objects CHECK ((((resource_attributes IS NULL) OR (jsonb_typeof(resource_attributes) = 'object'::text)) AND ((verification_refs IS NULL) OR (jsonb_typeof(verification_refs) = 'object'::text)) AND ((service_refs IS NULL) OR (jsonb_typeof(service_refs) = 'object'::text)))),
    CONSTRAINT ck_capacity_required_text CHECK ((((capacity_id)::text ~ '[^[:space:]]'::text) AND ((task_id)::text ~ '[^[:space:]]'::text) AND ((capacity_type)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_capacity_valid_basic CHECK ((((record_status)::text <> 'VALID'::text) OR ((source_code IS NOT NULL) AND (source_record_id IS NOT NULL) AND (source_batch IS NOT NULL) AND (quality_code IS NOT NULL) AND (resource_attributes IS NOT NULL)))),
    CONSTRAINT ck_capacity_valid_evidence CHECK ((((record_status)::text <> 'VALID'::text) OR (((availability_status IS NULL) OR (verification_refs IS NOT NULL)) AND ((service_radius_m IS NULL) OR ((service_refs -> 'service_radius'::text) IS NOT NULL)) AND ((response_time_min IS NULL) OR ((service_refs -> 'response_time'::text) IS NOT NULL)))))
);


ALTER TABLE public.wc_fire_capacity_resource OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_resource IS '防控资源表';


--
-- Name: COLUMN wc_fire_capacity_resource.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.capacity_id IS '防控资源记录编号';


--
-- Name: COLUMN wc_fire_capacity_resource.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_capacity_resource.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.unit_id IS '关联空间单元';


--
-- Name: COLUMN wc_fire_capacity_resource.capacity_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.capacity_type IS '来源资源类别原码';


--
-- Name: COLUMN wc_fire_capacity_resource.resource_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.resource_name IS '资源/设施名称';


--
-- Name: COLUMN wc_fire_capacity_resource.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.quantity IS '来源数量';


--
-- Name: COLUMN wc_fire_capacity_resource.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.unit IS '数量原单位';


--
-- Name: COLUMN wc_fire_capacity_resource.service_radius_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.service_radius_m IS '服务半径（米）
P-02隐患用途：表示资源服务半径，不是房屋10/50/100米评价半径。';


--
-- Name: COLUMN wc_fire_capacity_resource.response_time_min; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.response_time_min IS '响应时间（分钟）';


--
-- Name: COLUMN wc_fire_capacity_resource.availability_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.availability_status IS '来源运行/可用状态';


--
-- Name: COLUMN wc_fire_capacity_resource.responsible_org; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.responsible_org IS '资源责任单位';


--
-- Name: COLUMN wc_fire_capacity_resource.contact_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.contact_phone IS '来源工作联系信息';


--
-- Name: COLUMN wc_fire_capacity_resource.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_capacity_resource.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_capacity_resource.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_capacity_resource.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.survey_date IS '调查/核验日期';


--
-- Name: COLUMN wc_fire_capacity_resource.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_capacity_resource.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.geom IS '防控资源位置或范围几何';


--
-- Name: COLUMN wc_fire_capacity_resource.record_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.record_status IS '资料记录处理状态';


--
-- Name: COLUMN wc_fire_capacity_resource.resource_attributes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.resource_attributes IS '类型原属性与记录范围';


--
-- Name: COLUMN wc_fire_capacity_resource.verification_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.verification_refs IS '运行状态核查依据
P-02隐患用途：记录隔离带、道路、河流等设施维护情况及核验时点。';


--
-- Name: COLUMN wc_fire_capacity_resource.service_refs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.service_refs IS '覆盖与响应采用依据';


--
-- Name: COLUMN wc_fire_capacity_resource.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.survey_form_code IS 'F06调查表式A.1—A.11；来源capacity_type继续保留原义；采用细分表时必填';


--
-- Name: COLUMN wc_fire_capacity_resource.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_resource.period_key IS '本条原始台账的统计期间标识；细分表与总表同期间，实际时点、起止日期由明细记录';


--
-- Name: wc_fire_capacity_road_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_road_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.8'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    road_grade_code character varying(100),
    road_grade_name character varying(200),
    road_grade_dictionary_ref text,
    surface_name character varying(100),
    facility_code character varying(100),
    start_address text,
    end_address text,
    start_point public.geometry(Point,4490),
    end_point public.geometry(Point,4490),
    width_m numeric(18,4),
    length_km numeric(18,4),
    built_ym character varying(7),
    condition_name text,
    CONSTRAINT ck_f06_8_form CHECK (((survey_form_code)::text = 'A.8'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_built_ym_check CHECK (((built_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_built_ym_check1 CHECK (((built_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_road_detail_condition_name_check CHECK ((condition_name ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_end_address_check CHECK ((end_address ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_end_point_check CHECK (((NOT public.st_isempty(end_point)) AND public.st_isvalid(end_point))),
    CONSTRAINT wc_fire_capacity_road_detail_facility_code_check CHECK (((facility_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_length_km_check CHECK (((length_km <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (length_km >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_road_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_road_grade_code_check CHECK (((road_grade_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_road_grade_dictionary_ref_check CHECK ((road_grade_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_road_grade_name_check CHECK (((road_grade_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_start_address_check CHECK ((start_address ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_start_point_check CHECK (((NOT public.st_isempty(start_point)) AND public.st_isvalid(start_point))),
    CONSTRAINT wc_fire_capacity_road_detail_surface_name_check CHECK (((surface_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_road_detail_width_m_check CHECK (((width_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (width_m >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_capacity_road_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_road_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_road_detail IS '防火道路明细表；F06 A.8，PDF第16页。P41：筛选、去重和按采用范围处理后，防火道路公里数×1000÷林地公顷。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_road_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_road_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_road_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_road_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_road_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_road_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.road_grade_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.road_grade_code IS '来源道路等级代码。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.road_grade_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.road_grade_name IS '来源道路等级名称。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.road_grade_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.road_grade_dictionary_ref IS '道路等级字典依据。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.surface_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.surface_name IS '路面类型。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.facility_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.facility_code IS '来源设施编号。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.start_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.start_address IS '起始地址。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.end_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.end_address IS '终止地址。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.start_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.start_point IS '起点坐标。经核对转换为4490；原投影和转换依据仍在总表来源';


--
-- Name: COLUMN wc_fire_capacity_road_detail.end_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.end_point IS '终点坐标。';


--
-- Name: COLUMN wc_fire_capacity_road_detail.width_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.width_m IS '平均宽度。米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_road_detail.length_km; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.length_km IS '来源总里程。公里；P41/P42使用时×1000换成米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_road_detail.built_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.built_ym IS '建设年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_road_detail.condition_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_road_detail.condition_name IS '来源设施状况。';


--
-- Name: wc_fire_capacity_team_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_team_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.2'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    team_code character varying(100),
    team_type_code character varying(100),
    team_type_name character varying(200),
    team_type_dictionary_ref text,
    established_ym character varying(7),
    personnel_count integer,
    average_age_years numeric(18,4),
    camp_area_m2 numeric(18,4),
    building_area_m2 numeric(18,4),
    barracks_area_m2 numeric(18,4),
    storage_area_m2 numeric(18,4),
    training_area_m2 numeric(18,4),
    footprint_area_m2 numeric(18,4),
    annual_aircraft_hours numeric(18,4),
    annual_uav_hours numeric(18,4),
    five_year_incident_count integer,
    five_year_person_dispatches integer,
    five_year_vehicle_dispatches integer,
    mean_response_minutes numeric(18,4),
    mean_disposal_minutes numeric(18,4),
    response_statistics_ref text,
    configuration_rule_id character varying(80),
    CONSTRAINT ck_f06_2_form CHECK (((survey_form_code)::text = 'A.2'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_annual_aircraft_hours_check CHECK (((annual_aircraft_hours <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (annual_aircraft_hours >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_annual_uav_hours_check CHECK (((annual_uav_hours <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (annual_uav_hours >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_average_age_years_check CHECK (((average_age_years <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (average_age_years >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_barracks_area_m2_check CHECK (((barracks_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (barracks_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_building_area_m2_check CHECK (((building_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (building_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_camp_area_m2_check CHECK (((camp_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (camp_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_team_detail_configuration_rule_id_check CHECK (((configuration_rule_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_established_ym_check CHECK (((established_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_established_ym_check1 CHECK (((established_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_five_year_incident_count_check CHECK ((five_year_incident_count >= 0)),
    CONSTRAINT wc_fire_capacity_team_detail_five_year_person_dispatches_check CHECK ((five_year_person_dispatches >= 0)),
    CONSTRAINT wc_fire_capacity_team_detail_five_year_vehicle_dispatches_check CHECK ((five_year_vehicle_dispatches >= 0)),
    CONSTRAINT wc_fire_capacity_team_detail_footprint_area_m2_check CHECK (((footprint_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (footprint_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_mean_disposal_minutes_check CHECK (((mean_disposal_minutes <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (mean_disposal_minutes >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_mean_response_minutes_check CHECK (((mean_response_minutes <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (mean_response_minutes >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_personnel_count_check CHECK ((personnel_count >= 0)),
    CONSTRAINT wc_fire_capacity_team_detail_response_statistics_ref_check CHECK ((response_statistics_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_storage_area_m2_check CHECK (((storage_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (storage_area_m2 >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_team_code_check CHECK (((team_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_team_type_code_check CHECK (((team_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_team_type_dictionary_ref_check CHECK ((team_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_team_type_name_check CHECK (((team_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_detail_training_area_m2_check CHECK (((training_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (training_area_m2 >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_capacity_team_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_team_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_team_detail IS '消防队伍明细表；F06 A.2，PDF第8—9页。P21实际人数；P22营区/营房面积；P23读取本队伍装备明细。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_team_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_team_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_team_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_team_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_team_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_team_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.team_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.team_code IS '来源队伍编号。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.team_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.team_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_team_detail.team_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.team_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.team_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.team_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.established_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.established_ym IS '队伍成立年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_team_detail.personnel_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.personnel_count IS '队伍总人数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.average_age_years; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.average_age_years IS '人员平均年龄。岁；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.camp_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.camp_area_m2 IS '基地总面积。平方米；P22实际营区面积；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.building_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.building_area_m2 IS '基地建筑面积。平方米；各层建筑面积；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.barracks_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.barracks_area_m2 IS '营房面积。平方米；不能用整个基地建筑面积代替；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.storage_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.storage_area_m2 IS '库房面积。平方米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.training_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.training_area_m2 IS '训练场地面积。平方米；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.footprint_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.footprint_area_m2 IS '基地建筑物占地面积。平方米；不同于各层建筑面积；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.annual_aircraft_hours; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.annual_aircraft_hours IS '年均租用飞机飞行时数。小时/年；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.annual_uav_hours; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.annual_uav_hours IS '年均无人机飞行时数。小时/年；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.five_year_incident_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.five_year_incident_count IS '近五年处置次数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.five_year_person_dispatches; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.five_year_person_dispatches IS '近五年出动人次。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.five_year_vehicle_dispatches; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.five_year_vehicle_dispatches IS '近五年出动车辆数。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.mean_response_minutes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.mean_response_minutes IS '近五年平均出警响应时间。分钟；接警到到场；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.mean_disposal_minutes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.mean_disposal_minutes IS '近五年平均处置时间。分钟；开始处置到完成；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_detail.response_statistics_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.response_statistics_ref IS '响应及处置统计依据。';


--
-- Name: COLUMN wc_fire_capacity_team_detail.configuration_rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_detail.configuration_rule_id IS '采用配置目标规则编号。复合外键关联同任务规则；实际应配数从已确认目标取，不由实际人数推测';


--
-- Name: wc_fire_capacity_team_equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_team_equipment (
    detail_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    team_capacity_id character varying(100) NOT NULL,
    period_key character varying(40) NOT NULL,
    source_locator text NOT NULL,
    source_item_code character varying(120),
    category_code character varying(100),
    category_name character varying(200) NOT NULL,
    category_dictionary_ref text,
    count_role character varying(20) NOT NULL,
    quantity numeric(18,4) NOT NULL,
    unit character varying(40) NOT NULL,
    note text,
    equipment_role character varying(20) NOT NULL,
    p03_attribute_dict_id character varying(100),
    configuration_rule_id character varying(80),
    configuration_item_ref text,
    CONSTRAINT wc_fire_capacity_team_equipment_category_code_check CHECK (((category_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_category_dictionary_ref_check CHECK ((category_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_category_name_check CHECK (((category_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_configuration_item_ref_check CHECK ((configuration_item_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_configuration_rule_id_check CHECK (((configuration_rule_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_count_role_check CHECK (((count_role)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_count_role_check1 CHECK (((count_role)::text = ANY ((ARRAY['DETAIL'::character varying, 'CATEGORY_TOTAL'::character varying])::text[]))),
    CONSTRAINT wc_fire_capacity_team_equipment_detail_id_check CHECK (((detail_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_equipment_role_check CHECK (((equipment_role)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_equipment_role_check1 CHECK (((equipment_role)::text = ANY ((ARRAY['BASIC'::character varying, 'BACKUP'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT wc_fire_capacity_team_equipment_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_p03_attribute_dict_id_check CHECK (((p03_attribute_dict_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_quantity_check CHECK (((quantity <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (quantity >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_team_equipment_source_item_code_check CHECK (((source_item_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_team_capacity_id_check CHECK (((team_capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_team_equipment_unit_check CHECK (((unit)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_team_equipment OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_team_equipment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_team_equipment IS '消防队伍装备明细表；F06 A.2，PDF第8—9页。每条明细明确所属队伍、任务、期间、类别、数量、单位及原始行号；大类合计与明细不重复汇总。';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.detail_id IS '明细记录编号。主键';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.task_id IS '任务编号。与所属队伍相同';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.team_capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.team_capacity_id IS '所属队伍资源编号。复合外键直接关联对应明细，不能挂其他类型资源';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.period_key IS '统计期间标识。与所属队伍相同';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.source_locator IS '原始清单行定位。同一所属对象、期间内唯一';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.source_item_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.source_item_code IS '原始资产或清单编号。';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.category_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.category_code IS '来源类别代码。结合来源字典解释';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.category_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.category_name IS '来源类别名称。每类/每件一条，不能混合单位';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.category_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.category_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.count_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.count_role IS '数量层级。DETAIL明细或CATEGORY_TOTAL大类合计；同一汇总不得双计';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.quantity IS '实际数量。数量单位由unit解释；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.unit IS '实际数量单位。台/部/个/套/升/箱/双等，不得混加';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.equipment_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.equipment_role IS '装备用途。BASIC基本/BACKUP备份/OTHER其他，P23须按正式采用规则筛选';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.p03_attribute_dict_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.p03_attribute_dict_id IS 'P03设备类别映射字典记录。外键关联分类字典；非空时仅允许CAP_P03_ATTRIBUTE中的P03_EQUIP_*';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.configuration_rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.configuration_rule_id IS '实际配置目标规则编号。复合外键同任务；实际数量与标准配置目标分开';


--
-- Name: COLUMN wc_fire_capacity_team_equipment.configuration_item_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_team_equipment.configuration_item_ref IS '规则中具体配置目标定位。';


--
-- Name: wc_fire_capacity_warehouse_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_warehouse_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.4'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    warehouse_code character varying(100),
    warehouse_level character varying(40),
    ownership_type_code character varying(100),
    ownership_type_name character varying(200),
    ownership_type_dictionary_ref text,
    built_ym character varying(7),
    effective_capacity_value numeric(18,4),
    effective_capacity_unit character varying(30),
    effective_capacity_ref text,
    management_staff_count integer,
    stock_value_wan numeric(18,4),
    stock_value_ref text,
    CONSTRAINT ck_f06_4_form CHECK (((survey_form_code)::text = 'A.4'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_d_ownership_type_dictionary_re_check CHECK ((ownership_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detai_effective_capacity_value_check CHECK (((effective_capacity_value <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (effective_capacity_value >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_warehouse_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_built_ym_check CHECK (((built_ym)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_built_ym_check1 CHECK (((built_ym)::text ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_warehouse_detail_check1 CHECK ((((effective_capacity_value IS NULL) AND (effective_capacity_unit IS NULL)) OR ((effective_capacity_value IS NOT NULL) AND (effective_capacity_unit IS NOT NULL)))),
    CONSTRAINT wc_fire_capacity_warehouse_detail_effective_capacity_ref_check CHECK ((effective_capacity_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_effective_capacity_unit_check CHECK (((effective_capacity_unit)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_management_staff_count_check CHECK ((management_staff_count >= 0)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_ownership_type_code_check CHECK (((ownership_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_ownership_type_name_check CHECK (((ownership_type_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_stock_value_ref_check CHECK ((stock_value_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_stock_value_wan_check CHECK (((stock_value_wan <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (stock_value_wan >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_warehouse_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_warehouse_code_check CHECK (((warehouse_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_detail_warehouse_level_check CHECK (((warehouse_level)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_warehouse_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_warehouse_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_warehouse_detail IS '防火储备库明细表；F06 A.4，PDF第11—12页。P15采用库物资总金额；库内物资按所属库另存明细。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.warehouse_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.warehouse_code IS '来源储备库编号。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.warehouse_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.warehouse_level IS '储备库等级。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.ownership_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.ownership_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.ownership_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.ownership_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.ownership_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.ownership_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.built_ym; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.built_ym IS '储备库建成年月。YYYY-MM；只给年月时不虚构具体日';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.effective_capacity_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.effective_capacity_value IS '有效库容原始值。按来源原单位保存；表格立方米与填表说明平方米不一致，待核；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.effective_capacity_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.effective_capacity_unit IS '有效库容原始单位。保留来源m²或m³，禁止无依据换算';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.effective_capacity_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.effective_capacity_ref IS '库容单位依据。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.management_staff_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.management_staff_count IS '日常管理人员数量。人/个/次等按字段注释；非负整数；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.stock_value_wan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.stock_value_wan IS '统一库存时点的本条库记录储备物资折合总金额，万元。P15按本乡镇采用库总额汇总；不重复加物资明细，不自动分配跨乡镇共用物资。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_detail.stock_value_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_detail.stock_value_ref IS '库存总金额、组成及本次乡镇采用依据。统一库存时点；跨乡镇分配须经确认，不按仓库位置推定服务归属。';


--
-- Name: wc_fire_capacity_warehouse_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_warehouse_item (
    detail_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    warehouse_capacity_id character varying(100) NOT NULL,
    period_key character varying(40) NOT NULL,
    source_locator text NOT NULL,
    source_item_code character varying(120),
    category_code character varying(100),
    category_name character varying(200) NOT NULL,
    category_dictionary_ref text,
    count_role character varying(20) NOT NULL,
    quantity numeric(18,4) NOT NULL,
    unit character varying(40) NOT NULL,
    note text,
    item_value_wan numeric(18,4),
    valuation_ref text,
    CONSTRAINT wc_fire_capacity_warehouse_item_category_code_check CHECK (((category_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_category_dictionary_ref_check CHECK ((category_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_category_name_check CHECK (((category_name)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_count_role_check CHECK (((count_role)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_count_role_check1 CHECK (((count_role)::text = ANY ((ARRAY['DETAIL'::character varying, 'CATEGORY_TOTAL'::character varying])::text[]))),
    CONSTRAINT wc_fire_capacity_warehouse_item_detail_id_check CHECK (((detail_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_item_value_wan_check CHECK (((item_value_wan <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (item_value_wan >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_warehouse_item_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_quantity_check CHECK (((quantity <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])) AND (quantity >= (0)::numeric))),
    CONSTRAINT wc_fire_capacity_warehouse_item_source_item_code_check CHECK (((source_item_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_unit_check CHECK (((unit)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_valuation_ref_check CHECK ((valuation_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warehouse_item_warehouse_capacity_id_check CHECK (((warehouse_capacity_id)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_warehouse_item OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_warehouse_item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_warehouse_item IS '储备库物资明细表；F06 A.4，PDF第11—12页。每条明细明确所属储备库、任务、期间、类别、数量、单位及原始行号；大类合计与明细不重复汇总。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.detail_id IS '明细记录编号。主键';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.task_id IS '任务编号。与所属储备库相同';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.warehouse_capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.warehouse_capacity_id IS '所属储备库资源编号。复合外键直接关联对应明细，不能挂其他类型资源';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.period_key IS '统计期间标识。与所属储备库相同';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.source_locator IS '原始清单行定位。同一所属对象、期间内唯一';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.source_item_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.source_item_code IS '原始资产或清单编号。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.category_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.category_code IS '来源类别代码。结合来源字典解释';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.category_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.category_name IS '来源类别名称。每类/每件一条，不能混合单位';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.category_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.category_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.count_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.count_role IS '数量层级。DETAIL明细或CATEGORY_TOTAL大类合计；同一汇总不得双计';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.quantity IS '实际数量。数量单位由unit解释；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.unit IS '实际数量单位。台/部/个/套/升/箱/双等，不得混加';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.item_value_wan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.item_value_wan IS '本行物资折合金额。万元；不是单价；有限非负；缺失为NULL';


--
-- Name: COLUMN wc_fire_capacity_warehouse_item.valuation_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warehouse_item.valuation_ref IS '折合金额依据。';


--
-- Name: wc_fire_capacity_warning_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_capacity_warning_detail (
    capacity_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    period_key character varying(40) NOT NULL,
    survey_form_code character varying(8) DEFAULT 'A.7'::character varying NOT NULL,
    source_locator text NOT NULL,
    as_of_date date,
    stat_start date,
    stat_end date,
    address_text text,
    note text,
    facility_code character varying(100),
    warning_type_code character varying(100),
    warning_type_name character varying(200),
    warning_type_dictionary_ref text,
    elevation_m numeric(14,4),
    network_type character varying(60),
    terminal_number character varying(150),
    CONSTRAINT ck_f06_7_form CHECK (((survey_form_code)::text = 'A.7'::text)),
    CONSTRAINT wc_fire_capacity_warning_deta_warning_type_dictionary_ref_check CHECK ((warning_type_dictionary_ref ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_address_text_check CHECK ((address_text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_capacity_id_check CHECK (((capacity_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_check CHECK ((((stat_start IS NULL) AND (stat_end IS NULL)) OR ((stat_start IS NOT NULL) AND (stat_end IS NOT NULL) AND (stat_start <= stat_end)))),
    CONSTRAINT wc_fire_capacity_warning_detail_elevation_m_check CHECK ((elevation_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))),
    CONSTRAINT wc_fire_capacity_warning_detail_facility_code_check CHECK (((facility_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_network_type_check CHECK (((network_type)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_note_check CHECK ((note ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_period_key_check CHECK (((period_key)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_source_locator_check CHECK ((source_locator ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_survey_form_code_check CHECK (((survey_form_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_task_id_check CHECK (((task_id)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_terminal_number_check CHECK (((terminal_number)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_warning_type_code_check CHECK (((warning_type_code)::text ~ '[^[:space:]]'::text)),
    CONSTRAINT wc_fire_capacity_warning_detail_warning_type_name_check CHECK (((warning_type_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_capacity_warning_detail OWNER TO postgres;

--
-- Name: TABLE wc_fire_capacity_warning_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_capacity_warning_detail IS '火险预警设施明细表；F06 A.7，PDF第15页。按来源类别确认森林火险监测站、雷电监测站，参加P33规定五类站点统计。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.capacity_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.capacity_id IS '总表资源记录编号。主键；与总表一一对应';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.task_id IS '评估任务编号。与总表同任务';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.period_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.period_key IS '统计期间标识。与总表同期间；实际起止日期另存';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.survey_form_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.survey_form_code IS 'F06调查表式。固定为本表对应A.1—A.11；不能改挂其他对象';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.source_locator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.source_locator IS '原始表单及行定位。文件/表单/行号；与总表来源共同追溯';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.as_of_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.as_of_date IS '统计时点。F06原普查时点2020-12-31；按实际采用资料记录，不自动改为当前年';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.stat_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.stat_start IS '统计起始日。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.stat_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.stat_end IS '统计结束日。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.address_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.address_text IS '原始地址或位置说明。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.note IS '备注。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.facility_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.facility_code IS '来源设施编号。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.warning_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.warning_type_code IS '来源分类代码。须按来源字典解释，不猜代码';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.warning_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.warning_type_name IS '来源分类名称。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.warning_type_dictionary_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.warning_type_dictionary_ref IS '来源分类字典依据。';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.elevation_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.elevation_m IS '高程。米；可为负值，必须有限';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.network_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.network_type IS '信息传输网络类型。来源GPRS/3G/4G/5G/其他';


--
-- Name: COLUMN wc_fire_capacity_warning_detail.terminal_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_capacity_warning_detail.terminal_number IS '通信终端号码。文本保留前导0';


--
-- Name: wc_fire_economy_grid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_economy_grid (
    record_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    grid_code character varying(80),
    stat_year smallint,
    gdp_cny numeric(20,4),
    primary_industry_gdp_cny numeric(20,4),
    secondary_industry_gdp_cny numeric(20,4),
    tertiary_industry_gdp_cny numeric(20,4),
    cultivated_land_value_cny numeric(20,4),
    forest_asset_value_cny numeric(20,4),
    fixed_asset_value_cny numeric(20,4),
    economic_density_cny_per_ha numeric(20,6),
    spatialization_method character varying(200),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(Polygon,4490),
    CONSTRAINT ck_r15_finite CHECK ((((gdp_cny IS NULL) OR (gdp_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((primary_industry_gdp_cny IS NULL) OR (primary_industry_gdp_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((secondary_industry_gdp_cny IS NULL) OR (secondary_industry_gdp_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((tertiary_industry_gdp_cny IS NULL) OR (tertiary_industry_gdp_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((cultivated_land_value_cny IS NULL) OR (cultivated_land_value_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((forest_asset_value_cny IS NULL) OR (forest_asset_value_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((fixed_asset_value_cny IS NULL) OR (fixed_asset_value_cny <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((economic_density_cny_per_ha IS NULL) OR (economic_density_cny_per_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((record_id IS NULL) OR ((record_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((grid_code IS NULL) OR ((grid_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_nonnegative CHECK ((((gdp_cny IS NULL) OR (gdp_cny >= (0)::numeric)) AND ((primary_industry_gdp_cny IS NULL) OR (primary_industry_gdp_cny >= (0)::numeric)) AND ((secondary_industry_gdp_cny IS NULL) OR (secondary_industry_gdp_cny >= (0)::numeric)) AND ((tertiary_industry_gdp_cny IS NULL) OR (tertiary_industry_gdp_cny >= (0)::numeric)) AND ((cultivated_land_value_cny IS NULL) OR (cultivated_land_value_cny >= (0)::numeric)) AND ((forest_asset_value_cny IS NULL) OR (forest_asset_value_cny >= (0)::numeric)) AND ((fixed_asset_value_cny IS NULL) OR (fixed_asset_value_cny >= (0)::numeric)) AND ((economic_density_cny_per_ha IS NULL) OR (economic_density_cny_per_ha >= (0)::numeric)))),
    CONSTRAINT ck_r15_stat_year CHECK (((stat_year IS NULL) OR (stat_year > 0))),
    CONSTRAINT ck_r20_batch_nonblank CHECK (((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)))
);


ALTER TABLE public.wc_fire_economy_grid OWNER TO postgres;

--
-- Name: TABLE wc_fire_economy_grid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_economy_grid IS '经济格网表';


--
-- Name: COLUMN wc_fire_economy_grid.record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.record_id IS '经济格网记录编号';


--
-- Name: COLUMN wc_fire_economy_grid.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_economy_grid.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.unit_id IS '标准空间单元编号';


--
-- Name: COLUMN wc_fire_economy_grid.grid_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.grid_code IS '格网代码';


--
-- Name: COLUMN wc_fire_economy_grid.stat_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.stat_year IS '统计年份';


--
-- Name: COLUMN wc_fire_economy_grid.gdp_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.gdp_cny IS '地区生产总值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.primary_industry_gdp_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.primary_industry_gdp_cny IS '第一产业生产总值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.secondary_industry_gdp_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.secondary_industry_gdp_cny IS '第二产业生产总值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.tertiary_industry_gdp_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.tertiary_industry_gdp_cny IS '第三产业生产总值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.cultivated_land_value_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.cultivated_land_value_cny IS '耕地价值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.forest_asset_value_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.forest_asset_value_cny IS '森林资产价值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.fixed_asset_value_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.fixed_asset_value_cny IS '固定资产价值（元）';


--
-- Name: COLUMN wc_fire_economy_grid.economic_density_cny_per_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.economic_density_cny_per_ha IS '经济密度（元/公顷）
单位说明：采用P-04万元/公顷口径时须换算。';


--
-- Name: COLUMN wc_fire_economy_grid.spatialization_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.spatialization_method IS '空间化处理方法';


--
-- Name: COLUMN wc_fire_economy_grid.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_economy_grid.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_economy_grid.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_economy_grid.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_economy_grid.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_economy_grid.geom IS '经济格网几何';


--
-- Name: wc_fire_forest_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_forest_resource (
    resource_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    forest_type_code character varying(40),
    forest_type_name character varying(120),
    forest_category character varying(60),
    dominant_species_code character varying(40),
    dominant_species_name character varying(160),
    origin_type character varying(40),
    age_group character varying(40),
    canopy_density numeric(8,4),
    forest_area_ha numeric(16,4),
    stock_volume_m3 numeric(18,4),
    biomass_t numeric(18,4),
    ecological_value numeric(20,4),
    economic_value numeric(20,4),
    survey_year smallint,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(MultiPolygon,4490),
    note text,
    species_detail_id character varying(80),
    aboveground_live_biomass_t numeric(18,4),
    CONSTRAINT ck_forest_resource_aboveground_live_biomass CHECK (((aboveground_live_biomass_t IS NULL) OR ((aboveground_live_biomass_t >= (0)::numeric) AND (aboveground_live_biomass_t <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_forest_resource_detail_catalog CHECK (((species_detail_id IS NULL) OR (dominant_species_code IS NOT NULL)))
);


ALTER TABLE public.wc_fire_forest_resource OWNER TO postgres;

--
-- Name: TABLE wc_fire_forest_resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_forest_resource IS '森林资源表';


--
-- Name: COLUMN wc_fire_forest_resource.resource_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.resource_id IS '森林资源记录编号';


--
-- Name: COLUMN wc_fire_forest_resource.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_forest_resource.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_forest_resource.forest_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.forest_type_code IS '森林类型代码';


--
-- Name: COLUMN wc_fire_forest_resource.forest_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.forest_type_name IS '森林类型名称';


--
-- Name: COLUMN wc_fire_forest_resource.forest_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.forest_category IS '森林类别';


--
-- Name: COLUMN wc_fire_forest_resource.dominant_species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.dominant_species_code IS '优势树种代码';


--
-- Name: COLUMN wc_fire_forest_resource.dominant_species_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.dominant_species_name IS '优势树种名称';


--
-- Name: COLUMN wc_fire_forest_resource.origin_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.origin_type IS '起源类型';


--
-- Name: COLUMN wc_fire_forest_resource.age_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.age_group IS '龄组';


--
-- Name: COLUMN wc_fire_forest_resource.canopy_density; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.canopy_density IS '郁闭度';


--
-- Name: COLUMN wc_fire_forest_resource.forest_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.forest_area_ha IS '森林面积，公顷';


--
-- Name: COLUMN wc_fire_forest_resource.stock_volume_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.stock_volume_m3 IS '林木蓄积量，立方米';


--
-- Name: COLUMN wc_fire_forest_resource.biomass_t; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.biomass_t IS '生物量，吨
口径说明：活体、枯死及地上/地下组成以来源为准。';


--
-- Name: COLUMN wc_fire_forest_resource.ecological_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.ecological_value IS '生态价值';


--
-- Name: COLUMN wc_fire_forest_resource.economic_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.economic_value IS '经济价值';


--
-- Name: COLUMN wc_fire_forest_resource.survey_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.survey_year IS '调查年度';


--
-- Name: COLUMN wc_fire_forest_resource.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_forest_resource.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_forest_resource.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_forest_resource.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_forest_resource.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.geom IS '森林资源范围几何
P-02隐患用途：用于识别林区及林缘100米范围；图斑内部分界不直接作为林缘。';


--
-- Name: COLUMN wc_fire_forest_resource.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.note IS '备注';


--
-- Name: COLUMN wc_fire_forest_resource.species_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.species_detail_id IS '树种细分记录编号';


--
-- Name: COLUMN wc_fire_forest_resource.aboveground_live_biomass_t; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_forest_resource.aboveground_live_biomass_t IS '地上活生物量，吨';


--
-- Name: wc_fire_fuel_code_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_fuel_code_dictionary (
    dictionary_id character varying(100) NOT NULL,
    dict_type character varying(50) NOT NULL,
    dict_code character varying(100) NOT NULL,
    dict_name character varying(200) NOT NULL,
    dict_description text,
    score numeric(12,6),
    parent_code character varying(100),
    source_code character varying(100),
    source_document character varying(300),
    source_page character varying(50),
    dictionary_version character varying(50),
    effective_from date,
    effective_to date,
    status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    note text,
    CONSTRAINT ck_fuel_dict_parent_version CHECK (((parent_code IS NULL) OR ((dictionary_version IS NOT NULL) AND ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_fuel_dict_type_name_nonblank CHECK ((((dict_type)::text ~ '[^[:space:]]'::text) AND ((dict_name)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT ck_r15_finite CHECK (((score IS NULL) OR (score <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])))),
    CONSTRAINT ck_r15_fuel_dictionary CHECK ((((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[])) AND ((effective_from IS NULL) OR (effective_to IS NULL) OR (effective_from <= effective_to)) AND (((status)::text <> 'ACTIVE'::text) OR ((dictionary_version IS NOT NULL) AND ((dictionary_version)::text ~ '[^[:space:]]'::text))) AND ((parent_code IS NULL) OR ((parent_code)::text <> (dict_code)::text)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((dictionary_id IS NULL) OR ((dictionary_id)::text ~ '[^[:space:]]'::text)) AND ((dict_code IS NULL) OR ((dict_code)::text ~ '[^[:space:]]'::text)) AND ((parent_code IS NULL) OR ((parent_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text))))
);


ALTER TABLE public.wc_fire_fuel_code_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_fuel_code_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_fuel_code_dictionary IS '森林火灾分类字典表';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dictionary_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dictionary_id IS '字典记录编号';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dict_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dict_type IS '字典类型';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dict_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dict_code IS '字典代码
代码性质：按来源区分原文代码与项目标识。';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dict_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dict_name IS '字典名称';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dict_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dict_description IS '字典项说明';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.score IS '字典分值';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.parent_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.parent_code IS '上级字典代码';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.source_document; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.source_document IS '原始文件定位';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.status IS '字典记录状态';


--
-- Name: COLUMN wc_fire_fuel_code_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_code_dictionary.note IS '备注';


--
-- Name: wc_fire_fuel_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_fuel_sample (
    sample_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    sample_type character varying(30) NOT NULL,
    vegetation_code character varying(80),
    species_name character varying(160),
    sample_area_m2 numeric(12,4),
    fresh_mass_kg numeric(14,4),
    dry_mass_kg numeric(14,4),
    moisture_pct numeric(8,4),
    bulk_density numeric(12,5),
    fuel_load_t_hm2 numeric(14,6),
    fuel_property character varying(40),
    ignition_temperature_c numeric(8,2),
    heat_value_mj_kg numeric(10,4),
    equilibrium_moisture_pct numeric(8,4),
    sample_date date,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(Point,4490),
    note text,
    species_code character varying(60),
    fine_fuel_size_group character varying(40),
    measurement_method character varying(120),
    calculation_method character varying(120),
    test_method character varying(200),
    test_lab character varying(200),
    test_batch character varying(120),
    test_date date,
    drying_temperature_c numeric(8,2),
    drying_duration_h numeric(8,2),
    humus_layer_thickness_cm numeric(10,2),
    humus_bulk_density_kg_m3 numeric(14,4),
    coarse_fuel_length_m numeric(12,3),
    coarse_fuel_diameter_cm numeric(10,2),
    coarse_fuel_density_kg_m3 numeric(14,4),
    coarse_fuel_decay_class character varying(30),
    replicate_no integer,
    plot_id character varying(100),
    sample_position_no character varying(50),
    sampling_layer_code character varying(50),
    sample_depth_cm numeric(10,2),
    moisture_basis character varying(20),
    sample_air_temperature_c numeric(6,2),
    sample_relative_humidity_pct numeric(5,2),
    equilibrium_duration_h numeric(8,2),
    equilibrium_method character varying(100),
    humus_layer_code character varying(50),
    humus_sample_depth_start_cm numeric(10,2),
    humus_sample_depth_end_cm numeric(10,2),
    piece_count integer,
    coarse_fuel_volume_m3 numeric(14,6),
    species_detail_id character varying(80),
    CONSTRAINT ck_fuel_sample_depth CHECK (((sample_depth_cm IS NULL) OR (sample_depth_cm >= (0)::numeric))),
    CONSTRAINT ck_fuel_sample_detail_catalog CHECK (((species_detail_id IS NULL) OR (species_code IS NOT NULL))),
    CONSTRAINT ck_fuel_sample_moisture_basis CHECK (((moisture_basis IS NULL) OR ((moisture_basis)::text = 'DRY_BASIS'::text))),
    CONSTRAINT ck_fuel_sample_rh CHECK (((sample_relative_humidity_pct IS NULL) OR ((sample_relative_humidity_pct >= (0)::numeric) AND (sample_relative_humidity_pct <= (100)::numeric)))),
    CONSTRAINT wc_fire_fuel_sample_coarse_ck CHECK ((((coarse_fuel_length_m IS NULL) OR (coarse_fuel_length_m >= (0)::numeric)) AND ((coarse_fuel_diameter_cm IS NULL) OR (coarse_fuel_diameter_cm >= (0)::numeric)) AND ((coarse_fuel_density_kg_m3 IS NULL) OR (coarse_fuel_density_kg_m3 >= (0)::numeric)))),
    CONSTRAINT wc_fire_fuel_sample_humus_ck CHECK ((((humus_layer_thickness_cm IS NULL) OR (humus_layer_thickness_cm >= (0)::numeric)) AND ((humus_bulk_density_kg_m3 IS NULL) OR (humus_bulk_density_kg_m3 >= (0)::numeric)))),
    CONSTRAINT wc_fire_fuel_sample_mass_ck CHECK ((((fresh_mass_kg IS NULL) OR (fresh_mass_kg >= (0)::numeric)) AND ((dry_mass_kg IS NULL) OR (dry_mass_kg >= (0)::numeric)))),
    CONSTRAINT wc_fire_fuel_sample_moisture_ck CHECK (((moisture_pct IS NULL) OR (moisture_pct >= (0)::numeric))),
    CONSTRAINT wc_fire_fuel_sample_sample_area_ck CHECK (((sample_area_m2 IS NULL) OR (sample_area_m2 > (0)::numeric))),
    CONSTRAINT wc_fire_fuel_sample_sample_type_check CHECK (((sample_type)::text = ANY ((ARRAY['TREE'::character varying, 'SHRUB'::character varying, 'HERB'::character varying, 'LITTER'::character varying, 'HUMUS'::character varying, 'COARSE_FUEL'::character varying, 'BAMBOO'::character varying, 'MIXED'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_fuel_sample OWNER TO postgres;

--
-- Name: TABLE wc_fire_fuel_sample; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_fuel_sample IS '可燃物样品表';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_id IS '样品编号';


--
-- Name: COLUMN wc_fire_fuel_sample.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_fuel_sample.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_type IS '样品类型';


--
-- Name: COLUMN wc_fire_fuel_sample.vegetation_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.vegetation_code IS '植被/可燃物代码';


--
-- Name: COLUMN wc_fire_fuel_sample.species_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.species_name IS '树种名称';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_area_m2 IS '样品采样面积，平方米';


--
-- Name: COLUMN wc_fire_fuel_sample.fresh_mass_kg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.fresh_mass_kg IS '样品鲜质量，千克';


--
-- Name: COLUMN wc_fire_fuel_sample.dry_mass_kg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.dry_mass_kg IS '样品干质量，千克';


--
-- Name: COLUMN wc_fire_fuel_sample.moisture_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.moisture_pct IS '可燃物含水率，百分比
计算口径：干重基含水率。';


--
-- Name: COLUMN wc_fire_fuel_sample.bulk_density; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.bulk_density IS '样品容重或散装密度（单位按检测方法）';


--
-- Name: COLUMN wc_fire_fuel_sample.fuel_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.fuel_load_t_hm2 IS '单位面积可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_sample.fuel_property; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.fuel_property IS '可燃物性质/分类信息';


--
-- Name: COLUMN wc_fire_fuel_sample.ignition_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.ignition_temperature_c IS '着火温度，摄氏度';


--
-- Name: COLUMN wc_fire_fuel_sample.heat_value_mj_kg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.heat_value_mj_kg IS '热值，兆焦/千克';


--
-- Name: COLUMN wc_fire_fuel_sample.equilibrium_moisture_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.equilibrium_moisture_pct IS '平衡含水率，百分比';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_date IS '样品采集日期';


--
-- Name: COLUMN wc_fire_fuel_sample.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_fuel_sample.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_fuel_sample.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_fuel_sample.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_fuel_sample.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.geom IS '样品位置点';


--
-- Name: COLUMN wc_fire_fuel_sample.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.note IS '备注';


--
-- Name: COLUMN wc_fire_fuel_sample.species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.species_code IS '树种代码';


--
-- Name: COLUMN wc_fire_fuel_sample.fine_fuel_size_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.fine_fuel_size_group IS '细小可燃物直径分组
待核事项：0.6、2.5、7.62厘米粒径端点见歧义清单。';


--
-- Name: COLUMN wc_fire_fuel_sample.measurement_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.measurement_method IS '测定方法';


--
-- Name: COLUMN wc_fire_fuel_sample.calculation_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.calculation_method IS '计算方法';


--
-- Name: COLUMN wc_fire_fuel_sample.test_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.test_method IS '检测方法';


--
-- Name: COLUMN wc_fire_fuel_sample.test_lab; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.test_lab IS '检测实验室';


--
-- Name: COLUMN wc_fire_fuel_sample.test_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.test_batch IS '检测批次';


--
-- Name: COLUMN wc_fire_fuel_sample.test_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.test_date IS '检测日期';


--
-- Name: COLUMN wc_fire_fuel_sample.drying_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.drying_temperature_c IS '干燥温度，摄氏度';


--
-- Name: COLUMN wc_fire_fuel_sample.drying_duration_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.drying_duration_h IS '干燥时长，小时';


--
-- Name: COLUMN wc_fire_fuel_sample.humus_layer_thickness_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.humus_layer_thickness_cm IS '腐殖质层厚度，厘米';


--
-- Name: COLUMN wc_fire_fuel_sample.humus_bulk_density_kg_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.humus_bulk_density_kg_m3 IS '腐殖质层容重，千克/立方米';


--
-- Name: COLUMN wc_fire_fuel_sample.coarse_fuel_length_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.coarse_fuel_length_m IS '粗大可燃物长度，米';


--
-- Name: COLUMN wc_fire_fuel_sample.coarse_fuel_diameter_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.coarse_fuel_diameter_cm IS '粗大可燃物直径，厘米';


--
-- Name: COLUMN wc_fire_fuel_sample.coarse_fuel_density_kg_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.coarse_fuel_density_kg_m3 IS '粗大可燃物密度，千克/立方米';


--
-- Name: COLUMN wc_fire_fuel_sample.coarse_fuel_decay_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.coarse_fuel_decay_class IS '粗大可燃物腐朽等级';


--
-- Name: COLUMN wc_fire_fuel_sample.replicate_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.replicate_no IS '重复样编号';


--
-- Name: COLUMN wc_fire_fuel_sample.plot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.plot_id IS '样地编号';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_position_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_position_no IS '样地内样品位置编号';


--
-- Name: COLUMN wc_fire_fuel_sample.sampling_layer_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sampling_layer_code IS '采样层代码';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_depth_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_depth_cm IS '样品采样深度，厘米';


--
-- Name: COLUMN wc_fire_fuel_sample.moisture_basis; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.moisture_basis IS '含水率计算基准';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_air_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_air_temperature_c IS '平衡处理期间空气温度，摄氏度';


--
-- Name: COLUMN wc_fire_fuel_sample.sample_relative_humidity_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.sample_relative_humidity_pct IS '平衡处理期间相对湿度，百分比';


--
-- Name: COLUMN wc_fire_fuel_sample.equilibrium_duration_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.equilibrium_duration_h IS '平衡处理时长，小时';


--
-- Name: COLUMN wc_fire_fuel_sample.equilibrium_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.equilibrium_method IS '平衡含水率处理方法';


--
-- Name: COLUMN wc_fire_fuel_sample.humus_layer_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.humus_layer_code IS '腐殖质采样层代码';


--
-- Name: COLUMN wc_fire_fuel_sample.humus_sample_depth_start_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.humus_sample_depth_start_cm IS '腐殖质采样起始深度，厘米';


--
-- Name: COLUMN wc_fire_fuel_sample.humus_sample_depth_end_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.humus_sample_depth_end_cm IS '腐殖质采样终止深度，厘米';


--
-- Name: COLUMN wc_fire_fuel_sample.piece_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.piece_count IS '粗大可燃物件数';


--
-- Name: COLUMN wc_fire_fuel_sample.coarse_fuel_volume_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.coarse_fuel_volume_m3 IS '粗大可燃物总体积，立方米';


--
-- Name: COLUMN wc_fire_fuel_sample.species_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample.species_detail_id IS '树种细分记录编号';


--
-- Name: wc_fire_fuel_sample_plot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_fuel_sample_plot (
    plot_id character varying(100) NOT NULL,
    task_id character varying(100) NOT NULL,
    unit_id character varying(100),
    plot_type character varying(50),
    sampling_method character varying(100),
    survey_date date,
    collector character varying(100),
    survey_organization character varying(200),
    geom public.geometry(Geometry,4490),
    source_code character varying(100),
    source_record_id character varying(150),
    source_batch character varying(100),
    quality_code character varying(50),
    note text,
    plot_area_m2 numeric(14,4),
    parent_plot_id character varying(100),
    fuel_measurements jsonb,
    CONSTRAINT ck_fuel_measurements_area CHECK (((fuel_measurements IS NULL) OR (fuel_measurements = '[]'::jsonb) OR (plot_area_m2 IS NOT NULL))),
    CONSTRAINT ck_fuel_measurements_structure CHECK (public.fn_wc_fuel_measurements_valid(fuel_measurements)),
    CONSTRAINT ck_fuel_plot_area_finite_positive CHECK (((plot_area_m2 IS NULL) OR ((plot_area_m2 > (0)::numeric) AND (plot_area_m2 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_fuel_plot_parent_not_self CHECK (((parent_plot_id IS NULL) OR (((parent_plot_id)::text <> (plot_id)::text) AND ((parent_plot_id)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((plot_id IS NULL) OR ((plot_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text))))
);


ALTER TABLE public.wc_fire_fuel_sample_plot OWNER TO postgres;

--
-- Name: TABLE wc_fire_fuel_sample_plot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_fuel_sample_plot IS '可燃物样地表';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.plot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.plot_id IS '样地编号';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.unit_id IS '标准空间单元编号';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.plot_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.plot_type IS '样地类型';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.sampling_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.sampling_method IS '样地布设或抽样方法';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.survey_date IS '样地调查日期';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.collector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.collector IS '调查人员';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.survey_organization; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.survey_organization IS '调查单位';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.geom IS '样地位置或范围几何';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.note IS '备注';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.plot_area_m2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.plot_area_m2 IS '调查对象面积（平方米）';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.parent_plot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.parent_plot_id IS '上级样地或调查对象编号';


--
-- Name: COLUMN wc_fire_fuel_sample_plot.fuel_measurements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_sample_plot.fuel_measurements IS '样方分可燃物类别测量明细，JSON数组。每项记录measurement_no、fuel_category_code、sample_type、method、sample_id及称量数据；WHOLE_QUADRAT用total_fresh_mass_kg，STANDARD_PLANT/ STANDARD_CLUMP用individual_count与mean_individual_fresh_mass_kg。质量均为千克，株丛数为非负整数；species_code、fine_fuel_size_group按适用情况填写。sample_id引用同任务可燃物样品，鲜干重仍取样品表；具体类别及样品代表范围须有原始记录依据。NULL表示未录入，空数组表示尚无测量明细，不代表零载量。';


--
-- Name: wc_fire_fuel_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_fuel_unit (
    fuel_unit_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    total_fuel_load_t_hm2 numeric(14,6),
    fine_fuel_load_t_hm2 numeric(14,6),
    fuel_moisture_pct numeric(8,4),
    ignition_temperature_c numeric(8,2),
    heat_value_mj_kg numeric(10,4),
    combustibility_class character varying(20),
    combustibility_score numeric(8,5),
    estimate_method character varying(120),
    survey_date date,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    tree_biomass_t_hm2 numeric(14,6),
    shrub_load_t_hm2 numeric(14,6),
    herb_load_t_hm2 numeric(14,6),
    litter_load_t_hm2 numeric(14,6),
    humus_load_t_hm2 numeric(14,6),
    coarse_fuel_load_t_hm2 numeric(14,6),
    bamboo_load_t_hm2 numeric,
    combustibility_mapping_id bigint
);


ALTER TABLE public.wc_fire_fuel_unit OWNER TO postgres;

--
-- Name: TABLE wc_fire_fuel_unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_fuel_unit IS '可燃物单元表';


--
-- Name: COLUMN wc_fire_fuel_unit.fuel_unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.fuel_unit_id IS '可燃物单元编号';


--
-- Name: COLUMN wc_fire_fuel_unit.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_fuel_unit.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_fuel_unit.total_fuel_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.total_fuel_load_t_hm2 IS '单位面积总可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.fine_fuel_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.fine_fuel_load_t_hm2 IS '单位面积细小可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.fuel_moisture_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.fuel_moisture_pct IS '可燃物含水率，百分比
计算口径：干重基含水率。';


--
-- Name: COLUMN wc_fire_fuel_unit.ignition_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.ignition_temperature_c IS '着火温度，摄氏度';


--
-- Name: COLUMN wc_fire_fuel_unit.heat_value_mj_kg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.heat_value_mj_kg IS '热值，兆焦/千克';


--
-- Name: COLUMN wc_fire_fuel_unit.combustibility_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.combustibility_class IS '可燃性类别';


--
-- Name: COLUMN wc_fire_fuel_unit.combustibility_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.combustibility_score IS '可燃性评分';


--
-- Name: COLUMN wc_fire_fuel_unit.estimate_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.estimate_method IS '估算或测定方法';


--
-- Name: COLUMN wc_fire_fuel_unit.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.survey_date IS '调查日期';


--
-- Name: COLUMN wc_fire_fuel_unit.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_fuel_unit.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_fuel_unit.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_fuel_unit.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_fuel_unit.tree_biomass_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.tree_biomass_t_hm2 IS '乔木可燃物载量，吨/公顷
口径说明：不直接等同于P-04地上活生物量。';


--
-- Name: COLUMN wc_fire_fuel_unit.shrub_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.shrub_load_t_hm2 IS '灌木可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.herb_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.herb_load_t_hm2 IS '草本可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.litter_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.litter_load_t_hm2 IS '枯落物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.humus_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.humus_load_t_hm2 IS '腐殖质载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.coarse_fuel_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.coarse_fuel_load_t_hm2 IS '粗大可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.bamboo_load_t_hm2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.bamboo_load_t_hm2 IS '竹林可燃物载量，吨/公顷';


--
-- Name: COLUMN wc_fire_fuel_unit.combustibility_mapping_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_fuel_unit.combustibility_mapping_id IS '可燃性等级/评分来源映射编号';


--
-- Name: wc_fire_history_cause_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_history_cause_dictionary (
    cause_code character varying(1) NOT NULL,
    cause_name character varying(120) NOT NULL,
    other_cause_required boolean DEFAULT false NOT NULL,
    source_code character varying(60),
    source_name character varying(200),
    source_page character varying(100),
    dictionary_version character varying(60) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT chk_history_cause_dict_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT chk_history_cause_dict_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK ((((cause_code IS NULL) OR ((cause_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_text_nonblank CHECK (((cause_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_history_cause_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_history_cause_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_history_cause_dictionary IS '历史火灾起火原因字典表';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.cause_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.cause_code IS '起火原因代码
代码性质：当前1—4为项目顶层标识，细分原因另行保存。';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.cause_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.cause_name IS '起火原因名称';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.other_cause_required; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.other_cause_required IS '是否必须填写其他起火原因';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_history_cause_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_cause_dictionary.note IS '备注';


--
-- Name: wc_fire_history_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_history_event (
    fire_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    fire_date date,
    fire_time time without time zone,
    cause_code character varying(1),
    cause_name character varying(160),
    fire_level character varying(40),
    burned_area_ha numeric(16,4),
    forest_burned_area_ha numeric(16,4),
    tree_loss_m3 numeric(16,4),
    economic_loss_cny numeric(20,4),
    casualties_count numeric(12,2),
    longitude numeric(10,6),
    latitude numeric(9,6),
    report_no character varying(120),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(Point,4490),
    fire_name character varying(160),
    province_name character varying(80),
    city_name character varying(80),
    county_name character varying(80),
    town_name character varying(80),
    village_name character varying(80),
    admin_code character varying(20),
    forestry_bureau_name character varying(120),
    forest_farm_name character varying(120),
    small_place_name character varying(160),
    other_cause character varying(200),
    discovery_date date,
    discovery_time time without time zone,
    extinguish_date date,
    extinguish_time time without time zone,
    fire_level_code character varying(1),
    public_welfare_forest_burned_area_ha numeric(16,4),
    commercial_forest_burned_area_ha numeric(16,4),
    grassland_burned_area_ha numeric(16,4),
    total_stock_loss_m3 numeric(16,4),
    young_forest_damaged_tree_count integer,
    light_injury_count integer,
    serious_injury_count integer,
    death_count integer,
    firefighting_cost_cny numeric(20,4),
    forest_loss_value_cny numeric(20,4),
    other_loss_value_cny numeric(20,4),
    loss_currency character varying(3),
    loss_value_year integer,
    landform_type_code character varying(1),
    terrain_code character varying(20),
    elevation_m numeric(10,2),
    aspect_code character varying(20),
    slope_position_code character varying(20),
    slope_degree numeric(8,4),
    land_class_code character varying(20),
    forest_category_code character varying(20),
    age_group_code character varying(20),
    dominant_species_group character varying(160),
    stand_composition character varying(200),
    weather_condition character varying(120),
    temperature_c numeric(8,2),
    wind_force character varying(20),
    wind_direction character varying(20),
    precipitation_condition character varying(80),
    consecutive_clear_days integer,
    drought_condition character varying(80),
    fire_weather_grade character varying(20),
    professional_fire_team_person_count integer,
    army_person_count integer,
    armed_police_person_count integer,
    forest_police_person_count integer,
    public_participant_count integer,
    other_team_person_count integer,
    firefighting_labor_days numeric(12,2),
    manned_aircraft_flight_time_h numeric(12,2),
    manned_aircraft_cost_cny numeric(20,4),
    manned_aircraft_bucket_sorties integer,
    manned_aircraft_water_tons numeric(14,3),
    manned_aircraft_landing_sorties integer,
    manned_aircraft_landing_persons integer,
    unmanned_aircraft_flight_time_h numeric(12,2),
    unmanned_aircraft_sorties integer,
    command_vehicle_count integer,
    transport_vehicle_count integer,
    other_vehicle_count integer,
    radio_count integer,
    fire_engine_count integer,
    water_gun_count integer,
    other_equipment_count integer,
    terrain_source_method character varying(60),
    weather_source_method character varying(60),
    CONSTRAINT chk_history_event_coord_consistency CHECK ((((longitude IS NULL) AND (latitude IS NULL) AND (geom IS NULL)) OR ((longitude IS NOT NULL) AND (latitude IS NOT NULL) AND (geom IS NOT NULL) AND ((longitude >= ('-180'::integer)::numeric) AND (longitude <= (180)::numeric)) AND ((latitude >= ('-90'::integer)::numeric) AND (latitude <= (90)::numeric)) AND (abs((public.st_x(geom) - (longitude)::double precision)) <= (0.000001)::double precision) AND (abs((public.st_y(geom) - (latitude)::double precision)) <= (0.000001)::double precision)))),
    CONSTRAINT chk_history_event_nonnegative_values CHECK ((((burned_area_ha IS NULL) OR (burned_area_ha >= (0)::numeric)) AND ((forest_burned_area_ha IS NULL) OR (forest_burned_area_ha >= (0)::numeric)) AND ((public_welfare_forest_burned_area_ha IS NULL) OR (public_welfare_forest_burned_area_ha >= (0)::numeric)) AND ((commercial_forest_burned_area_ha IS NULL) OR (commercial_forest_burned_area_ha >= (0)::numeric)) AND ((grassland_burned_area_ha IS NULL) OR (grassland_burned_area_ha >= (0)::numeric)) AND ((tree_loss_m3 IS NULL) OR (tree_loss_m3 >= (0)::numeric)) AND ((total_stock_loss_m3 IS NULL) OR (total_stock_loss_m3 >= (0)::numeric)) AND ((economic_loss_cny IS NULL) OR (economic_loss_cny >= (0)::numeric)) AND ((firefighting_cost_cny IS NULL) OR (firefighting_cost_cny >= (0)::numeric)) AND ((forest_loss_value_cny IS NULL) OR (forest_loss_value_cny >= (0)::numeric)) AND ((other_loss_value_cny IS NULL) OR (other_loss_value_cny >= (0)::numeric))))
);


ALTER TABLE public.wc_fire_history_event OWNER TO postgres;

--
-- Name: TABLE wc_fire_history_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_history_event IS '历史火灾记录表';


--
-- Name: COLUMN wc_fire_history_event.fire_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_id IS '历史火灾编号';


--
-- Name: COLUMN wc_fire_history_event.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_history_event.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_history_event.fire_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_date IS '起火日期';


--
-- Name: COLUMN wc_fire_history_event.fire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_time IS '起火时间';


--
-- Name: COLUMN wc_fire_history_event.cause_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.cause_code IS '起火原因代码';


--
-- Name: COLUMN wc_fire_history_event.cause_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.cause_name IS '起火原因名称';


--
-- Name: COLUMN wc_fire_history_event.fire_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_level IS '火灾等级名称';


--
-- Name: COLUMN wc_fire_history_event.burned_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.burned_area_ha IS '火场总面积，公顷';


--
-- Name: COLUMN wc_fire_history_event.forest_burned_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forest_burned_area_ha IS '森林受害面积汇总，公顷';


--
-- Name: COLUMN wc_fire_history_event.tree_loss_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.tree_loss_m3 IS '成林受害蓄积量，立方米';


--
-- Name: COLUMN wc_fire_history_event.economic_loss_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.economic_loss_cny IS '经济损失汇总，元';


--
-- Name: COLUMN wc_fire_history_event.casualties_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.casualties_count IS '人员伤亡总数';


--
-- Name: COLUMN wc_fire_history_event.longitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.longitude IS '起火点经度';


--
-- Name: COLUMN wc_fire_history_event.latitude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.latitude IS '起火点纬度';


--
-- Name: COLUMN wc_fire_history_event.report_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.report_no IS '调查报告编号';


--
-- Name: COLUMN wc_fire_history_event.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_history_event.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_history_event.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_history_event.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_history_event.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.geom IS '起火点几何';


--
-- Name: COLUMN wc_fire_history_event.fire_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_name IS '火灾名称';


--
-- Name: COLUMN wc_fire_history_event.province_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.province_name IS '省名';


--
-- Name: COLUMN wc_fire_history_event.city_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.city_name IS '市或地区名';


--
-- Name: COLUMN wc_fire_history_event.county_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.county_name IS '县名';


--
-- Name: COLUMN wc_fire_history_event.town_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.town_name IS '乡镇名';


--
-- Name: COLUMN wc_fire_history_event.village_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.village_name IS '村名';


--
-- Name: COLUMN wc_fire_history_event.admin_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.admin_code IS '行政区代码';


--
-- Name: COLUMN wc_fire_history_event.forestry_bureau_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forestry_bureau_name IS '林业局或林场管理机构';


--
-- Name: COLUMN wc_fire_history_event.forest_farm_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forest_farm_name IS '林场或分场名称';


--
-- Name: COLUMN wc_fire_history_event.small_place_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.small_place_name IS '小地名';


--
-- Name: COLUMN wc_fire_history_event.other_cause; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.other_cause IS '其他起火原因说明';


--
-- Name: COLUMN wc_fire_history_event.discovery_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.discovery_date IS '发现日期';


--
-- Name: COLUMN wc_fire_history_event.discovery_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.discovery_time IS '发现时间';


--
-- Name: COLUMN wc_fire_history_event.extinguish_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.extinguish_date IS '扑灭日期';


--
-- Name: COLUMN wc_fire_history_event.extinguish_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.extinguish_time IS '扑灭时间';


--
-- Name: COLUMN wc_fire_history_event.fire_level_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_level_code IS '火灾等级代码';


--
-- Name: COLUMN wc_fire_history_event.public_welfare_forest_burned_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.public_welfare_forest_burned_area_ha IS '公益林受害面积，公顷';


--
-- Name: COLUMN wc_fire_history_event.commercial_forest_burned_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.commercial_forest_burned_area_ha IS '商品林受害面积，公顷';


--
-- Name: COLUMN wc_fire_history_event.grassland_burned_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.grassland_burned_area_ha IS '草原受害面积，公顷';


--
-- Name: COLUMN wc_fire_history_event.total_stock_loss_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.total_stock_loss_m3 IS '林木受害蓄积量总值，立方米';


--
-- Name: COLUMN wc_fire_history_event.young_forest_damaged_tree_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.young_forest_damaged_tree_count IS '幼林受害株数';


--
-- Name: COLUMN wc_fire_history_event.light_injury_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.light_injury_count IS '轻伤人数';


--
-- Name: COLUMN wc_fire_history_event.serious_injury_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.serious_injury_count IS '重伤人数';


--
-- Name: COLUMN wc_fire_history_event.death_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.death_count IS '死亡人数';


--
-- Name: COLUMN wc_fire_history_event.firefighting_cost_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.firefighting_cost_cny IS '扑火经费，元';


--
-- Name: COLUMN wc_fire_history_event.forest_loss_value_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forest_loss_value_cny IS '林木损失折款，元';


--
-- Name: COLUMN wc_fire_history_event.other_loss_value_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.other_loss_value_cny IS '其他损失折款，元';


--
-- Name: COLUMN wc_fire_history_event.loss_currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.loss_currency IS '损失金额币种';


--
-- Name: COLUMN wc_fire_history_event.loss_value_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.loss_value_year IS '损失价值年度';


--
-- Name: COLUMN wc_fire_history_event.landform_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.landform_type_code IS '火场地貌类型代码';


--
-- Name: COLUMN wc_fire_history_event.terrain_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.terrain_code IS '地貌代码';


--
-- Name: COLUMN wc_fire_history_event.elevation_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.elevation_m IS '海拔，米';


--
-- Name: COLUMN wc_fire_history_event.aspect_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.aspect_code IS '坡向代码';


--
-- Name: COLUMN wc_fire_history_event.slope_position_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.slope_position_code IS '坡位代码';


--
-- Name: COLUMN wc_fire_history_event.slope_degree; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.slope_degree IS '坡度';


--
-- Name: COLUMN wc_fire_history_event.land_class_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.land_class_code IS '地类代码';


--
-- Name: COLUMN wc_fire_history_event.forest_category_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forest_category_code IS '森林类别代码';


--
-- Name: COLUMN wc_fire_history_event.age_group_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.age_group_code IS '龄组代码';


--
-- Name: COLUMN wc_fire_history_event.dominant_species_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.dominant_species_group IS '优势树种或树种组';


--
-- Name: COLUMN wc_fire_history_event.stand_composition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.stand_composition IS '树种组成';


--
-- Name: COLUMN wc_fire_history_event.weather_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.weather_condition IS '天气状况';


--
-- Name: COLUMN wc_fire_history_event.temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.temperature_c IS '气温，摄氏度';


--
-- Name: COLUMN wc_fire_history_event.wind_force; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.wind_force IS '风力';


--
-- Name: COLUMN wc_fire_history_event.wind_direction; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.wind_direction IS '风向';


--
-- Name: COLUMN wc_fire_history_event.precipitation_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.precipitation_condition IS '降雨降雪情况';


--
-- Name: COLUMN wc_fire_history_event.consecutive_clear_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.consecutive_clear_days IS '前期连续晴天数';


--
-- Name: COLUMN wc_fire_history_event.drought_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.drought_condition IS '干旱情况';


--
-- Name: COLUMN wc_fire_history_event.fire_weather_grade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_weather_grade IS '火险气象等级';


--
-- Name: COLUMN wc_fire_history_event.professional_fire_team_person_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.professional_fire_team_person_count IS '专业消防队人数';


--
-- Name: COLUMN wc_fire_history_event.army_person_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.army_person_count IS '军队人数';


--
-- Name: COLUMN wc_fire_history_event.armed_police_person_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.armed_police_person_count IS '武警人数';


--
-- Name: COLUMN wc_fire_history_event.forest_police_person_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.forest_police_person_count IS '森警人数';


--
-- Name: COLUMN wc_fire_history_event.public_participant_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.public_participant_count IS '群众人数';


--
-- Name: COLUMN wc_fire_history_event.other_team_person_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.other_team_person_count IS '其他队伍人数';


--
-- Name: COLUMN wc_fire_history_event.firefighting_labor_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.firefighting_labor_days IS '扑火人工，工日';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_flight_time_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_flight_time_h IS '有人机飞行时间，小时';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_cost_cny; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_cost_cny IS '有人机飞行费用，元';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_bucket_sorties; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_bucket_sorties IS '有人机吊桶架次';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_water_tons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_water_tons IS '有人机洒水量，吨';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_landing_sorties; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_landing_sorties IS '有人机机降架次';


--
-- Name: COLUMN wc_fire_history_event.manned_aircraft_landing_persons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.manned_aircraft_landing_persons IS '有人机机降人次';


--
-- Name: COLUMN wc_fire_history_event.unmanned_aircraft_flight_time_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.unmanned_aircraft_flight_time_h IS '无人机飞行时间，小时';


--
-- Name: COLUMN wc_fire_history_event.unmanned_aircraft_sorties; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.unmanned_aircraft_sorties IS '无人机飞行架次';


--
-- Name: COLUMN wc_fire_history_event.command_vehicle_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.command_vehicle_count IS '指挥车数量';


--
-- Name: COLUMN wc_fire_history_event.transport_vehicle_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.transport_vehicle_count IS '运兵车数量';


--
-- Name: COLUMN wc_fire_history_event.other_vehicle_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.other_vehicle_count IS '其他车辆数量';


--
-- Name: COLUMN wc_fire_history_event.radio_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.radio_count IS '携带电台数量';


--
-- Name: COLUMN wc_fire_history_event.fire_engine_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.fire_engine_count IS '灭火机数量';


--
-- Name: COLUMN wc_fire_history_event.water_gun_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.water_gun_count IS '水枪数量';


--
-- Name: COLUMN wc_fire_history_event.other_equipment_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.other_equipment_count IS '其他机具数量';


--
-- Name: COLUMN wc_fire_history_event.terrain_source_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.terrain_source_method IS '地形字段来源方法';


--
-- Name: COLUMN wc_fire_history_event.weather_source_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_event.weather_source_method IS '天气字段来源方法';


--
-- Name: wc_fire_history_level_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_history_level_dictionary (
    level_code character varying(1) NOT NULL,
    level_name character varying(80) NOT NULL,
    source_code character varying(60),
    source_name character varying(200),
    source_page character varying(100),
    dictionary_version character varying(60) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT chk_history_level_dict_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT chk_history_level_dict_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK ((((level_code IS NULL) OR ((level_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_text_nonblank CHECK (((level_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_history_level_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_history_level_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_history_level_dictionary IS '历史火灾等级字典表';


--
-- Name: COLUMN wc_fire_history_level_dictionary.level_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.level_code IS '历史火灾等级代码';


--
-- Name: COLUMN wc_fire_history_level_dictionary.level_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.level_name IS '历史火灾等级名称';


--
-- Name: COLUMN wc_fire_history_level_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_history_level_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_history_level_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_history_level_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_history_level_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_fire_history_level_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_history_level_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_history_level_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_history_level_dictionary.note IS '备注';


--
-- Name: wc_fire_output_catalog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_output_catalog (
    output_code character varying(50) NOT NULL,
    output_name character varying(200) NOT NULL,
    output_group character varying(40) NOT NULL,
    geometry_type character varying(20) NOT NULL,
    index_or_grade character varying(10) NOT NULL,
    official_scope_note text,
    enabled boolean DEFAULT true NOT NULL,
    allowed_unit_types jsonb,
    content_contract_json jsonb,
    CONSTRAINT ck_r15_catalog_contract CHECK ((((allowed_unit_types IS NULL) OR (jsonb_typeof(allowed_unit_types) = 'array'::text)) AND ((content_contract_json IS NULL) OR (jsonb_typeof(content_contract_json) = 'object'::text)))),
    CONSTRAINT ck_r15_identity_text CHECK (((output_code IS NULL) OR ((output_code)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT wc_fire_output_catalog_geometry_type_check CHECK (((geometry_type)::text = ANY ((ARRAY['POINT'::character varying, 'POLYGON'::character varying, 'MULTIPOLYGON'::character varying, 'MIXED'::character varying])::text[]))),
    CONSTRAINT wc_fire_output_catalog_index_or_grade_check CHECK (((index_or_grade)::text = ANY ((ARRAY['INDEX'::character varying, 'GRADE'::character varying, 'OBJECT'::character varying, 'ZONE'::character varying])::text[]))),
    CONSTRAINT wc_fire_output_catalog_output_group_check CHECK (((output_group)::text = ANY ((ARRAY['HAZARD'::character varying, 'KEY_HAZARD'::character varying, 'RISK'::character varying, 'PREVENTION_ZONING'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_output_catalog OWNER TO postgres;

--
-- Name: TABLE wc_fire_output_catalog; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_output_catalog IS '成果目录表';


--
-- Name: COLUMN wc_fire_output_catalog.output_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.output_code IS '成果代码';


--
-- Name: COLUMN wc_fire_output_catalog.output_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.output_name IS '成果名称';


--
-- Name: COLUMN wc_fire_output_catalog.output_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.output_group IS '成果组别';


--
-- Name: COLUMN wc_fire_output_catalog.geometry_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.geometry_type IS '成果几何类型';


--
-- Name: COLUMN wc_fire_output_catalog.index_or_grade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.index_or_grade IS '成果形式';


--
-- Name: COLUMN wc_fire_output_catalog.official_scope_note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.official_scope_note IS '成果业务范围说明';


--
-- Name: COLUMN wc_fire_output_catalog.enabled; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.enabled IS '目录启用标志';


--
-- Name: COLUMN wc_fire_output_catalog.allowed_unit_types; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.allowed_unit_types IS '允许使用的空间单元类型';


--
-- Name: COLUMN wc_fire_output_catalog.content_contract_json; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_catalog.content_contract_json IS '成果内容与输入数据要求';


--
-- Name: wc_fire_output_input; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_output_input (
    mapping_id bigint NOT NULL,
    output_code character varying(50) NOT NULL,
    package_code character varying(60) NOT NULL,
    indicator_code character varying(60),
    upstream_output_code character varying(50),
    required_flag boolean DEFAULT true NOT NULL,
    note text,
    CONSTRAINT ck_r15_identity_text CHECK ((((output_code IS NULL) OR ((output_code)::text ~ '[^[:space:]]'::text)) AND ((package_code IS NULL) OR ((package_code)::text ~ '[^[:space:]]'::text)) AND ((indicator_code IS NULL) OR ((indicator_code)::text ~ '[^[:space:]]'::text)) AND ((upstream_output_code IS NULL) OR ((upstream_output_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_no_self_dependency CHECK (((upstream_output_code IS NULL) OR ((upstream_output_code)::text <> (output_code)::text)))
);


ALTER TABLE public.wc_fire_output_input OWNER TO postgres;

--
-- Name: TABLE wc_fire_output_input; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_output_input IS '成果输入依赖表';


--
-- Name: COLUMN wc_fire_output_input.mapping_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.mapping_id IS '成果依赖记录编号';


--
-- Name: COLUMN wc_fire_output_input.output_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.output_code IS '成果代码';


--
-- Name: COLUMN wc_fire_output_input.package_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.package_code IS '数据包代码';


--
-- Name: COLUMN wc_fire_output_input.indicator_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.indicator_code IS '指标代码';


--
-- Name: COLUMN wc_fire_output_input.upstream_output_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.upstream_output_code IS '上游成果代码';


--
-- Name: COLUMN wc_fire_output_input.required_flag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.required_flag IS '必需依赖标志';


--
-- Name: COLUMN wc_fire_output_input.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_output_input.note IS '备注';


--
-- Name: wc_fire_output_input_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wc_fire_output_input_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wc_fire_output_input_mapping_id_seq OWNER TO postgres;

--
-- Name: wc_fire_output_input_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wc_fire_output_input_mapping_id_seq OWNED BY public.wc_fire_output_input.mapping_id;


--
-- Name: wc_fire_population_grid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_population_grid (
    record_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    grid_code character varying(80),
    stat_year smallint,
    total_population numeric(16,4),
    no_civil_capacity_population numeric(16,4),
    limited_civil_capacity_population numeric(16,4),
    elderly_population numeric(16,4),
    children_population numeric(16,4),
    population_density_per_ha numeric(16,6),
    evacuation_population numeric(16,4),
    spatialization_method character varying(200),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(Polygon,4490),
    CONSTRAINT ck_r15_finite CHECK ((((total_population IS NULL) OR (total_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((no_civil_capacity_population IS NULL) OR (no_civil_capacity_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((limited_civil_capacity_population IS NULL) OR (limited_civil_capacity_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((elderly_population IS NULL) OR (elderly_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((children_population IS NULL) OR (children_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((population_density_per_ha IS NULL) OR (population_density_per_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((evacuation_population IS NULL) OR (evacuation_population <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((record_id IS NULL) OR ((record_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((grid_code IS NULL) OR ((grid_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_nonnegative CHECK ((((total_population IS NULL) OR (total_population >= (0)::numeric)) AND ((no_civil_capacity_population IS NULL) OR (no_civil_capacity_population >= (0)::numeric)) AND ((limited_civil_capacity_population IS NULL) OR (limited_civil_capacity_population >= (0)::numeric)) AND ((elderly_population IS NULL) OR (elderly_population >= (0)::numeric)) AND ((children_population IS NULL) OR (children_population >= (0)::numeric)) AND ((population_density_per_ha IS NULL) OR (population_density_per_ha >= (0)::numeric)) AND ((evacuation_population IS NULL) OR (evacuation_population >= (0)::numeric)))),
    CONSTRAINT ck_r15_stat_year CHECK (((stat_year IS NULL) OR (stat_year > 0))),
    CONSTRAINT ck_r15_subpopulation CHECK (((total_population IS NULL) OR (((no_civil_capacity_population IS NULL) OR (no_civil_capacity_population <= total_population)) AND ((limited_civil_capacity_population IS NULL) OR (limited_civil_capacity_population <= total_population)) AND ((elderly_population IS NULL) OR (elderly_population <= total_population)) AND ((children_population IS NULL) OR (children_population <= total_population))))),
    CONSTRAINT ck_r20_batch_nonblank CHECK (((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)))
);


ALTER TABLE public.wc_fire_population_grid OWNER TO postgres;

--
-- Name: TABLE wc_fire_population_grid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_population_grid IS '人口格网表';


--
-- Name: COLUMN wc_fire_population_grid.record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.record_id IS '人口格网记录编号';


--
-- Name: COLUMN wc_fire_population_grid.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_population_grid.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.unit_id IS '标准空间单元编号';


--
-- Name: COLUMN wc_fire_population_grid.grid_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.grid_code IS '格网代码';


--
-- Name: COLUMN wc_fire_population_grid.stat_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.stat_year IS '统计年份';


--
-- Name: COLUMN wc_fire_population_grid.total_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.total_population IS '人口总量（人）';


--
-- Name: COLUMN wc_fire_population_grid.no_civil_capacity_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.no_civil_capacity_population IS '无民事行为能力人口（人）';


--
-- Name: COLUMN wc_fire_population_grid.limited_civil_capacity_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.limited_civil_capacity_population IS '限制民事行为能力人口（人）';


--
-- Name: COLUMN wc_fire_population_grid.elderly_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.elderly_population IS '老年人口（人）
待核事项：年龄界限以来源统计口径为准。';


--
-- Name: COLUMN wc_fire_population_grid.children_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.children_population IS '儿童人口（人）
待核事项：年龄界限以来源统计口径为准。';


--
-- Name: COLUMN wc_fire_population_grid.population_density_per_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.population_density_per_ha IS '人口密度（人/公顷）
P-04口径：林区及林缘100米人口除以同乡镇林地面积。';


--
-- Name: COLUMN wc_fire_population_grid.evacuation_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.evacuation_population IS '需疏散人口（人）';


--
-- Name: COLUMN wc_fire_population_grid.spatialization_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.spatialization_method IS '空间化处理方法';


--
-- Name: COLUMN wc_fire_population_grid.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_population_grid.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_population_grid.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_population_grid.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_population_grid.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_population_grid.geom IS '人口格网几何';


--
-- Name: wc_fire_quality_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_quality_dictionary (
    quality_code character varying(30) NOT NULL,
    quality_name character varying(120) NOT NULL,
    quality_description text,
    source_code character varying(60),
    source_name character varying(200),
    source_page character varying(100),
    dictionary_version character varying(60) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT chk_fire_quality_dict_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT chk_fire_quality_dict_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK ((((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_text_nonblank CHECK (((quality_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_quality_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_quality_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_quality_dictionary IS '数据质量字典表';


--
-- Name: COLUMN wc_fire_quality_dictionary.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_quality_dictionary.quality_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.quality_name IS '数据质量状态名称';


--
-- Name: COLUMN wc_fire_quality_dictionary.quality_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.quality_description IS '数据质量状态说明';


--
-- Name: COLUMN wc_fire_quality_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_quality_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_quality_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_quality_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_quality_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_fire_quality_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_quality_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_quality_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_quality_dictionary.note IS '备注';


--
-- Name: wc_fire_source_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_source_point (
    source_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80) NOT NULL,
    source_type_code character varying(1) NOT NULL,
    source_type_name character varying(120),
    source_name character varying(100),
    address character varying(100),
    lon numeric(10,6) NOT NULL,
    lat numeric(9,6) NOT NULL,
    quantity character varying(120),
    use_area_mu numeric(18,2),
    activity_period character varying(120),
    management_measure character varying(500),
    control_status character varying(40),
    forest_distance_m numeric(14,3),
    cemetery_count integer,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    survey_date date,
    quality_code character varying(30),
    geom public.geometry(Point,4490) NOT NULL,
    photo_urls text,
    responsible_person character varying(64),
    contact_phone character varying(32),
    CONSTRAINT chk_fire_source_point_cemetery_count_nonnegative CHECK (((cemetery_count IS NULL) OR (cemetery_count >= 0))),
    CONSTRAINT chk_fire_source_point_coord_consistency CHECK (((abs((public.st_x(geom) - (lon)::double precision)) <= (0.000001)::double precision) AND (abs((public.st_y(geom) - (lat)::double precision)) <= (0.000001)::double precision))),
    CONSTRAINT chk_fire_source_point_distance_nonnegative CHECK (((forest_distance_m IS NULL) OR (forest_distance_m >= (0)::numeric))),
    CONSTRAINT chk_fire_source_point_lat_range CHECK (((lat >= ('-90'::integer)::numeric) AND (lat <= (90)::numeric))),
    CONSTRAINT chk_fire_source_point_lon_range CHECK (((lon >= ('-180'::integer)::numeric) AND (lon <= (180)::numeric))),
    CONSTRAINT chk_fire_source_point_quantity_text CHECK ((length(btrim((quantity)::text)) > 0)),
    CONSTRAINT chk_fire_source_point_use_area_nonnegative CHECK (((use_area_mu IS NULL) OR (use_area_mu >= (0)::numeric)))
);


ALTER TABLE public.wc_fire_source_point OWNER TO postgres;

--
-- Name: TABLE wc_fire_source_point; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_source_point IS '火源点表';


--
-- Name: COLUMN wc_fire_source_point.source_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_id IS '火源点记录编号';


--
-- Name: COLUMN wc_fire_source_point.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_source_point.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_source_point.source_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_type_code IS '火源类型代码';


--
-- Name: COLUMN wc_fire_source_point.source_type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_type_name IS '火源类型名称';


--
-- Name: COLUMN wc_fire_source_point.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_name IS '火源点名称';


--
-- Name: COLUMN wc_fire_source_point.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.address IS '火源点地址';


--
-- Name: COLUMN wc_fire_source_point.lon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.lon IS '经度';


--
-- Name: COLUMN wc_fire_source_point.lat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.lat IS '纬度';


--
-- Name: COLUMN wc_fire_source_point.quantity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.quantity IS '火源点原始数量表达';


--
-- Name: COLUMN wc_fire_source_point.use_area_mu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.use_area_mu IS '用火面积，亩';


--
-- Name: COLUMN wc_fire_source_point.activity_period; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.activity_period IS '活动高发时段';


--
-- Name: COLUMN wc_fire_source_point.management_measure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.management_measure IS '管控措施';


--
-- Name: COLUMN wc_fire_source_point.control_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.control_status IS '管控状态';


--
-- Name: COLUMN wc_fire_source_point.forest_distance_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.forest_distance_m IS '距森林边界距离，米';


--
-- Name: COLUMN wc_fire_source_point.cemetery_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.cemetery_count IS '坟墓数量';


--
-- Name: COLUMN wc_fire_source_point.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_source_point.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_source_point.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_source_point.survey_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.survey_date IS '调查日期';


--
-- Name: COLUMN wc_fire_source_point.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_source_point.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.geom IS '火源位置点';


--
-- Name: COLUMN wc_fire_source_point.photo_urls; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.photo_urls IS '现场照片路径或URL列表';


--
-- Name: COLUMN wc_fire_source_point.responsible_person; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.responsible_person IS '防火责任人';


--
-- Name: COLUMN wc_fire_source_point.contact_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_point.contact_phone IS '责任人联系电话';


--
-- Name: wc_fire_source_type_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_source_type_dictionary (
    standard_code character varying(1) NOT NULL,
    type_name character varying(120) NOT NULL,
    source_code character varying(60),
    source_name character varying(200),
    source_page character varying(100),
    dictionary_version character varying(60) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT chk_fire_source_type_dict_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT chk_fire_source_type_dict_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK ((((standard_code IS NULL) OR ((standard_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_text_nonblank CHECK (((type_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_source_type_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_source_type_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_source_type_dictionary IS '火源类型字典表';


--
-- Name: COLUMN wc_fire_source_type_dictionary.standard_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.standard_code IS '火源类型代码
代码性质：当前A/B/C/D/X为项目标识。';


--
-- Name: COLUMN wc_fire_source_type_dictionary.type_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.type_name IS '火源类型名称';


--
-- Name: COLUMN wc_fire_source_type_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_source_type_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_source_type_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_source_type_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_source_type_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_fire_source_type_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_source_type_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_source_type_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_source_type_dictionary.note IS '备注';


--
-- Name: wc_fire_task_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_task_source (
    task_id character varying(60) NOT NULL,
    source_code character varying(60) NOT NULL,
    request_code character varying(60),
    source_batch character varying(200) NOT NULL,
    received_at timestamp without time zone,
    source_file text,
    metadata_file text,
    quality_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    note text,
    metadata_json jsonb,
    CONSTRAINT ck_r15_identity_text CHECK ((((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((request_code IS NULL) OR ((request_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_batch_nonblank CHECK (((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text))),
    CONSTRAINT wc_fire_task_source_metadata_object_check CHECK (((metadata_json IS NULL) OR (jsonb_typeof(metadata_json) = 'object'::text))),
    CONSTRAINT wc_fire_task_source_quality_status_check CHECK (((quality_status)::text = ANY ((ARRAY['PENDING'::character varying, 'PASSED'::character varying, 'FAILED'::character varying, 'PARTIAL'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_task_source OWNER TO postgres;

--
-- Name: TABLE wc_fire_task_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_task_source IS '任务来源批次表';


--
-- Name: COLUMN wc_fire_task_source.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_task_source.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_task_source.request_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.request_code IS '历史资料申请编号';


--
-- Name: COLUMN wc_fire_task_source.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_task_source.received_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.received_at IS '资料接收时间';


--
-- Name: COLUMN wc_fire_task_source.source_file; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.source_file IS '来源文件位置';


--
-- Name: COLUMN wc_fire_task_source.metadata_file; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.metadata_file IS '元数据文件位置';


--
-- Name: COLUMN wc_fire_task_source.quality_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.quality_status IS '批次质检状态';


--
-- Name: COLUMN wc_fire_task_source.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.note IS '备注';


--
-- Name: COLUMN wc_fire_task_source.metadata_json; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_task_source.metadata_json IS '接收和质检元数据';


--
-- Name: wc_fire_use_category_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_use_category_dictionary (
    event_type character varying(30) NOT NULL,
    category_code character varying(2) NOT NULL,
    category_name character varying(120) NOT NULL,
    source_code character varying(60),
    source_name character varying(200),
    source_page character varying(100),
    dictionary_version character varying(60) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT chk_fire_use_category_dict_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT chk_fire_use_category_dict_event_type CHECK (((event_type)::text = ANY ((ARRAY['APPROVED'::character varying, 'ILLEGAL'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT chk_fire_use_category_dict_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying])::text[]))),
    CONSTRAINT ck_r15_identity_text CHECK ((((category_code IS NULL) OR ((category_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r20_text_nonblank CHECK (((category_name)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_fire_use_category_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_fire_use_category_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_use_category_dictionary IS '野外用火类别字典表';


--
-- Name: COLUMN wc_fire_use_category_dictionary.event_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.event_type IS '用火事件类型';


--
-- Name: COLUMN wc_fire_use_category_dictionary.category_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.category_code IS '用火类别代码
代码性质：当前编号为项目标识，须结合事件类型使用。';


--
-- Name: COLUMN wc_fire_use_category_dictionary.category_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.category_name IS '用火类别名称';


--
-- Name: COLUMN wc_fire_use_category_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_use_category_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_fire_use_category_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_fire_use_category_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_fire_use_category_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_fire_use_category_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_fire_use_category_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_fire_use_category_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_category_dictionary.note IS '备注';


--
-- Name: wc_fire_use_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_use_event (
    event_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    event_type character varying(30) NOT NULL,
    use_category character varying(80),
    event_time timestamp without time zone,
    location_name character varying(300),
    lon numeric(10,6),
    lat numeric(9,6),
    forest_related boolean,
    handling_result character varying(300),
    case_no character varying(100),
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    geom public.geometry(Point,4490),
    use_area_mu numeric(18,2),
    use_category_code character varying(2),
    CONSTRAINT chk_fire_use_event_coord_consistency CHECK (((lon IS NOT NULL) AND (lat IS NOT NULL) AND (geom IS NOT NULL) AND (NOT public.st_isempty(geom)) AND ((lon >= ('-180'::integer)::numeric) AND (lon <= (180)::numeric)) AND ((lat >= ('-90'::integer)::numeric) AND (lat <= (90)::numeric)) AND (abs((public.st_x(geom) - (lon)::double precision)) <= (0.000001)::double precision) AND (abs((public.st_y(geom) - (lat)::double precision)) <= (0.000001)::double precision))),
    CONSTRAINT chk_fire_use_event_use_area_nonnegative CHECK (((use_area_mu IS NULL) OR (use_area_mu >= (0)::numeric))),
    CONSTRAINT wc_fire_use_event_event_type_check CHECK (((event_type)::text = ANY ((ARRAY['APPROVED'::character varying, 'ILLEGAL'::character varying, 'OTHER'::character varying])::text[])))
);


ALTER TABLE public.wc_fire_use_event OWNER TO postgres;

--
-- Name: TABLE wc_fire_use_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_use_event IS '野外用火事件表';


--
-- Name: COLUMN wc_fire_use_event.event_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.event_id IS '用火事件编号';


--
-- Name: COLUMN wc_fire_use_event.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_use_event.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.unit_id IS '空间单元编号';


--
-- Name: COLUMN wc_fire_use_event.event_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.event_type IS '用火事件类型';


--
-- Name: COLUMN wc_fire_use_event.use_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.use_category IS '用火类别名称';


--
-- Name: COLUMN wc_fire_use_event.event_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.event_time IS '用火发生时间';


--
-- Name: COLUMN wc_fire_use_event.location_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.location_name IS '用火地点';


--
-- Name: COLUMN wc_fire_use_event.lon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.lon IS '经度';


--
-- Name: COLUMN wc_fire_use_event.lat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.lat IS '纬度';


--
-- Name: COLUMN wc_fire_use_event.forest_related; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.forest_related IS '是否涉及森林';


--
-- Name: COLUMN wc_fire_use_event.handling_result; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.handling_result IS '处理结果';


--
-- Name: COLUMN wc_fire_use_event.case_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.case_no IS '案件或审批编号';


--
-- Name: COLUMN wc_fire_use_event.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_use_event.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_use_event.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_use_event.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.geom IS '用火事件位置点';


--
-- Name: COLUMN wc_fire_use_event.use_area_mu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.use_area_mu IS '用火面积，亩';


--
-- Name: COLUMN wc_fire_use_event.use_category_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_use_event.use_category_code IS '用火类别代码';


--
-- Name: wc_fire_weather_month; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_fire_weather_month (
    weather_id character varying(100) NOT NULL,
    task_id character varying(60) NOT NULL,
    weather_unit_id character varying(100) NOT NULL,
    stat_year smallint NOT NULL,
    stat_month smallint NOT NULL,
    station_id character varying(40),
    station_name character varying(120),
    lon numeric(10,6),
    lat numeric(9,6),
    avg_temperature_c numeric(8,3),
    max_temperature_c numeric(8,3),
    min_relative_humidity_pct numeric(8,3),
    total_precipitation_mm numeric(10,3),
    avg_wind_speed_m_s numeric(8,3),
    gale_days numeric(8,3),
    wind_direction_code character varying(20),
    observation_count integer,
    quality_code character varying(30) NOT NULL,
    missing_code character varying(30),
    interpolation_method character varying(120),
    source_code character varying(60) NOT NULL,
    source_record_id character varying(120) NOT NULL,
    source_batch character varying(200) NOT NULL,
    geom public.geometry(Point,4490),
    weather_unit_type character varying(20) NOT NULL,
    stat_method_version character varying(80),
    gale_threshold_rule character varying(200),
    precipitation_stat_method character varying(160),
    CONSTRAINT chk_fire_weather_month_coord_consistency CHECK ((((lon IS NULL) AND (lat IS NULL) AND (geom IS NULL)) OR ((lon IS NOT NULL) AND (lat IS NOT NULL) AND (geom IS NOT NULL) AND (abs((public.st_x(geom) - (lon)::double precision)) <= (0.000001)::double precision) AND (abs((public.st_y(geom) - (lat)::double precision)) <= (0.000001)::double precision)))),
    CONSTRAINT chk_fire_weather_month_lat_range CHECK (((lat IS NULL) OR ((lat >= ('-90'::integer)::numeric) AND (lat <= (90)::numeric)))),
    CONSTRAINT chk_fire_weather_month_lon_range CHECK (((lon IS NULL) OR ((lon >= ('-180'::integer)::numeric) AND (lon <= (180)::numeric)))),
    CONSTRAINT chk_fire_weather_month_metric_ranges CHECK ((((avg_temperature_c IS NULL) OR ((avg_temperature_c >= ('-100'::integer)::numeric) AND (avg_temperature_c <= (100)::numeric))) AND ((max_temperature_c IS NULL) OR ((max_temperature_c >= ('-100'::integer)::numeric) AND (max_temperature_c <= (100)::numeric))) AND ((min_relative_humidity_pct IS NULL) OR ((min_relative_humidity_pct >= (0)::numeric) AND (min_relative_humidity_pct <= (100)::numeric))) AND ((total_precipitation_mm IS NULL) OR (total_precipitation_mm >= (0)::numeric)) AND ((avg_wind_speed_m_s IS NULL) OR (avg_wind_speed_m_s >= (0)::numeric)) AND ((gale_days IS NULL) OR (gale_days >= (0)::numeric)) AND ((observation_count IS NULL) OR (observation_count >= 0)))),
    CONSTRAINT chk_fire_weather_month_unit_geometry CHECK (((((weather_unit_type)::text = 'STATION'::text) AND (station_id IS NOT NULL) AND (lon IS NOT NULL) AND (lat IS NOT NULL) AND (geom IS NOT NULL)) OR (((weather_unit_type)::text = 'GRID'::text) AND (weather_unit_id IS NOT NULL) AND (geom IS NOT NULL)) OR (((weather_unit_type)::text = 'OTHER'::text) AND (weather_unit_id IS NOT NULL)))),
    CONSTRAINT chk_fire_weather_month_unit_type CHECK (((weather_unit_type)::text = ANY ((ARRAY['STATION'::character varying, 'GRID'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT chk_fire_weather_month_year CHECK ((stat_year >= 1900)),
    CONSTRAINT wc_fire_weather_month_stat_month_check CHECK (((stat_month >= 1) AND (stat_month <= 12)))
);


ALTER TABLE public.wc_fire_weather_month OWNER TO postgres;

--
-- Name: TABLE wc_fire_weather_month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_fire_weather_month IS '月度气象表';


--
-- Name: COLUMN wc_fire_weather_month.weather_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.weather_id IS '月度气象记录编号';


--
-- Name: COLUMN wc_fire_weather_month.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_fire_weather_month.weather_unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.weather_unit_id IS '气象统计单元编号';


--
-- Name: COLUMN wc_fire_weather_month.stat_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.stat_year IS '统计年份';


--
-- Name: COLUMN wc_fire_weather_month.stat_month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.stat_month IS '统计月份';


--
-- Name: COLUMN wc_fire_weather_month.station_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.station_id IS '气象站编号';


--
-- Name: COLUMN wc_fire_weather_month.station_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.station_name IS '气象站名称';


--
-- Name: COLUMN wc_fire_weather_month.lon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.lon IS '气象单元经度';


--
-- Name: COLUMN wc_fire_weather_month.lat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.lat IS '气象单元纬度';


--
-- Name: COLUMN wc_fire_weather_month.avg_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.avg_temperature_c IS '月平均气温，℃';


--
-- Name: COLUMN wc_fire_weather_month.max_temperature_c; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.max_temperature_c IS '月最高气温，℃';


--
-- Name: COLUMN wc_fire_weather_month.min_relative_humidity_pct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.min_relative_humidity_pct IS '月最小相对湿度，%';


--
-- Name: COLUMN wc_fire_weather_month.total_precipitation_mm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.total_precipitation_mm IS '月降水量，mm';


--
-- Name: COLUMN wc_fire_weather_month.avg_wind_speed_m_s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.avg_wind_speed_m_s IS '月平均风速，m/s';


--
-- Name: COLUMN wc_fire_weather_month.gale_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.gale_days IS '月大风日数，天';


--
-- Name: COLUMN wc_fire_weather_month.wind_direction_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.wind_direction_code IS '风向代码';


--
-- Name: COLUMN wc_fire_weather_month.observation_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.observation_count IS '有效观测次数';


--
-- Name: COLUMN wc_fire_weather_month.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_fire_weather_month.missing_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.missing_code IS '缺测代码';


--
-- Name: COLUMN wc_fire_weather_month.interpolation_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.interpolation_method IS '空间插值方法';


--
-- Name: COLUMN wc_fire_weather_month.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_fire_weather_month.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_fire_weather_month.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.source_batch IS '来源批次';


--
-- Name: COLUMN wc_fire_weather_month.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.geom IS '气象站或格网代表点几何';


--
-- Name: COLUMN wc_fire_weather_month.weather_unit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.weather_unit_type IS '气象统计单元类型';


--
-- Name: COLUMN wc_fire_weather_month.stat_method_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.stat_method_version IS '月度统计方法版本';


--
-- Name: COLUMN wc_fire_weather_month.gale_threshold_rule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.gale_threshold_rule IS '大风日数阈值和规则';


--
-- Name: COLUMN wc_fire_weather_month.precipitation_stat_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_fire_weather_month.precipitation_stat_method IS '降水统计方法';


--
-- Name: wc_forest_compartment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_forest_compartment (
    bsm character varying(18) NOT NULL,
    tuban_h character varying(6),
    ed_di_lei character varying(4),
    xbmj numeric(12,4) CONSTRAINT wc_forest_compartment_mian_ji_not_null NOT NULL,
    you_shi_sz character varying(6),
    po_du smallint,
    po_xiang character(1),
    po_wei character(1),
    geom public.geometry(MultiPolygon,4490),
    source_batch character varying(100),
    task_id character varying(60),
    unit_id character varying(80),
    source_code character varying(60),
    source_record_id character varying(120),
    CONSTRAINT ck_r15_area CHECK ((xbmj >= (0)::numeric)),
    CONSTRAINT ck_r15_finite CHECK (((xbmj IS NULL) OR (xbmj <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric])))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_mapping_task CHECK (((unit_id IS NULL) OR (task_id IS NOT NULL))),
    CONSTRAINT ck_r15_source_identity CHECK ((((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text))))
);


ALTER TABLE public.wc_forest_compartment OWNER TO postgres;

--
-- Name: TABLE wc_forest_compartment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_forest_compartment IS '原始森林小班表';


--
-- Name: COLUMN wc_forest_compartment.bsm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.bsm IS '原小班标识';


--
-- Name: COLUMN wc_forest_compartment.tuban_h; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.tuban_h IS '原图斑编号';


--
-- Name: COLUMN wc_forest_compartment.ed_di_lei; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.ed_di_lei IS '原始地类值';


--
-- Name: COLUMN wc_forest_compartment.xbmj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.xbmj IS '小班面积，单位公顷（hm²）';


--
-- Name: COLUMN wc_forest_compartment.you_shi_sz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.you_shi_sz IS '原优势树种或组值';


--
-- Name: COLUMN wc_forest_compartment.po_du; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.po_du IS '原坡度分类值';


--
-- Name: COLUMN wc_forest_compartment.po_xiang; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.po_xiang IS '原坡向分类值';


--
-- Name: COLUMN wc_forest_compartment.po_wei; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.po_wei IS '原坡位分类值';


--
-- Name: COLUMN wc_forest_compartment.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.geom IS '森林小班几何';


--
-- Name: COLUMN wc_forest_compartment.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.source_batch IS '来源批次';


--
-- Name: COLUMN wc_forest_compartment.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_forest_compartment.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.unit_id IS '标准空间单元编号';


--
-- Name: COLUMN wc_forest_compartment.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_forest_compartment.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_compartment.source_record_id IS '原始记录编号';


--
-- Name: wc_forest_resource_survey_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_forest_resource_survey_raw (
    survey_id character varying(80) NOT NULL,
    task_id character varying(60) NOT NULL,
    unit_id character varying(80),
    plot_id character varying(80),
    forest_type_code character varying(60),
    dominant_species_code character varying(60),
    origin_type character varying(30),
    age_years numeric(6,1),
    age_group character varying(30),
    canopy_density numeric(5,4),
    forest_area_ha numeric(18,4),
    tree_count numeric(18,4),
    dbh_cm numeric(10,2),
    tree_height_m numeric(10,2),
    stock_volume_m3 numeric(18,4),
    survey_year smallint,
    source_code character varying(60),
    source_record_id character varying(120),
    source_batch character varying(200),
    quality_code character varying(30),
    geom public.geometry(MultiPolygon,4490),
    note text,
    species_detail_id character varying(80),
    CONSTRAINT ck_r15_finite CHECK ((((age_years IS NULL) OR (age_years <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((canopy_density IS NULL) OR (canopy_density <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((forest_area_ha IS NULL) OR (forest_area_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((tree_count IS NULL) OR (tree_count <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((dbh_cm IS NULL) OR (dbh_cm <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((tree_height_m IS NULL) OR (tree_height_m <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))) AND ((stock_volume_m3 IS NULL) OR (stock_volume_m3 <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_r15_geometry CHECK (((geom IS NULL) OR ((NOT public.st_isempty(geom)) AND public.st_isvalid(geom) AND (public.st_srid(geom) = 4490)))),
    CONSTRAINT ck_r15_identity_text CHECK ((((survey_id IS NULL) OR ((survey_id)::text ~ '[^[:space:]]'::text)) AND ((task_id IS NULL) OR ((task_id)::text ~ '[^[:space:]]'::text)) AND ((unit_id IS NULL) OR ((unit_id)::text ~ '[^[:space:]]'::text)) AND ((plot_id IS NULL) OR ((plot_id)::text ~ '[^[:space:]]'::text)) AND ((forest_type_code IS NULL) OR ((forest_type_code)::text ~ '[^[:space:]]'::text)) AND ((dominant_species_code IS NULL) OR ((dominant_species_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_r15_measurements CHECK ((((age_years IS NULL) OR (age_years >= (0)::numeric)) AND ((dbh_cm IS NULL) OR (dbh_cm >= (0)::numeric)) AND ((tree_height_m IS NULL) OR (tree_height_m >= (0)::numeric)))),
    CONSTRAINT ck_survey_raw_detail_catalog CHECK (((species_detail_id IS NULL) OR (dominant_species_code IS NOT NULL))),
    CONSTRAINT wc_forest_resource_survey_raw_area_ck CHECK (((forest_area_ha IS NULL) OR (forest_area_ha >= (0)::numeric))),
    CONSTRAINT wc_forest_resource_survey_raw_canopy_ck CHECK (((canopy_density IS NULL) OR ((canopy_density >= (0)::numeric) AND (canopy_density <= (1)::numeric)))),
    CONSTRAINT wc_forest_resource_survey_raw_count_ck CHECK (((tree_count IS NULL) OR (tree_count >= (0)::numeric))),
    CONSTRAINT wc_forest_resource_survey_raw_stock_ck CHECK (((stock_volume_m3 IS NULL) OR (stock_volume_m3 >= (0)::numeric)))
);


ALTER TABLE public.wc_forest_resource_survey_raw OWNER TO postgres;

--
-- Name: TABLE wc_forest_resource_survey_raw; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_forest_resource_survey_raw IS '森林资源调查原始表';


--
-- Name: COLUMN wc_forest_resource_survey_raw.survey_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.survey_id IS '森林调查记录编号';


--
-- Name: COLUMN wc_forest_resource_survey_raw.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_forest_resource_survey_raw.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.unit_id IS '标准空间单元编号';


--
-- Name: COLUMN wc_forest_resource_survey_raw.plot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.plot_id IS '样地编号';


--
-- Name: COLUMN wc_forest_resource_survey_raw.forest_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.forest_type_code IS '林型代码';


--
-- Name: COLUMN wc_forest_resource_survey_raw.dominant_species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.dominant_species_code IS '优势树种代码';


--
-- Name: COLUMN wc_forest_resource_survey_raw.origin_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.origin_type IS '起源类型原值';


--
-- Name: COLUMN wc_forest_resource_survey_raw.age_years; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.age_years IS '树龄';


--
-- Name: COLUMN wc_forest_resource_survey_raw.age_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.age_group IS '龄组原码';


--
-- Name: COLUMN wc_forest_resource_survey_raw.canopy_density; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.canopy_density IS '郁闭度';


--
-- Name: COLUMN wc_forest_resource_survey_raw.forest_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.forest_area_ha IS '森林面积（公顷）';


--
-- Name: COLUMN wc_forest_resource_survey_raw.tree_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.tree_count IS '株数';


--
-- Name: COLUMN wc_forest_resource_survey_raw.dbh_cm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.dbh_cm IS '胸径（厘米）';


--
-- Name: COLUMN wc_forest_resource_survey_raw.tree_height_m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.tree_height_m IS '树高（米）';


--
-- Name: COLUMN wc_forest_resource_survey_raw.stock_volume_m3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.stock_volume_m3 IS '蓄积量（立方米）';


--
-- Name: COLUMN wc_forest_resource_survey_raw.survey_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.survey_year IS '调查年份';


--
-- Name: COLUMN wc_forest_resource_survey_raw.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_forest_resource_survey_raw.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_forest_resource_survey_raw.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.source_batch IS '来源批次';


--
-- Name: COLUMN wc_forest_resource_survey_raw.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_forest_resource_survey_raw.geom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.geom IS '森林调查范围几何';


--
-- Name: COLUMN wc_forest_resource_survey_raw.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.note IS '备注';


--
-- Name: COLUMN wc_forest_resource_survey_raw.species_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_forest_resource_survey_raw.species_detail_id IS '树种细分记录编号';


--
-- Name: wc_normalization_parameter_param_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wc_normalization_parameter_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wc_normalization_parameter_param_id_seq OWNER TO postgres;

--
-- Name: wc_normalization_parameter_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wc_normalization_parameter_param_id_seq OWNED BY public.wc_normalization_parameter.param_id;


--
-- Name: wc_special_population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_special_population (
    pop_id bigint NOT NULL,
    task_id character varying(60) NOT NULL,
    town_id character varying(80) NOT NULL,
    stat_date date NOT NULL,
    no_civil_capacity integer,
    limited_civil_capacity integer,
    forest_area_ha numeric(14,4),
    source_org character varying(200),
    source_batch character varying(200),
    source_code character varying(60),
    source_record_id character varying(120),
    quality_code character varying(30),
    data_status character varying(30) DEFAULT 'PENDING'::character varying NOT NULL,
    special_population_total integer,
    CONSTRAINT ck_special_population_area CHECK (((forest_area_ha IS NULL) OR ((forest_area_ha >= (0)::numeric) AND (forest_area_ha <> ALL (ARRAY['NaN'::numeric, 'Infinity'::numeric, '-Infinity'::numeric]))))),
    CONSTRAINT ck_special_population_counts CHECK ((((no_civil_capacity IS NULL) OR (no_civil_capacity >= 0)) AND ((limited_civil_capacity IS NULL) OR (limited_civil_capacity >= 0)))),
    CONSTRAINT ck_special_population_missing CHECK ((((data_status)::text <> 'MISSING'::text) OR (num_nonnulls(special_population_total, no_civil_capacity, limited_civil_capacity, forest_area_ha) = 0))),
    CONSTRAINT ck_special_population_status CHECK (((data_status)::text = ANY ((ARRAY['PENDING'::character varying, 'VALID'::character varying, 'MISSING'::character varying, 'REJECTED'::character varying, 'SUPERSEDED'::character varying])::text[]))),
    CONSTRAINT ck_special_population_text CHECK ((((task_id)::text ~ '[^[:space:]]'::text) AND ((town_id)::text ~ '[^[:space:]]'::text) AND ((source_org IS NULL) OR ((source_org)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_batch IS NULL) OR ((source_batch)::text ~ '[^[:space:]]'::text)) AND ((source_record_id IS NULL) OR ((source_record_id)::text ~ '[^[:space:]]'::text)) AND ((quality_code IS NULL) OR ((quality_code)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_special_population_total CHECK (((special_population_total IS NULL) OR (special_population_total >= 0))),
    CONSTRAINT ck_special_population_valid CHECK ((((data_status)::text <> 'VALID'::text) OR ((num_nonnulls(forest_area_ha, source_code, source_batch, source_record_id, quality_code) = 5) AND ((special_population_total IS NOT NULL) OR (num_nonnulls(no_civil_capacity, limited_civil_capacity) = 2)))))
);


ALTER TABLE public.wc_special_population OWNER TO postgres;

--
-- Name: TABLE wc_special_population; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_special_population IS '乡镇特殊人口统计表';


--
-- Name: COLUMN wc_special_population.pop_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.pop_id IS '人口统计记录ID';


--
-- Name: COLUMN wc_special_population.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.task_id IS '评估任务编号';


--
-- Name: COLUMN wc_special_population.town_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.town_id IS '乡镇空间单元编号';


--
-- Name: COLUMN wc_special_population.stat_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.stat_date IS '人口统计时点';


--
-- Name: COLUMN wc_special_population.no_civil_capacity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.no_civil_capacity IS '林区无民事行为能力人口数';


--
-- Name: COLUMN wc_special_population.limited_civil_capacity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.limited_civil_capacity IS '林区限制民事行为能力人口数';


--
-- Name: COLUMN wc_special_population.forest_area_ha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.forest_area_ha IS '统计区域林地面积（公顷）';


--
-- Name: COLUMN wc_special_population.source_org; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.source_org IS '资料提供单位';


--
-- Name: COLUMN wc_special_population.source_batch; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.source_batch IS '来源批次';


--
-- Name: COLUMN wc_special_population.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_special_population.source_record_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.source_record_id IS '原始记录编号';


--
-- Name: COLUMN wc_special_population.quality_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.quality_code IS '数据质量代码';


--
-- Name: COLUMN wc_special_population.data_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.data_status IS '统计记录状态';


--
-- Name: COLUMN wc_special_population.special_population_total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_special_population.special_population_total IS '来源特殊人口合计';


--
-- Name: wc_special_population_pop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wc_special_population_pop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wc_special_population_pop_id_seq OWNER TO postgres;

--
-- Name: wc_special_population_pop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wc_special_population_pop_id_seq OWNED BY public.wc_special_population.pop_id;


--
-- Name: wc_species_combustibility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_species_combustibility (
    mapping_id bigint NOT NULL,
    raw_species character varying(100) NOT NULL,
    combustibility_class character varying(10),
    combustibility_score numeric(4,3),
    source_name character varying(300),
    source_page character varying(50),
    mapping_version character varying(50),
    status character varying(20) DEFAULT 'REFERENCED'::character varying,
    species_code character varying(60),
    species_group_code character varying(100),
    source_code character varying(100),
    applicable_region character varying(100),
    forest_type_code character varying(60),
    effective_from date,
    effective_to date,
    species_detail_id character varying(80),
    CONSTRAINT ck_combustibility_detail_catalog CHECK (((species_detail_id IS NULL) OR ((species_code IS NOT NULL) AND (species_group_code IS NULL)))),
    CONSTRAINT ck_species_combustibility_active_complete CHECK ((((COALESCE(status, 'PENDING'::character varying))::text <> 'ACTIVE'::text) OR (((species_code IS NOT NULL) OR (species_group_code IS NOT NULL)) AND (combustibility_class IS NOT NULL) AND (source_code IS NOT NULL) AND (mapping_version IS NOT NULL) AND
CASE
    WHEN ((source_code)::text = 'SRC_WC_LYT1063_2025'::text) THEN ((NOT ((mapping_version)::text IS DISTINCT FROM 'LYT1063_2025'::text)) AND (combustibility_score IS NULL))
    ELSE (combustibility_score IS NOT NULL)
END))),
    CONSTRAINT ck_species_combustibility_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT ck_species_combustibility_pair CHECK (
CASE
    WHEN ((source_code)::text = 'SRC_WC_LYT1063_2025'::text) THEN ((NOT ((mapping_version)::text IS DISTINCT FROM 'LYT1063_2025'::text)) AND (combustibility_class IS NOT NULL) AND (combustibility_score IS NULL))
    ELSE COALESCE(((((combustibility_class)::text = '易燃'::text) AND (combustibility_score = 0.720)) OR (((combustibility_class)::text = '可燃'::text) AND (combustibility_score = 0.240)) OR (((combustibility_class)::text = '难燃'::text) AND (combustibility_score = 0.100)) OR ((combustibility_class IS NULL) AND (combustibility_score IS NULL))), false)
END),
    CONSTRAINT ck_species_combustibility_scope CHECK (((species_code IS NOT NULL) OR (species_group_code IS NOT NULL))),
    CONSTRAINT ck_species_combustibility_status CHECK (((status IS NULL) OR ((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying, 'UNMAPPED'::character varying])::text[])))),
    CONSTRAINT wc_species_combustibility_combustibility_class_check CHECK (((combustibility_class)::text = ANY ((ARRAY['难燃'::character varying, '可燃'::character varying, '易燃'::character varying])::text[]))),
    CONSTRAINT wc_species_combustibility_score_check CHECK (
CASE
    WHEN ((source_code)::text = 'SRC_WC_LYT1063_2025'::text) THEN (combustibility_score IS NULL)
    ELSE ((combustibility_score IS NULL) OR (combustibility_score = ANY (ARRAY[0.100, 0.240, 0.720])))
END)
);


ALTER TABLE public.wc_species_combustibility OWNER TO postgres;

--
-- Name: TABLE wc_species_combustibility; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_species_combustibility IS '树种可燃性映射表';


--
-- Name: COLUMN wc_species_combustibility.mapping_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.mapping_id IS '可燃性映射记录编号';


--
-- Name: COLUMN wc_species_combustibility.raw_species; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.raw_species IS '原始树种名称';


--
-- Name: COLUMN wc_species_combustibility.combustibility_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.combustibility_class IS '可燃性类别';


--
-- Name: COLUMN wc_species_combustibility.combustibility_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.combustibility_score IS 'P01固定分值；LY/T 1063—2025分类记录留空，树种因子权值按蓄积占比在规则中计算。';


--
-- Name: COLUMN wc_species_combustibility.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.source_name IS '依据文件名称';


--
-- Name: COLUMN wc_species_combustibility.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_species_combustibility.mapping_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.mapping_version IS '映射规则版本';


--
-- Name: COLUMN wc_species_combustibility.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.status IS '映射记录状态';


--
-- Name: COLUMN wc_species_combustibility.species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.species_code IS '树种代码';


--
-- Name: COLUMN wc_species_combustibility.species_group_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.species_group_code IS '树种组代码';


--
-- Name: COLUMN wc_species_combustibility.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_species_combustibility.applicable_region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.applicable_region IS '适用区域';


--
-- Name: COLUMN wc_species_combustibility.forest_type_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.forest_type_code IS '适用森林类型代码';


--
-- Name: COLUMN wc_species_combustibility.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.effective_from IS '生效日期';


--
-- Name: COLUMN wc_species_combustibility.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.effective_to IS '失效日期';


--
-- Name: COLUMN wc_species_combustibility.species_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_combustibility.species_detail_id IS '树种细分记录编号';


--
-- Name: wc_species_combustibility_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wc_species_combustibility_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wc_species_combustibility_mapping_id_seq OWNER TO postgres;

--
-- Name: wc_species_combustibility_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wc_species_combustibility_mapping_id_seq OWNED BY public.wc_species_combustibility.mapping_id;


--
-- Name: wc_species_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_species_detail (
    detail_id character varying(80) NOT NULL,
    catalog_species_code character varying(60) NOT NULL,
    parent_detail_id character varying(80),
    detail_name_cn character varying(200) NOT NULL,
    detail_name_latin character varying(200),
    classification_level character varying(30) NOT NULL,
    source_code character varying(60),
    source_name character varying(300),
    source_page character varying(100),
    dictionary_version character varying(50) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT ck_species_detail_active_source CHECK ((((status)::text <> 'ACTIVE'::text) OR ((source_code IS NOT NULL) AND (source_name IS NOT NULL) AND (source_page IS NOT NULL)))),
    CONSTRAINT ck_species_detail_dates CHECK (((effective_from IS NULL) OR (effective_to IS NULL) OR (effective_from <= effective_to))),
    CONSTRAINT ck_species_detail_level CHECK (((classification_level)::text = ANY ((ARRAY['GROUP'::character varying, 'GENUS'::character varying, 'SPECIES'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT ck_species_detail_parent CHECK (((parent_detail_id IS NULL) OR ((parent_detail_id)::text <> (detail_id)::text))),
    CONSTRAINT ck_species_detail_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying, 'UNMAPPED'::character varying])::text[]))),
    CONSTRAINT ck_species_detail_text CHECK ((((detail_id)::text ~ '[^[:space:]]'::text) AND ((catalog_species_code)::text ~ '[^[:space:]]'::text) AND ((detail_name_cn)::text ~ '[^[:space:]]'::text) AND ((dictionary_version)::text ~ '[^[:space:]]'::text) AND ((detail_name_latin IS NULL) OR ((detail_name_latin)::text ~ '[^[:space:]]'::text)) AND ((parent_detail_id IS NULL) OR ((parent_detail_id)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((source_name IS NULL) OR ((source_name)::text ~ '[^[:space:]]'::text)) AND ((source_page IS NULL) OR ((source_page)::text ~ '[^[:space:]]'::text))))
);


ALTER TABLE public.wc_species_detail OWNER TO postgres;

--
-- Name: TABLE wc_species_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_species_detail IS '树种细分表';


--
-- Name: COLUMN wc_species_detail.detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.detail_id IS '树种细分记录编号';


--
-- Name: COLUMN wc_species_detail.catalog_species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.catalog_species_code IS '所属树种目录代码';


--
-- Name: COLUMN wc_species_detail.parent_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.parent_detail_id IS '上级树种细分记录编号';


--
-- Name: COLUMN wc_species_detail.detail_name_cn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.detail_name_cn IS '树种细分中文名称';


--
-- Name: COLUMN wc_species_detail.detail_name_latin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.detail_name_latin IS '树种细分拉丁名称或范围';


--
-- Name: COLUMN wc_species_detail.classification_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.classification_level IS '分类层级';


--
-- Name: COLUMN wc_species_detail.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_species_detail.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.source_name IS '依据文件名称';


--
-- Name: COLUMN wc_species_detail.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_species_detail.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_species_detail.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.status IS '审核采用状态';


--
-- Name: COLUMN wc_species_detail.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.effective_from IS '有效起日';


--
-- Name: COLUMN wc_species_detail.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.effective_to IS '有效截止日';


--
-- Name: COLUMN wc_species_detail.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_detail.note IS '备注';


--
-- Name: wc_species_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wc_species_dictionary (
    species_code character varying(60) NOT NULL,
    species_name_cn character varying(200) NOT NULL,
    species_name_latin character varying(200),
    species_alias text,
    species_group_code character varying(100),
    source_code character varying(100),
    source_name character varying(300),
    source_page character varying(50),
    dictionary_version character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    effective_from date,
    effective_to date,
    note text,
    CONSTRAINT ck_r15_identity_text CHECK ((((species_code IS NULL) OR ((species_code)::text ~ '[^[:space:]]'::text)) AND ((species_group_code IS NULL) OR ((species_group_code)::text ~ '[^[:space:]]'::text)) AND ((source_code IS NULL) OR ((source_code)::text ~ '[^[:space:]]'::text)) AND ((dictionary_version IS NULL) OR ((dictionary_version)::text ~ '[^[:space:]]'::text)))),
    CONSTRAINT ck_species_dictionary_dates CHECK (((effective_to IS NULL) OR (effective_from IS NULL) OR (effective_to >= effective_from))),
    CONSTRAINT ck_species_dictionary_status CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACTIVE'::character varying, 'INACTIVE'::character varying, 'UNMAPPED'::character varying])::text[]))),
    CONSTRAINT ck_species_name_cn_nonblank CHECK (((species_name_cn)::text ~ '[^[:space:]]'::text))
);


ALTER TABLE public.wc_species_dictionary OWNER TO postgres;

--
-- Name: TABLE wc_species_dictionary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.wc_species_dictionary IS '树种字典表';


--
-- Name: COLUMN wc_species_dictionary.species_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.species_code IS '树种代码';


--
-- Name: COLUMN wc_species_dictionary.species_name_cn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.species_name_cn IS '树种中文名称';


--
-- Name: COLUMN wc_species_dictionary.species_name_latin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.species_name_latin IS '树种拉丁名称';


--
-- Name: COLUMN wc_species_dictionary.species_alias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.species_alias IS '树种别名';


--
-- Name: COLUMN wc_species_dictionary.species_group_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.species_group_code IS '树种组代码';


--
-- Name: COLUMN wc_species_dictionary.source_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.source_code IS '数据来源代码';


--
-- Name: COLUMN wc_species_dictionary.source_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.source_name IS '来源名称';


--
-- Name: COLUMN wc_species_dictionary.source_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.source_page IS '依据页码或条款';


--
-- Name: COLUMN wc_species_dictionary.dictionary_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.dictionary_version IS '字典版本';


--
-- Name: COLUMN wc_species_dictionary.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.status IS '代码状态';


--
-- Name: COLUMN wc_species_dictionary.effective_from; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.effective_from IS '生效起始日期';


--
-- Name: COLUMN wc_species_dictionary.effective_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.effective_to IS '生效结束日期';


--
-- Name: COLUMN wc_species_dictionary.note; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wc_species_dictionary.note IS '备注';


--
-- Name: wc_fire_output_input mapping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input ALTER COLUMN mapping_id SET DEFAULT nextval('public.wc_fire_output_input_mapping_id_seq'::regclass);


--
-- Name: wc_normalization_parameter param_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_normalization_parameter ALTER COLUMN param_id SET DEFAULT nextval('public.wc_normalization_parameter_param_id_seq'::regclass);


--
-- Name: wc_special_population pop_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population ALTER COLUMN pop_id SET DEFAULT nextval('public.wc_special_population_pop_id_seq'::regclass);


--
-- Name: wc_species_combustibility mapping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_combustibility ALTER COLUMN mapping_id SET DEFAULT nextval('public.wc_species_combustibility_mapping_id_seq'::regclass);


--
-- Name: wc_fire_capacity_command_detail pk_f06_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_command_detail
    ADD CONSTRAINT pk_f06_1 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_communication_detail pk_f06_10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_communication_detail
    ADD CONSTRAINT pk_f06_10 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_other_facility_detail pk_f06_11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_other_facility_detail
    ADD CONSTRAINT pk_f06_11 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_team_equipment pk_f06_12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_equipment
    ADD CONSTRAINT pk_f06_12 PRIMARY KEY (detail_id);


--
-- Name: wc_fire_capacity_warehouse_item pk_f06_13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_item
    ADD CONSTRAINT pk_f06_13 PRIMARY KEY (detail_id);


--
-- Name: wc_fire_capacity_team_detail pk_f06_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_detail
    ADD CONSTRAINT pk_f06_2 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_ranger_detail pk_f06_3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_ranger_detail
    ADD CONSTRAINT pk_f06_3 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_warehouse_detail pk_f06_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_detail
    ADD CONSTRAINT pk_f06_4 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_barrier_detail pk_f06_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_barrier_detail
    ADD CONSTRAINT pk_f06_5 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_lookout_detail pk_f06_6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_lookout_detail
    ADD CONSTRAINT pk_f06_6 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_warning_detail pk_f06_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warning_detail
    ADD CONSTRAINT pk_f06_7 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_road_detail pk_f06_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_road_detail
    ADD CONSTRAINT pk_f06_8 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_capacity_information_detail pk_f06_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_information_detail
    ADD CONSTRAINT pk_f06_9 PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_building_survey_raw uq_building_raw_lineage; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_survey_raw
    ADD CONSTRAINT uq_building_raw_lineage UNIQUE (raw_record_id, source_code, source_batch, source_record_id);


--
-- Name: wc_fire_building_survey_raw uq_building_raw_source_record; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_survey_raw
    ADD CONSTRAINT uq_building_raw_source_record UNIQUE (source_code, source_batch, source_record_id);


--
-- Name: wc_fire_capacity_resource uq_cap_f06_identity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT uq_cap_f06_identity UNIQUE (task_id, capacity_id, period_key, survey_form_code);


--
-- Name: wc_fire_capacity_command_detail uq_f06_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_command_detail
    ADD CONSTRAINT uq_f06_1 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_communication_detail uq_f06_10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_communication_detail
    ADD CONSTRAINT uq_f06_10 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_other_facility_detail uq_f06_11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_other_facility_detail
    ADD CONSTRAINT uq_f06_11 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_team_equipment uq_f06_12_source; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_equipment
    ADD CONSTRAINT uq_f06_12_source UNIQUE (task_id, team_capacity_id, period_key, source_locator);


--
-- Name: wc_fire_capacity_warehouse_item uq_f06_13_source; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_item
    ADD CONSTRAINT uq_f06_13_source UNIQUE (task_id, warehouse_capacity_id, period_key, source_locator);


--
-- Name: wc_fire_capacity_team_detail uq_f06_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_detail
    ADD CONSTRAINT uq_f06_2 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_ranger_detail uq_f06_3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_ranger_detail
    ADD CONSTRAINT uq_f06_3 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_warehouse_detail uq_f06_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_detail
    ADD CONSTRAINT uq_f06_4 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_barrier_detail uq_f06_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_barrier_detail
    ADD CONSTRAINT uq_f06_5 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_lookout_detail uq_f06_6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_lookout_detail
    ADD CONSTRAINT uq_f06_6 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_warning_detail uq_f06_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warning_detail
    ADD CONSTRAINT uq_f06_7 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_road_detail uq_f06_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_road_detail
    ADD CONSTRAINT uq_f06_8 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_capacity_information_detail uq_f06_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_information_detail
    ADD CONSTRAINT uq_f06_9 UNIQUE (task_id, capacity_id, period_key);


--
-- Name: wc_fire_result_layer uq_fire_result_task_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT uq_fire_result_task_id UNIQUE (task_id, result_id);


--
-- Name: wc_fire_rule_definition uq_fire_rule_task_rule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_rule_definition
    ADD CONSTRAINT uq_fire_rule_task_rule UNIQUE (task_id, rule_id);


--
-- Name: wc_fire_fuel_sample_plot uq_fuel_plot_task_plot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT uq_fuel_plot_task_plot UNIQUE (task_id, plot_id);


--
-- Name: wc_normalization_parameter uq_normalization_indicator_param; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_normalization_parameter
    ADD CONSTRAINT uq_normalization_indicator_param UNIQUE (indicator_code, param_id);


--
-- Name: wc_fire_fuel_code_dictionary uq_r15_fuel_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_code_dictionary
    ADD CONSTRAINT uq_r15_fuel_code UNIQUE NULLS NOT DISTINCT (dict_type, dict_code, dictionary_version);


--
-- Name: wc_fire_output_input uq_r20_dependency_identity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input
    ADD CONSTRAINT uq_r20_dependency_identity UNIQUE NULLS NOT DISTINCT (output_code, package_code, indicator_code, upstream_output_code);


--
-- Name: wc_special_population uq_special_population_delivery; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT uq_special_population_delivery UNIQUE (task_id, town_id, stat_date, source_code, source_batch);


--
-- Name: wc_species_detail uq_species_detail_catalog_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_detail
    ADD CONSTRAINT uq_species_detail_catalog_id UNIQUE (catalog_species_code, detail_id);


--
-- Name: wc_biomass_conversion_parameter wc_biomass_conversion_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_biomass_conversion_parameter
    ADD CONSTRAINT wc_biomass_conversion_parameter_pkey PRIMARY KEY (parameter_id);


--
-- Name: wc_compartment_weather wc_compartment_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_compartment_weather
    ADD CONSTRAINT wc_compartment_weather_pkey PRIMARY KEY (task_id, unit_id, weather_unit_id);


--
-- Name: wc_fire_assessment_task wc_fire_assessment_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_assessment_task
    ADD CONSTRAINT wc_fire_assessment_task_pkey PRIMARY KEY (task_id);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_pkey PRIMARY KEY (terrain_id);


--
-- Name: wc_fire_building_exposure wc_fire_building_exposure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT wc_fire_building_exposure_pkey PRIMARY KEY (building_id);


--
-- Name: wc_fire_building_survey_raw wc_fire_building_survey_raw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_survey_raw
    ADD CONSTRAINT wc_fire_building_survey_raw_pkey PRIMARY KEY (raw_record_id);


--
-- Name: wc_fire_capacity_resource wc_fire_capacity_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT wc_fire_capacity_resource_pkey PRIMARY KEY (capacity_id);


--
-- Name: wc_fire_economy_grid wc_fire_economy_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT wc_fire_economy_grid_pkey PRIMARY KEY (record_id);


--
-- Name: wc_fire_forest_resource wc_fire_forest_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT wc_fire_forest_resource_pkey PRIMARY KEY (resource_id);


--
-- Name: wc_fire_fuel_code_dictionary wc_fire_fuel_code_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_code_dictionary
    ADD CONSTRAINT wc_fire_fuel_code_dictionary_pkey PRIMARY KEY (dictionary_id);


--
-- Name: wc_fire_fuel_sample wc_fire_fuel_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT wc_fire_fuel_sample_pkey PRIMARY KEY (sample_id);


--
-- Name: wc_fire_fuel_sample_plot wc_fire_fuel_sample_plot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT wc_fire_fuel_sample_plot_pkey PRIMARY KEY (plot_id);


--
-- Name: wc_fire_fuel_unit wc_fire_fuel_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT wc_fire_fuel_unit_pkey PRIMARY KEY (fuel_unit_id);


--
-- Name: wc_fire_fuel_unit wc_fire_fuel_unit_task_id_unit_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT wc_fire_fuel_unit_task_id_unit_id_key UNIQUE (task_id, unit_id);


--
-- Name: wc_fire_history_cause_dictionary wc_fire_history_cause_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_cause_dictionary
    ADD CONSTRAINT wc_fire_history_cause_dictionary_pkey PRIMARY KEY (cause_code);


--
-- Name: wc_fire_history_event wc_fire_history_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT wc_fire_history_event_pkey PRIMARY KEY (fire_id);


--
-- Name: wc_fire_history_level_dictionary wc_fire_history_level_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_level_dictionary
    ADD CONSTRAINT wc_fire_history_level_dictionary_pkey PRIMARY KEY (level_code);


--
-- Name: wc_fire_indicator_definition wc_fire_indicator_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_definition
    ADD CONSTRAINT wc_fire_indicator_definition_pkey PRIMARY KEY (indicator_code);


--
-- Name: wc_fire_indicator_value wc_fire_indicator_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT wc_fire_indicator_value_pkey PRIMARY KEY (task_id, unit_id, indicator_code, period_key);


--
-- Name: wc_fire_output_catalog wc_fire_output_catalog_output_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_catalog
    ADD CONSTRAINT wc_fire_output_catalog_output_name_key UNIQUE (output_name);


--
-- Name: wc_fire_output_catalog wc_fire_output_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_catalog
    ADD CONSTRAINT wc_fire_output_catalog_pkey PRIMARY KEY (output_code);


--
-- Name: wc_fire_output_input wc_fire_output_input_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input
    ADD CONSTRAINT wc_fire_output_input_pkey PRIMARY KEY (mapping_id);


--
-- Name: wc_fire_population_grid wc_fire_population_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT wc_fire_population_grid_pkey PRIMARY KEY (record_id);


--
-- Name: wc_fire_quality_dictionary wc_fire_quality_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_quality_dictionary
    ADD CONSTRAINT wc_fire_quality_dictionary_pkey PRIMARY KEY (quality_code);


--
-- Name: wc_fire_result_layer wc_fire_result_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT wc_fire_result_layer_pkey PRIMARY KEY (result_id);


--
-- Name: wc_fire_rule_definition wc_fire_rule_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_rule_definition
    ADD CONSTRAINT wc_fire_rule_definition_pkey PRIMARY KEY (rule_id);


--
-- Name: wc_fire_source_point wc_fire_source_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT wc_fire_source_point_pkey PRIMARY KEY (source_id);


--
-- Name: wc_fire_source_registry wc_fire_source_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_registry
    ADD CONSTRAINT wc_fire_source_registry_pkey PRIMARY KEY (source_code);


--
-- Name: wc_fire_source_type_dictionary wc_fire_source_type_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_type_dictionary
    ADD CONSTRAINT wc_fire_source_type_dictionary_pkey PRIMARY KEY (standard_code);


--
-- Name: wc_fire_spatial_unit wc_fire_spatial_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_spatial_unit
    ADD CONSTRAINT wc_fire_spatial_unit_pkey PRIMARY KEY (unit_id);


--
-- Name: wc_fire_spatial_unit wc_fire_spatial_unit_task_id_unit_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_spatial_unit
    ADD CONSTRAINT wc_fire_spatial_unit_task_id_unit_id_key UNIQUE (task_id, unit_id);


--
-- Name: wc_fire_task_source wc_fire_task_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_task_source
    ADD CONSTRAINT wc_fire_task_source_pkey PRIMARY KEY (task_id, source_code, source_batch);


--
-- Name: wc_fire_use_category_dictionary wc_fire_use_category_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_category_dictionary
    ADD CONSTRAINT wc_fire_use_category_dictionary_pkey PRIMARY KEY (event_type, category_code);


--
-- Name: wc_fire_use_event wc_fire_use_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_event
    ADD CONSTRAINT wc_fire_use_event_pkey PRIMARY KEY (event_id);


--
-- Name: wc_fire_weather_month wc_fire_weather_month_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_weather_month
    ADD CONSTRAINT wc_fire_weather_month_pkey PRIMARY KEY (weather_id);


--
-- Name: wc_fire_weather_month wc_fire_weather_month_task_id_weather_unit_id_stat_year_sta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_weather_month
    ADD CONSTRAINT wc_fire_weather_month_task_id_weather_unit_id_stat_year_sta_key UNIQUE (task_id, weather_unit_id, stat_year, stat_month);


--
-- Name: wc_forest_compartment wc_forest_compartment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_compartment
    ADD CONSTRAINT wc_forest_compartment_pkey PRIMARY KEY (bsm);


--
-- Name: wc_forest_resource_survey_raw wc_forest_resource_survey_raw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT wc_forest_resource_survey_raw_pkey PRIMARY KEY (survey_id);


--
-- Name: wc_normalization_parameter wc_normalization_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_normalization_parameter
    ADD CONSTRAINT wc_normalization_parameter_pkey PRIMARY KEY (param_id);


--
-- Name: wc_special_population wc_special_population_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT wc_special_population_pkey PRIMARY KEY (pop_id);


--
-- Name: wc_species_combustibility wc_species_combustibility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_combustibility
    ADD CONSTRAINT wc_species_combustibility_pkey PRIMARY KEY (mapping_id);


--
-- Name: wc_species_detail wc_species_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_detail
    ADD CONSTRAINT wc_species_detail_pkey PRIMARY KEY (detail_id);


--
-- Name: wc_species_dictionary wc_species_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_dictionary
    ADD CONSTRAINT wc_species_dictionary_pkey PRIMARY KEY (species_code);


--
-- Name: idx_wc_fire_indicator_value_task_unit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_indicator_value_task_unit ON public.wc_fire_indicator_value USING btree (task_id, unit_id);


--
-- Name: idx_wc_fire_result_layer_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_result_layer_geom ON public.wc_fire_result_layer USING gist (geom);


--
-- Name: idx_wc_fire_result_layer_task_output; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_result_layer_task_output ON public.wc_fire_result_layer USING btree (task_id, output_code);


--
-- Name: idx_wc_fire_source_point_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_source_point_geom ON public.wc_fire_source_point USING gist (geom);


--
-- Name: idx_wc_fire_spatial_unit_task_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_spatial_unit_task_type ON public.wc_fire_spatial_unit USING btree (task_id, unit_type);


--
-- Name: idx_wc_fire_use_event_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_fire_use_event_geom ON public.wc_fire_use_event USING gist (geom);


--
-- Name: idx_wc_forest_resource_survey_raw_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_forest_resource_survey_raw_geom ON public.wc_forest_resource_survey_raw USING gist (geom);


--
-- Name: idx_wc_forest_resource_survey_raw_task_unit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wc_forest_resource_survey_raw_task_unit ON public.wc_forest_resource_survey_raw USING btree (task_id, unit_id);


--
-- Name: ix_f06_12_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_f06_12_owner ON public.wc_fire_capacity_team_equipment USING btree (task_id, team_capacity_id, period_key);


--
-- Name: ix_f06_13_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_f06_13_owner ON public.wc_fire_capacity_warehouse_item USING btree (task_id, warehouse_capacity_id, period_key);


--
-- Name: ix_species_detail_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_species_detail_parent ON public.wc_species_detail USING btree (catalog_species_code, parent_detail_id);


--
-- Name: uq_combustibility_catalog_only; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_combustibility_catalog_only ON public.wc_species_combustibility USING btree (species_code) WHERE ((species_detail_id IS NULL) AND (species_code IS NOT NULL));


--
-- Name: uq_combustibility_detail; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_combustibility_detail ON public.wc_species_combustibility USING btree (species_detail_id) WHERE (species_detail_id IS NOT NULL);


--
-- Name: uq_fire_result_hazard_run; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_fire_result_hazard_run ON public.wc_fire_result_layer USING btree (task_id, output_code, unit_id, period_key, source_batch) NULLS NOT DISTINCT WHERE ((output_code)::text = ANY ((ARRAY['HAZARD_INDEX'::character varying, 'HAZARD_GRADE'::character varying])::text[]));


--
-- Name: uq_fire_result_other_outputs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_fire_result_other_outputs ON public.wc_fire_result_layer USING btree (task_id, output_code, unit_id) WHERE ((output_code)::text <> ALL ((ARRAY['HAZARD_INDEX'::character varying, 'HAZARD_GRADE'::character varying])::text[]));


--
-- Name: uq_normalization_task_indicator_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_normalization_task_indicator_version ON public.wc_normalization_parameter USING btree (task_id, indicator_code, ((source_refs ->> 'parameter_version'::text))) NULLS NOT DISTINCT WHERE ((source_refs ->> 'parameter_version'::text) IS NOT NULL);


--
-- Name: uq_r15_output_input; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_r15_output_input ON public.wc_fire_output_input USING btree (output_code, package_code, indicator_code, upstream_output_code) NULLS NOT DISTINCT;


--
-- Name: wc_fire_capacity_barrier_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_barrier_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_command_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_command_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_communication_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_communication_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_information_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_information_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_lookout_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_lookout_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_other_facility_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_other_facility_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_ranger_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_ranger_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_road_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_road_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_team_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_team_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_warehouse_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_warehouse_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_warning_detail ck_wc_f06_detail_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_detail_complete AFTER INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_warning_detail DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_capacity_resource ck_wc_f06_header_complete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ck_wc_f06_header_complete AFTER INSERT OR UPDATE ON public.wc_fire_capacity_resource DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_complete_guard();


--
-- Name: wc_fire_indicator_value trg_00_r18_indicator; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_00_r18_indicator BEFORE INSERT OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_r18_indicator_guard();


--
-- Name: wc_fire_indicator_value trg_00_special_risk_h_linkage; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_00_special_risk_h_linkage BEFORE INSERT OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_special_risk_h_guard();


--
-- Name: wc_fire_result_layer trg_00_special_risk_h_linkage; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_00_special_risk_h_linkage BEFORE INSERT OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_special_risk_h_guard();


--
-- Name: wc_fire_result_layer trg_00_special_risk_h_parent; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_00_special_risk_h_parent BEFORE DELETE OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_special_risk_h_parent_guard();


--
-- Name: wc_fire_indicator_value trg_01_composite_indicator_parent; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_01_composite_indicator_parent BEFORE DELETE OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_composite_parent_guard();


--
-- Name: wc_fire_result_layer trg_01_composite_result_parent; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_01_composite_result_parent BEFORE DELETE OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_composite_parent_guard();


--
-- Name: wc_fire_indicator_value trg_01_wc_local_adoption; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_01_wc_local_adoption BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_local_adoption_guard();


--
-- Name: wc_fire_spatial_unit trg_01_wc_local_boundary; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_01_wc_local_boundary BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_spatial_unit FOR EACH ROW EXECUTE FUNCTION public.fn_wc_local_boundary_guard();


--
-- Name: wc_normalization_parameter trg_01_wc_local_parameter; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_01_wc_local_parameter BEFORE INSERT OR DELETE OR UPDATE ON public.wc_normalization_parameter FOR EACH ROW EXECUTE FUNCTION public.fn_wc_local_parameter_guard();


--
-- Name: wc_fire_spatial_unit trg_02_wc_p03_boundary_source; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_02_wc_p03_boundary_source BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_spatial_unit FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_source_guard();


--
-- Name: wc_normalization_parameter trg_02_wc_p03_parameter; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_02_wc_p03_parameter BEFORE INSERT OR DELETE OR UPDATE ON public.wc_normalization_parameter FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_parameter_guard();


--
-- Name: wc_fire_capacity_resource trg_02_wc_p03_resource_source; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_02_wc_p03_resource_source BEFORE DELETE OR UPDATE ON public.wc_fire_capacity_resource FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_source_guard();


--
-- Name: wc_fire_indicator_value trg_02_wc_p03_value; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_02_wc_p03_value BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_value_guard();


--
-- Name: wc_fire_rule_definition trg_03_wc_p03_rule_source; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_03_wc_p03_rule_source BEFORE DELETE OR UPDATE ON public.wc_fire_rule_definition FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_rule_source_guard();


--
-- Name: wc_fire_indicator_value trg_03_wc_p05_capacity_source; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_03_wc_p05_capacity_source BEFORE DELETE OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p05_capacity_source_guard();


--
-- Name: wc_fire_result_layer trg_03_wc_p05_pair; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_03_wc_p05_pair BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p05_pair_guard();


--
-- Name: wc_fire_indicator_value trg_04_wc_p03_downstream_source; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_04_wc_p03_downstream_source BEFORE DELETE OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_downstream_source_guard();


--
-- Name: wc_biomass_conversion_parameter trg_biomass_species_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_biomass_species_detail BEFORE INSERT OR UPDATE ON public.wc_biomass_conversion_parameter FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_reference_guard('species_code');


--
-- Name: wc_species_combustibility trg_combustibility_species_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_combustibility_species_detail BEFORE INSERT OR UPDATE ON public.wc_species_combustibility FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_reference_guard('species_code');


--
-- Name: wc_fire_forest_resource trg_forest_resource_species_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_forest_resource_species_detail BEFORE INSERT OR UPDATE ON public.wc_fire_forest_resource FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_reference_guard('dominant_species_code');


--
-- Name: wc_fire_fuel_sample_plot trg_fuel_measurement_sample_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_fuel_measurement_sample_guard BEFORE INSERT OR UPDATE OF task_id, fuel_measurements ON public.wc_fire_fuel_sample_plot FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fuel_measurement_sample_guard();


--
-- Name: wc_fire_fuel_sample trg_fuel_measurement_sample_restrict; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_fuel_measurement_sample_restrict BEFORE DELETE OR UPDATE OF sample_id, task_id, sample_type, species_code, fine_fuel_size_group, fresh_mass_kg, dry_mass_kg ON public.wc_fire_fuel_sample FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fuel_measurement_sample_restrict();


--
-- Name: wc_fire_fuel_sample_plot trg_fuel_plot_parent_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_fuel_plot_parent_guard BEFORE INSERT OR UPDATE OF task_id, plot_id, parent_plot_id ON public.wc_fire_fuel_sample_plot FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_fuel_plot_parent_guard();


--
-- Name: wc_fire_fuel_sample trg_fuel_sample_species_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_fuel_sample_species_detail BEFORE INSERT OR UPDATE ON public.wc_fire_fuel_sample FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_reference_guard('species_code');


--
-- Name: wc_fire_output_catalog trg_r15_catalog_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_catalog_guard BEFORE DELETE OR UPDATE ON public.wc_fire_output_catalog FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_catalog_guard();


--
-- Name: wc_fire_indicator_definition trg_r15_definition_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_definition_guard BEFORE DELETE OR UPDATE ON public.wc_fire_indicator_definition FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_indicator_history_guard();


--
-- Name: wc_fire_fuel_code_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_fuel_code_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_history_cause_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_history_cause_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_history_level_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_history_level_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_quality_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_quality_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_source_type_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_source_type_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_use_category_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_use_category_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_species_dictionary trg_r15_dictionary_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_dictionary_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_species_dictionary FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_fire_indicator_value trg_r15_indicator_delete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_indicator_delete BEFORE DELETE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_indicator_history_guard();


--
-- Name: wc_fire_output_input trg_r15_input_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_input_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_output_input FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_output_input_guard();


--
-- Name: wc_fire_task_source trg_r15_source_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_source_guard BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_task_source FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_task_source_guard();


--
-- Name: wc_fire_assessment_task trg_r15_task_guard; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r15_task_guard BEFORE DELETE OR UPDATE ON public.wc_fire_assessment_task FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_task_history_guard();


--
-- Name: wc_fire_result_layer trg_r18_zoning_structure; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_r18_zoning_structure BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_r18_zoning_guard();


--
-- Name: wc_species_detail trg_species_detail_10_hierarchy; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_species_detail_10_hierarchy BEFORE INSERT OR UPDATE ON public.wc_species_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_guard();


--
-- Name: wc_species_detail trg_species_detail_20_history; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_species_detail_20_history BEFORE INSERT OR DELETE OR UPDATE ON public.wc_species_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_dictionary_guard();


--
-- Name: wc_forest_resource_survey_raw trg_survey_raw_species_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_survey_raw_species_detail BEFORE INSERT OR UPDATE ON public.wc_forest_resource_survey_raw FOR EACH ROW EXECUTE FUNCTION public.fn_wc_species_detail_reference_guard('dominant_species_code');


--
-- Name: wc_biomass_conversion_parameter trg_wc_biomass_model_contract; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_biomass_model_contract BEFORE INSERT OR UPDATE ON public.wc_biomass_conversion_parameter FOR EACH ROW EXECUTE FUNCTION public.fn_wc_biomass_model_contract_guard();


--
-- Name: wc_fire_capacity_barrier_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_barrier_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_command_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_command_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_communication_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_communication_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_information_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_information_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_lookout_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_lookout_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_other_facility_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_other_facility_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_ranger_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_ranger_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_road_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_road_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_team_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_team_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_team_equipment trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_team_equipment FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_warehouse_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_warehouse_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_warehouse_item trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_warehouse_item FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_warning_detail trg_wc_f06_detail; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_detail BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_capacity_warning_detail FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_detail_guard();


--
-- Name: wc_fire_capacity_resource trg_wc_f06_header; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_f06_header BEFORE INSERT OR UPDATE ON public.wc_fire_capacity_resource FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_header_guard();


--
-- Name: wc_fire_building_exposure trg_wc_fire_building_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_building_prerequisites BEFORE INSERT OR UPDATE ON public.wc_fire_building_exposure FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_building_prerequisites();


--
-- Name: wc_fire_capacity_resource trg_wc_fire_capacity_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_capacity_prerequisites BEFORE INSERT OR UPDATE ON public.wc_fire_capacity_resource FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_capacity_prerequisites();


--
-- Name: wc_fire_indicator_value trg_wc_fire_indicator_rule_adoption; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_indicator_rule_adoption BEFORE INSERT OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_indicator_rule_adoption();


--
-- Name: wc_fire_indicator_value trg_wc_fire_indicator_value_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_indicator_value_prerequisites BEFORE INSERT OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_indicator_value_prerequisites();


--
-- Name: wc_fire_result_layer trg_wc_fire_result_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_result_prerequisites BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_result_layer FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_result_prerequisites();


--
-- Name: wc_fire_rule_definition trg_wc_fire_rule_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_fire_rule_prerequisites BEFORE INSERT OR DELETE OR UPDATE ON public.wc_fire_rule_definition FOR EACH ROW EXECUTE FUNCTION public.fn_wc_fire_rule_prerequisites();


--
-- Name: wc_normalization_parameter trg_wc_normalization_parameter_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_normalization_parameter_prerequisites BEFORE INSERT OR DELETE OR UPDATE ON public.wc_normalization_parameter FOR EACH ROW EXECUTE FUNCTION public.fn_wc_normalization_parameter_prerequisites();


--
-- Name: wc_fire_spatial_unit trg_wc_p03_county_parent; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_p03_county_parent BEFORE DELETE OR UPDATE ON public.wc_fire_spatial_unit FOR EACH ROW EXECUTE FUNCTION public.fn_wc_p03_county_parent_guard();


--
-- Name: wc_special_population trg_wc_special_population_prerequisites; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_wc_special_population_prerequisites BEFORE INSERT OR UPDATE ON public.wc_special_population FOR EACH ROW EXECUTE FUNCTION public.fn_wc_special_population_prerequisites();


--
-- Name: wc_fire_indicator_value zz_wc_f06_adoption_snapshot; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER zz_wc_f06_adoption_snapshot BEFORE INSERT OR UPDATE ON public.wc_fire_indicator_value FOR EACH ROW EXECUTE FUNCTION public.fn_wc_f06_adoption_snapshot();


--
-- Name: wc_biomass_conversion_parameter fk_biomass_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_biomass_conversion_parameter
    ADD CONSTRAINT fk_biomass_detail FOREIGN KEY (species_code, species_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_fire_building_exposure fk_building_exposure_raw_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT fk_building_exposure_raw_source FOREIGN KEY (raw_record_id, source_code, source_batch, source_record_id) REFERENCES public.wc_fire_building_survey_raw(raw_record_id, source_code, source_batch, source_record_id);


--
-- Name: wc_fire_building_exposure fk_building_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT fk_building_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_building_survey_raw fk_building_raw_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_survey_raw
    ADD CONSTRAINT fk_building_raw_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_building_exposure fk_building_task_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT fk_building_task_source FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_building_exposure fk_building_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT fk_building_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_capacity_resource fk_capacity_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT fk_capacity_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_capacity_resource fk_capacity_task_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT fk_capacity_task_source FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_capacity_resource fk_capacity_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT fk_capacity_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_species_combustibility fk_combustibility_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_combustibility
    ADD CONSTRAINT fk_combustibility_detail FOREIGN KEY (species_code, species_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_compartment_weather fk_compartment_weather_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_compartment_weather
    ADD CONSTRAINT fk_compartment_weather_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_compartment_weather fk_compartment_weather_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_compartment_weather
    ADD CONSTRAINT fk_compartment_weather_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_capacity_communication_detail fk_f06_10_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_communication_detail
    ADD CONSTRAINT fk_f06_10_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_other_facility_detail fk_f06_11_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_other_facility_detail
    ADD CONSTRAINT fk_f06_11_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_team_equipment fk_f06_12_owner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_equipment
    ADD CONSTRAINT fk_f06_12_owner FOREIGN KEY (task_id, team_capacity_id, period_key) REFERENCES public.wc_fire_capacity_team_detail(task_id, capacity_id, period_key) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_warehouse_item fk_f06_13_owner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_item
    ADD CONSTRAINT fk_f06_13_owner FOREIGN KEY (task_id, warehouse_capacity_id, period_key) REFERENCES public.wc_fire_capacity_warehouse_detail(task_id, capacity_id, period_key) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_command_detail fk_f06_1_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_command_detail
    ADD CONSTRAINT fk_f06_1_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_team_detail fk_f06_2_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_detail
    ADD CONSTRAINT fk_f06_2_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_ranger_detail fk_f06_3_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_ranger_detail
    ADD CONSTRAINT fk_f06_3_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_warehouse_detail fk_f06_4_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warehouse_detail
    ADD CONSTRAINT fk_f06_4_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_barrier_detail fk_f06_5_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_barrier_detail
    ADD CONSTRAINT fk_f06_5_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_lookout_detail fk_f06_6_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_lookout_detail
    ADD CONSTRAINT fk_f06_6_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_warning_detail fk_f06_7_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_warning_detail
    ADD CONSTRAINT fk_f06_7_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_road_detail fk_f06_8_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_road_detail
    ADD CONSTRAINT fk_f06_8_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_information_detail fk_f06_9_header; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_information_detail
    ADD CONSTRAINT fk_f06_9_header FOREIGN KEY (task_id, capacity_id, period_key, survey_form_code) REFERENCES public.wc_fire_capacity_resource(task_id, capacity_id, period_key, survey_form_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_result_layer fk_fire_result_task_rule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT fk_fire_result_task_rule FOREIGN KEY (task_id, source_rule_id) REFERENCES public.wc_fire_rule_definition(task_id, rule_id);


--
-- Name: wc_fire_result_layer fk_fire_result_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT fk_fire_result_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_result_layer fk_fire_result_upstream; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT fk_fire_result_upstream FOREIGN KEY (task_id, upstream_result_id) REFERENCES public.wc_fire_result_layer(task_id, result_id);


--
-- Name: wc_fire_source_point fk_fire_source_point_quality_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT fk_fire_source_point_quality_dictionary FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_source_point fk_fire_source_point_type_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT fk_fire_source_point_type_dictionary FOREIGN KEY (source_type_code) REFERENCES public.wc_fire_source_type_dictionary(standard_code);


--
-- Name: wc_fire_use_event fk_fire_use_event_category_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_event
    ADD CONSTRAINT fk_fire_use_event_category_dictionary FOREIGN KEY (event_type, use_category_code) REFERENCES public.wc_fire_use_category_dictionary(event_type, category_code);


--
-- Name: wc_fire_weather_month fk_fire_weather_month_quality_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_weather_month
    ADD CONSTRAINT fk_fire_weather_month_quality_dictionary FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_forest_resource fk_forest_resource_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT fk_forest_resource_detail FOREIGN KEY (dominant_species_code, species_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_fire_forest_resource fk_forest_resource_species_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT fk_forest_resource_species_dictionary FOREIGN KEY (dominant_species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_fire_forest_resource fk_forest_resource_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT fk_forest_resource_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: CONSTRAINT fk_forest_resource_task_unit ON wc_fire_forest_resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT fk_forest_resource_task_unit ON public.wc_fire_forest_resource IS '森林资源关联的空间单元须属于同一评估任务；unit_id保留原可空规则。';


--
-- Name: wc_fire_fuel_code_dictionary fk_fuel_code_dictionary_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_code_dictionary
    ADD CONSTRAINT fk_fuel_code_dictionary_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_fuel_sample_plot fk_fuel_plot_task_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_fuel_plot_task_parent FOREIGN KEY (task_id, parent_plot_id) REFERENCES public.wc_fire_fuel_sample_plot(task_id, plot_id);


--
-- Name: wc_fire_fuel_sample fk_fuel_sample_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT fk_fuel_sample_detail FOREIGN KEY (species_code, species_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_fire_fuel_sample_plot fk_fuel_sample_plot_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_fuel_sample_plot_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_fuel_sample_plot fk_fuel_sample_plot_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_fuel_sample_plot_task FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_fuel_sample_plot fk_fuel_sample_plot_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_fuel_sample_plot_unit FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_fuel_sample fk_fuel_sample_species_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT fk_fuel_sample_species_dictionary FOREIGN KEY (species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_fire_fuel_sample fk_fuel_sample_task_plot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT fk_fuel_sample_task_plot FOREIGN KEY (task_id, plot_id) REFERENCES public.wc_fire_fuel_sample_plot(task_id, plot_id);


--
-- Name: wc_fire_fuel_unit fk_fuel_unit_combustibility_mapping; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT fk_fuel_unit_combustibility_mapping FOREIGN KEY (combustibility_mapping_id) REFERENCES public.wc_species_combustibility(mapping_id);


--
-- Name: wc_fire_history_event fk_history_event_cause_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT fk_history_event_cause_dictionary FOREIGN KEY (cause_code) REFERENCES public.wc_fire_history_cause_dictionary(cause_code);


--
-- Name: wc_fire_history_event fk_history_event_level_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT fk_history_event_level_dictionary FOREIGN KEY (fire_level_code) REFERENCES public.wc_fire_history_level_dictionary(level_code);


--
-- Name: wc_fire_history_event fk_history_event_quality_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT fk_history_event_quality_dictionary FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_indicator_value fk_indicator_value_parameter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT fk_indicator_value_parameter FOREIGN KEY (indicator_code, normalization_param_id) REFERENCES public.wc_normalization_parameter(indicator_code, param_id);


--
-- Name: wc_fire_indicator_value fk_indicator_value_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT fk_indicator_value_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_indicator_value fk_indicator_value_score_rule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT fk_indicator_value_score_rule FOREIGN KEY (task_id, score_rule_id) REFERENCES public.wc_fire_rule_definition(task_id, rule_id);


--
-- Name: wc_fire_indicator_value fk_indicator_value_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT fk_indicator_value_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_normalization_parameter fk_normalization_indicator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_normalization_parameter
    ADD CONSTRAINT fk_normalization_indicator FOREIGN KEY (indicator_code) REFERENCES public.wc_fire_indicator_definition(indicator_code);


--
-- Name: wc_forest_compartment fk_r15_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_compartment
    ADD CONSTRAINT fk_r15_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_fuel_code_dictionary fk_r15_parent_code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_code_dictionary
    ADD CONSTRAINT fk_r15_parent_code FOREIGN KEY (dict_type, parent_code, dictionary_version) REFERENCES public.wc_fire_fuel_code_dictionary(dict_type, dict_code, dictionary_version);


--
-- Name: wc_fire_economy_grid fk_r15_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT fk_r15_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_fuel_sample_plot fk_r15_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_r15_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_population_grid fk_r15_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT fk_r15_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_forest_resource_survey_raw fk_r15_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT fk_r15_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_forest_compartment fk_r15_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_compartment
    ADD CONSTRAINT fk_r15_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_economy_grid fk_r15_source_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT fk_r15_source_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_fuel_sample_plot fk_r15_source_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_r15_source_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_population_grid fk_r15_source_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT fk_r15_source_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_forest_resource_survey_raw fk_r15_source_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT fk_r15_source_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_biomass_conversion_parameter fk_r15_species; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_biomass_conversion_parameter
    ADD CONSTRAINT fk_r15_species FOREIGN KEY (species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_forest_resource_survey_raw fk_r15_species; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT fk_r15_species FOREIGN KEY (dominant_species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_forest_compartment fk_r15_task; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_compartment
    ADD CONSTRAINT fk_r15_task FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_economy_grid fk_r15_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT fk_r15_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_fuel_sample_plot fk_r15_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample_plot
    ADD CONSTRAINT fk_r15_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_population_grid fk_r15_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT fk_r15_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_forest_resource_survey_raw fk_r15_task_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT fk_r15_task_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_forest_compartment fk_r15_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_compartment
    ADD CONSTRAINT fk_r15_unit FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_result_layer fk_r18_zone_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT fk_r18_zone_parent FOREIGN KEY (task_id, parent_zone_result_id) REFERENCES public.wc_fire_result_layer(task_id, result_id);


--
-- Name: wc_special_population fk_special_population_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT fk_special_population_batch FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_special_population fk_special_population_quality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT fk_special_population_quality FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_special_population fk_special_population_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT fk_special_population_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_special_population fk_special_population_town; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT fk_special_population_town FOREIGN KEY (task_id, town_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_species_combustibility fk_species_combustibility_dictionary; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_combustibility
    ADD CONSTRAINT fk_species_combustibility_dictionary FOREIGN KEY (species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_species_combustibility fk_species_combustibility_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_combustibility
    ADD CONSTRAINT fk_species_combustibility_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_species_detail fk_species_detail_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_detail
    ADD CONSTRAINT fk_species_detail_parent FOREIGN KEY (catalog_species_code, parent_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_species_dictionary fk_species_dictionary_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_dictionary
    ADD CONSTRAINT fk_species_dictionary_source FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_forest_resource_survey_raw fk_survey_raw_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT fk_survey_raw_detail FOREIGN KEY (dominant_species_code, species_detail_id) REFERENCES public.wc_species_detail(catalog_species_code, detail_id);


--
-- Name: wc_biomass_conversion_parameter wc_biomass_conversion_parameter_source_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_biomass_conversion_parameter
    ADD CONSTRAINT wc_biomass_conversion_parameter_source_fk FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_compartment_weather wc_compartment_weather_spatial_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_compartment_weather
    ADD CONSTRAINT wc_compartment_weather_spatial_fk FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_compartment_weather wc_compartment_weather_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_compartment_weather
    ADD CONSTRAINT wc_compartment_weather_task_fk FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_quality_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_quality_code_fkey FOREIGN KEY (quality_code) REFERENCES public.wc_fire_quality_dictionary(quality_code);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_source_batch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_source_batch_fkey FOREIGN KEY (task_id, source_code, source_batch) REFERENCES public.wc_fire_task_source(task_id, source_code, source_batch);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_base_terrain wc_fire_base_terrain_task_unit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_base_terrain
    ADD CONSTRAINT wc_fire_base_terrain_task_unit_fkey FOREIGN KEY (task_id, unit_id) REFERENCES public.wc_fire_spatial_unit(task_id, unit_id);


--
-- Name: wc_fire_building_exposure wc_fire_building_exposure_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT wc_fire_building_exposure_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_building_exposure wc_fire_building_exposure_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_building_exposure
    ADD CONSTRAINT wc_fire_building_exposure_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_capacity_resource wc_fire_capacity_resource_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT wc_fire_capacity_resource_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_capacity_resource wc_fire_capacity_resource_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_resource
    ADD CONSTRAINT wc_fire_capacity_resource_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_capacity_team_detail wc_fire_capacity_team_detail_task_id_configuration_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_detail
    ADD CONSTRAINT wc_fire_capacity_team_detail_task_id_configuration_rule_id_fkey FOREIGN KEY (task_id, configuration_rule_id) REFERENCES public.wc_fire_rule_definition(task_id, rule_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_team_equipment wc_fire_capacity_team_equipme_task_id_configuration_rule_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_equipment
    ADD CONSTRAINT wc_fire_capacity_team_equipme_task_id_configuration_rule_i_fkey FOREIGN KEY (task_id, configuration_rule_id) REFERENCES public.wc_fire_rule_definition(task_id, rule_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: wc_fire_capacity_team_equipment wc_fire_capacity_team_equipment_p03_attribute_dict_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_capacity_team_equipment
    ADD CONSTRAINT wc_fire_capacity_team_equipment_p03_attribute_dict_id_fkey FOREIGN KEY (p03_attribute_dict_id) REFERENCES public.wc_fire_fuel_code_dictionary(dictionary_id);


--
-- Name: wc_fire_economy_grid wc_fire_economy_grid_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT wc_fire_economy_grid_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_economy_grid wc_fire_economy_grid_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT wc_fire_economy_grid_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_economy_grid wc_fire_economy_grid_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_economy_grid
    ADD CONSTRAINT wc_fire_economy_grid_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_forest_resource wc_fire_forest_resource_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT wc_fire_forest_resource_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_forest_resource wc_fire_forest_resource_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT wc_fire_forest_resource_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_forest_resource wc_fire_forest_resource_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_forest_resource
    ADD CONSTRAINT wc_fire_forest_resource_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_fuel_sample wc_fire_fuel_sample_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT wc_fire_fuel_sample_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_fuel_sample wc_fire_fuel_sample_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT wc_fire_fuel_sample_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_fuel_sample wc_fire_fuel_sample_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_sample
    ADD CONSTRAINT wc_fire_fuel_sample_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_fuel_unit wc_fire_fuel_unit_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT wc_fire_fuel_unit_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_fuel_unit wc_fire_fuel_unit_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT wc_fire_fuel_unit_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_fuel_unit wc_fire_fuel_unit_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_fuel_unit
    ADD CONSTRAINT wc_fire_fuel_unit_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_history_cause_dictionary wc_fire_history_cause_dictionary_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_cause_dictionary
    ADD CONSTRAINT wc_fire_history_cause_dictionary_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_history_event wc_fire_history_event_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT wc_fire_history_event_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_history_event wc_fire_history_event_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT wc_fire_history_event_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_history_event wc_fire_history_event_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_event
    ADD CONSTRAINT wc_fire_history_event_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_history_level_dictionary wc_fire_history_level_dictionary_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_history_level_dictionary
    ADD CONSTRAINT wc_fire_history_level_dictionary_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_indicator_definition wc_fire_indicator_definition_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_definition
    ADD CONSTRAINT wc_fire_indicator_definition_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_indicator_value wc_fire_indicator_value_indicator_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT wc_fire_indicator_value_indicator_code_fkey FOREIGN KEY (indicator_code) REFERENCES public.wc_fire_indicator_definition(indicator_code);


--
-- Name: wc_fire_indicator_value wc_fire_indicator_value_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_indicator_value
    ADD CONSTRAINT wc_fire_indicator_value_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_output_input wc_fire_output_input_indicator_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input
    ADD CONSTRAINT wc_fire_output_input_indicator_code_fkey FOREIGN KEY (indicator_code) REFERENCES public.wc_fire_indicator_definition(indicator_code);


--
-- Name: wc_fire_output_input wc_fire_output_input_output_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input
    ADD CONSTRAINT wc_fire_output_input_output_code_fkey FOREIGN KEY (output_code) REFERENCES public.wc_fire_output_catalog(output_code);


--
-- Name: wc_fire_output_input wc_fire_output_input_upstream_output_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_output_input
    ADD CONSTRAINT wc_fire_output_input_upstream_output_code_fkey FOREIGN KEY (upstream_output_code) REFERENCES public.wc_fire_output_catalog(output_code);


--
-- Name: wc_fire_population_grid wc_fire_population_grid_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT wc_fire_population_grid_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_population_grid wc_fire_population_grid_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT wc_fire_population_grid_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_population_grid wc_fire_population_grid_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_population_grid
    ADD CONSTRAINT wc_fire_population_grid_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_quality_dictionary wc_fire_quality_dictionary_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_quality_dictionary
    ADD CONSTRAINT wc_fire_quality_dictionary_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_result_layer wc_fire_result_layer_output_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT wc_fire_result_layer_output_code_fkey FOREIGN KEY (output_code) REFERENCES public.wc_fire_output_catalog(output_code);


--
-- Name: wc_fire_result_layer wc_fire_result_layer_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_result_layer
    ADD CONSTRAINT wc_fire_result_layer_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_rule_definition wc_fire_rule_definition_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_rule_definition
    ADD CONSTRAINT wc_fire_rule_definition_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_rule_definition wc_fire_rule_definition_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_rule_definition
    ADD CONSTRAINT wc_fire_rule_definition_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_source_point wc_fire_source_point_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT wc_fire_source_point_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_source_point wc_fire_source_point_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT wc_fire_source_point_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_source_point wc_fire_source_point_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_point
    ADD CONSTRAINT wc_fire_source_point_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_source_type_dictionary wc_fire_source_type_dictionary_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_source_type_dictionary
    ADD CONSTRAINT wc_fire_source_type_dictionary_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_spatial_unit wc_fire_spatial_unit_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_spatial_unit
    ADD CONSTRAINT wc_fire_spatial_unit_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_spatial_unit wc_fire_spatial_unit_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_spatial_unit
    ADD CONSTRAINT wc_fire_spatial_unit_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_task_source wc_fire_task_source_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_task_source
    ADD CONSTRAINT wc_fire_task_source_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_task_source wc_fire_task_source_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_task_source
    ADD CONSTRAINT wc_fire_task_source_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_use_category_dictionary wc_fire_use_category_dictionary_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_category_dictionary
    ADD CONSTRAINT wc_fire_use_category_dictionary_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_use_event wc_fire_use_event_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_event
    ADD CONSTRAINT wc_fire_use_event_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_use_event wc_fire_use_event_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_event
    ADD CONSTRAINT wc_fire_use_event_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_fire_use_event wc_fire_use_event_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_use_event
    ADD CONSTRAINT wc_fire_use_event_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_fire_weather_month wc_fire_weather_month_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_weather_month
    ADD CONSTRAINT wc_fire_weather_month_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_fire_weather_month wc_fire_weather_month_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_fire_weather_month
    ADD CONSTRAINT wc_fire_weather_month_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_forest_resource_survey_raw wc_forest_resource_survey_raw_source_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT wc_forest_resource_survey_raw_source_fk FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- Name: wc_forest_resource_survey_raw wc_forest_resource_survey_raw_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT wc_forest_resource_survey_raw_task_fk FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_forest_resource_survey_raw wc_forest_resource_survey_raw_unit_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_forest_resource_survey_raw
    ADD CONSTRAINT wc_forest_resource_survey_raw_unit_fk FOREIGN KEY (unit_id) REFERENCES public.wc_fire_spatial_unit(unit_id);


--
-- Name: wc_normalization_parameter wc_normalization_parameter_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_normalization_parameter
    ADD CONSTRAINT wc_normalization_parameter_task_fk FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_special_population wc_special_population_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_special_population
    ADD CONSTRAINT wc_special_population_task_fk FOREIGN KEY (task_id) REFERENCES public.wc_fire_assessment_task(task_id);


--
-- Name: wc_species_detail wc_species_detail_catalog_species_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_detail
    ADD CONSTRAINT wc_species_detail_catalog_species_code_fkey FOREIGN KEY (catalog_species_code) REFERENCES public.wc_species_dictionary(species_code);


--
-- Name: wc_species_detail wc_species_detail_source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wc_species_detail
    ADD CONSTRAINT wc_species_detail_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.wc_fire_source_registry(source_code);


--
-- PostgreSQL database dump complete
--

\unrestrict YCPXArUjVHuZAwnxRFhKQCJQgIacPs2pjRyQdMSOPXt5jYq80kvHWyDvHVNuMIF

