####################################
# Model                            #
####################################
# Importing libraries


library(caret)

# Importing the data set
student <- read.csv("students_preprocessed_V3.csv" )

set.seed(100)

# Performs stratified random split of the data set
TrainingIndex <- createDataPartition(student$G3, p=0.8, list = FALSE)
TrainingSet <- student[TrainingIndex,] # Training Set
TestingSet <- student[-TrainingIndex,] # Test Set

write.csv(TrainingSet, "studenttraining.csv")
write.csv(TestingSet, "studenttesting.csv")

TrainSet <- read.csv("students_preprocessed_V3.csv", header = TRUE)
TrainSet <- TrainSet[,-1]

# Building Linear Regression Model


model <- train(G3 ~ ., data = TrainSet,
               method = "lm",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"))

# Apply model for prediction
Model.training <-predict(model, TrainSet) # Apply model to make prediction on Training set
Model.testing <-predict(model, TestingSet) # Apply model to make prediction on Testing set

Importance <- varImp(model,scale=FALSE)
plot(Importance)
# Model performance (Displays scatter plot and performance metrics)
# Scatter plot of Training set
plot(TrainSet$G3,Model.training, col = "blue" )
plot(TestingSet$G3,Model.testing, col = "blue" )

#Model performance summary of training set

mse1 = mean((TrainSet$G3 - Model.training)^2)
mae1 = caret::MAE(TrainSet$G3, Model.training)
rmse1 = caret::RMSE(TrainSet$G3, Model.training)
SSE1 <- sum((TrainSet$G3 - Model.training)**2)
SSR1 <- sum((Model.training - mean(TrainSet$G3)) ** 2)
R2_1 <- 1 - SSE1/(SSE1 + SSR1)

cat("MSE: ", mse1, "MAE: ", mae1, " RMSE: ", rmse1, "R2", R2_1)

#Model performance summary of training set
mse2 = mean((TestingSet$G3 - Model.testing)^2)
mae2 = caret::MAE(TestingSet$G3, Model.testing)
rmse2 = caret::RMSE(TestingSet$G3, Model.testing)
SSE2 <- sum((TestingSet$G3 - Model.testing)**2)
SSR2 <- sum((Model.testing - mean(TestingSet$G3)) ** 2)
R2_2 <- 1 - SSE1/(SSE1 + SSR1)

cat("MSE: ", mse2, "MAE: ", mae2, " RMSE: ", rmse2, "R2", R2_2)


# Save model to RDS file
saveRDS(model, "studentmodel.rds")
