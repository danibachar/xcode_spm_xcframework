# xcode_spm_xcframework
This repo show case an interesting issue with xcode when using SPM and XCFramework combined with implict imports cause an duplicated library


## Use case

We have the following use case, a Simple project

- One XCFramework `C`, which hosts the class `C`
- One SPM Module, hosting two libraries `A` and `B`, each one defining corresponding class
- One testing app


The dependency graph between the different package is defined in the following figure:

<!-- <p align="left"> 
  <img width="556" height="656" src="./ReadmeAssets/SPM-XCFramework.jpg">
</p> -->
 <!-- ![Dependency Graph](./ReadmeAssets/SPM-XCFramework.jpg) 556 × 656 --> 

<img align="right" width="556" height="656" src="./ReadmeAssets/SPM-XCFramework.jpg">

* `B` depends on `A` i.e (B->A).
* `C` depends (directly) on `B` i.e (C->B).
* `C` depends (directly) on `A` i.e (C->A).
* The `Test` app depends on all modules `A`, `B`, and `C`.

In this repo we have several branches that research different scenarios and build configuration to understand how it is best to ship applications with similar modules mix and hierarchy.

### Branch - main

On the `main` branch we have the default setup, where we started our journy.
We configured the targets linking and embeddig explictly. i.e:

* We link the app against `A`, `B`, and `C`
* The app is depending on C as a target dependency
* We embed the `C` framework with the app as well

* `A` and `B` schemes are auto generated by SPM and configured automaticall
* The `C` is linked against `A` and `B`


### Branch - static testing
