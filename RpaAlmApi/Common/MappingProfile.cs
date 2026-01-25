using AutoMapper;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Common;

/// <summary>
/// AutoMapper profile for mapping between domain models and DTOs
/// </summary>
public class MappingProfile : Profile
{
    public MappingProfile()
    {
        // RpaStatus mappings
        CreateMap<RpaStatus, RpaStatusDto>();
        CreateMap<RpaStatusCreateRequest, RpaStatus>();
        CreateMap<RpaStatusUpdateRequest, RpaStatus>();

        // Region mappings
        CreateMap<Region, RegionDto>();
        CreateMap<RegionCreateRequest, Region>();
        CreateMap<RegionUpdateRequest, Region>();

        // Function mappings
        CreateMap<Function, FunctionDto>();
        CreateMap<FunctionCreateRequest, Function>();
        CreateMap<FunctionUpdateRequest, Function>();

        // Complexity mappings
        CreateMap<Complexity, ComplexityDto>();
        CreateMap<ComplexityCreateRequest, Complexity>();
        CreateMap<ComplexityUpdateRequest, Complexity>();

        // Segment mappings
        CreateMap<Segment, SegmentDto>();
        CreateMap<SegmentCreateRequest, Segment>();
        CreateMap<SegmentUpdateRequest, Segment>();

        // Medal mappings
        CreateMap<Medal, MedalDto>();
        CreateMap<MedalCreateRequest, Medal>();
        CreateMap<MedalUpdateRequest, Medal>();

        // Enhancement mappings
        CreateMap<Enhancement, EnhancementDto>();
        CreateMap<EnhancementCreateRequest, Enhancement>();
        CreateMap<EnhancementUpdateRequest, Enhancement>();

        // SlaItemType mappings
        CreateMap<SlaItemType, SlaItemTypeDto>();
        CreateMap<SlaItemTypeCreateRequest, SlaItemType>();
        CreateMap<SlaItemTypeUpdateRequest, SlaItemType>();

        // AutomationEnvironmentType mappings
        CreateMap<AutomationEnvironmentType, AutomationEnvironmentTypeDto>();
        CreateMap<AutomationEnvironmentTypeCreateRequest, AutomationEnvironmentType>();
        CreateMap<AutomationEnvironmentTypeUpdateRequest, AutomationEnvironmentType>();

        // ADDomain mappings
        CreateMap<ADDomain, ADDomainDto>();
        CreateMap<ADDomainCreateRequest, ADDomain>();
        CreateMap<ADDomainUpdateRequest, ADDomain>();

        // StoryPointCost mappings
        CreateMap<StoryPointCost, StoryPointCostDto>();
        CreateMap<StoryPointCostCreateRequest, StoryPointCost>();
        CreateMap<StoryPointCostUpdateRequest, StoryPointCost>();

        // JjedsHelper mappings
        CreateMap<JjedsHelper, JjedsHelperDto>();
        CreateMap<JjedsHelperCreateRequest, JjedsHelper>();
        CreateMap<JjedsHelperUpdateRequest, JjedsHelper>();

        // CmdbHelper mappings
        CreateMap<CmdbHelper, CmdbHelperDto>();
        CreateMap<CmdbHelperCreateRequest, CmdbHelper>();
        CreateMap<CmdbHelperUpdateRequest, CmdbHelper>();

        // Automation mappings
        CreateMap<Automation, AutomationDto>();
        CreateMap<AutomationCreateRequest, Automation>();
        CreateMap<AutomationUpdateRequest, Automation>();

        // SlaMaster mappings
        CreateMap<SlaMaster, SlaMasterDto>();
        CreateMap<SlaMasterCreateRequest, SlaMaster>();
        CreateMap<SlaMasterUpdateRequest, SlaMaster>();

        // SlaItem mappings
        CreateMap<SlaItem, SlaItemDto>();
        CreateMap<SlaItemCreateRequest, SlaItem>();
        CreateMap<SlaItemUpdateRequest, SlaItem>();

        // VirtualIdentity mappings
        CreateMap<VirtualIdentity, VirtualIdentityDto>();
        CreateMap<VirtualIdentityCreateRequest, VirtualIdentity>();
        CreateMap<VirtualIdentityUpdateRequest, VirtualIdentity>();

        // AutomationEnvironment mappings
        CreateMap<AutomationEnvironment, AutomationEnvironmentDto>();
        CreateMap<AutomationEnvironmentCreateRequest, AutomationEnvironment>();
        CreateMap<AutomationEnvironmentUpdateRequest, AutomationEnvironment>();

        // EnhancementUserStory mappings
        CreateMap<EnhancementUserStory, EnhancementUserStoryDto>();
        CreateMap<EnhancementUserStoryCreateRequest, EnhancementUserStory>();
        CreateMap<EnhancementUserStoryUpdateRequest, EnhancementUserStory>();

        // AutomationLogEntry mappings
        CreateMap<AutomationLogEntry, AutomationLogEntryDto>();
        CreateMap<AutomationLogEntryCreateRequest, AutomationLogEntry>();
        CreateMap<AutomationLogEntryUpdateRequest, AutomationLogEntry>();

        // SlaLogEntry mappings
        CreateMap<SlaLogEntry, SlaLogEntryDto>();
        CreateMap<SlaLogEntryCreateRequest, SlaLogEntry>();
        CreateMap<SlaLogEntryUpdateRequest, SlaLogEntry>();

        // ViAssignments mappings
        CreateMap<ViAssignments, ViAssignmentsDto>();
        CreateMap<ViAssignmentsCreateRequest, ViAssignments>();
        CreateMap<ViAssignmentsUpdateRequest, ViAssignments>();
    }
}
