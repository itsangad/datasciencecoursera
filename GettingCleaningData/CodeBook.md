---
title: "CodeBook"
author: "Angad Ahuja"
date: "9/28/2020"
output:
  html_document: default
---

```This codebook is part of the assignment for Getting and Cleaning Data Course Project
```

### Data Sets used

This project uses following data sets (flat files) that can all be found inside the downloaded dataset, namely <b>URI HAR Dataset.</b></br>
  <ul>
  <li> Features    --  X_train.txt and Y_test.txt </li>
  <li> Activities  --  Y_train.txt and X_test.txt </li>
  <li> Subject     --  subject_train.txt and subject_test.txt </li>
  <li> Labels      --  features.txt and activity_labels.txt
  </ul> </br>
  
### Files Details

* <b> Features Data </b> 
  <ul>
  <li> <b> X_train.txt </b> has 561 _variables_ and 7352 _observations_ </li>
  <li> <b> Y_test.txt </b> has 1 _variables_ and 2947 _observations_ </li>
  </ul>
* <b> Activities Data </b> 
  <ul>
  <li> <b> Y_train.txt </b> has 1 _variables_ and 7352 _observations_ </li>
  <li> <b> X_test.txt </b> has 561 _variables_ and 2947 _observations_ </li>
  </ul>
* <b> Subject Data </b> 
  <ul>
  <li> <b> subject_train.txt </b> has 1 _variables_ and 7352 _observations_ </li>
  <li> <b> subject_test.txt </b> has 1 _variables_ and 2947 _observations_ </li>
  </ul>
* <b> Labels Data </b> 
  <ul>
  <li> <b> features.txt </b> has 2 _variables_ and 561 _observations_ </li>
  <li> <b> activity_labels.txt </b> has 2 _variables_ and 6 _observations_ </li>
  </ul>

### Script Variables

* <b> Total Features Data </b> has 561 _variables and _observations_ is the sum of 7352 and 2947 which 10299
    <ul>
      <li> Only "mean" and "std" features are kept (66 variables) and rest are filtered out</li>
    </ul>
  
* <b> Total Activities Data </b> has 1 _variables and _observations_ is the sum of 7352 and 2947 which 10299 

* <b> Total Subject Data </b> has 1 _variables and _observations_ is the sum of 7352 and 2947 which 10299 
  
* <b> Labels Data </b> 
  <ul>
  <li> <b> features.txt </b> has 2 _variables_ and 561 _observations_ </li>
  <li> <b> activity_labels.txt </b> has 2 _variables_ and 6 _observations_ </li>
  </ul>

### Code Explanation
The step by step explanation is given in the READ_ME.txt file
