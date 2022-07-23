# Fractional_RDF
MATLAB Codes used to calculate Fractional Cumulative RDF for determine Atomic Ordering in HEA/ binary APT Datasets

## Assessment of Atomic ordering in Alloys

#### Introduction

High Entropy Alloys (HEAs), alloys made with equal proportions of five or more elements, present unique challenges in materials research. HEA display the promise of superior mechanical properties, properties that could significantly change the field of material science if made accessible. Despite the potential of this material, they have a unique complexity due to the equal element proportions that they are composed of, meaning the complexity of their structure prevents a clear description of their atomic ordering. Because of the direct connection between processing, structure, and processing in Materials Science, an unambiguous understanding of the structure of HEAs is necessary to unlock the benefits of their mechanical properties.

![BCC HEA](/res/BCC_HEA.png)

[Sample BCC Structure of High Entropy Alloy](https://www.sciencedirect.com/science/article/abs/pii/S0079642513000789)

#### Atom Probe Tomography
Atom probe tomography (APT) is a technique to obtain the type and coordinates of atoms in a large-scale set. [Even with this technique, the generated data sets only contain 33% of the original atoms, with some being labeled as ‘X’ or unrecognizable](https://www.cambridge.org/core/journals/microscopy-and-microanalysis/article/abs/spatial-resolution-in-atom-probe-tomography/ABBF7C475B485559D50D8A8F9DFE96E8). In addition, the resulting data also contains the presence of noise on a scale of Angstroms. Despite these shortcomings, the relatively large scale that APT draws its data from helps to negate these interferences, meaning that trends obtained from APT data are still reliable. 

![HEA APT](/res/HEA_APT.png)

[APT Data Set Obtained From HEA](https://www.nature.com/articles/ncomms6964)

#### Cumulative Radial Distribution Function
One current method that assists in the visualization of atomic order is the [Radial Distribution Function](https://en.wikipedia.org/wiki/Radial_distribution_function) (RDF). Through an RDF, it is possible to see how density varies with respect to distance. Though atomic ordering can be difficult to visualize in a normal RDF, converting the RDF to a Fractional Cumulative RDF allows for greater visibility of the local composition.

![CFRDF](/res/CFRDF.png)

A metric to measure deviation in the FCRDF, called the atomic ordering metric, FA,O, is conveyed as:

![FAO](/res/FAO.png)

This metric was selected because calculating the standard deviation of a local average weighs the sharp changes prevalent in APT data sets with little spatial uncertainty over those with smoother curves.

#### Validation through Synthetic Data

The FCRDF technique was applied to synthetic Ni<sub>3</sub>Al APT data sets and was capable of successfully identifying true negatives (the absence of chemical ordering) and indicates the levels of noise in APT data that would result in a false negative. The FCRDF is also capable of returning true positive identification of atomic ordering in data sets with little or no noise regardless of the abundance. However, the presence of sufficient noise can smear out the information in the FCRDF resulting in a false negative, namely the failure to correctly identify the presence of atomic ordering. 

![Synthetic Validation](/res/Synthetic.png)

#### Results
[The FCRDF process was also applied to an APT sample of Ni<sub>3</sub>Al](https://www.nature.com/articles/ncomms6964). The noise in the spatial coordinates of the atoms smears out much of the atomic ordering signature. Careful evaluation of the experimental APT data and comparison with synthetic data sets of comparable uncertainty and abundance suggests that the resolution of the APT instrument used here does not provide unambiguous confirmation of atomic ordering. 

![APT Results](/res/Results_1.png)

After validating this methods ability to detect local ordering in conditions of low noise, it was extended to the APT data set for the high entropy alloy, Al1.3CoCrCuFeNi. The aggregation of Cu can be clearly observed in our FCRDF data generated using experimental APT data, as an enrichment in the Cu atom fraction around Cu. 

![HEA Results](/res/Results_2.png)

#### Conclusions
In APT Data, the ability to extract atomic ordering is hampered by uncertainty in spatial coordinates to a much greater extent than by fraction of atoms resolved. With modest noise, the FCRDF approach can robustly identify atomic ordering with only 40% of the atoms resolved. Approaches for improving the quantitative characterization of atomic ordering in APT data sets are necessary for conclusive preferred nearest neighbor identification.


##### Future Work
APT data has higher resolution in the z spatial dimension. When viewed from different orientations that are aligned with the z-axis, crystals display different visible compositions. [These two interdependent facts have been used to display the presence of atomic ordering in the CoCrNi medium-entropy alloy](https://www.researchgate.net/publication/353941359_Direct_observation_of_local_chemical_ordering_in_a_few_nanometer_range_in_CoCrNi_medium-entropy_alloy_by_atom_probe_tomography_and_its_impact_on_mechanical_properties). A proposal to use this method to characterize atomic ordering of Aluminum Cerium APT data is currently underway. 


