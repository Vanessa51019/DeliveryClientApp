const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

const firestore = admin.firestore();
const settings = { timestampInSnapshots: true };
firestore.settings(settings)
const stripe = require('stripe')('sk_test_NnZRVzfvdcEz9pcvCUyzxndm001aTf6Yeg');
exports.createPaymentIntent = functions.https.onCall(async (data, context) => {
    var customerDetails = await stripe.customers.create({
        description: "A Quizzer Customer",
        payment_method: data.payment_method
    })
    var response = await stripe.paymentIntents.create({
    amount: data.amount,
    currency: data.currency,
    payment_method_types: ['card'],
    customer: customerDetails.id,
    payment_method: data.payment_method
  });

  return {customerDetails: customerDetails,paymentIntentDetails: response}
});

exports.chargeExistingCustomer = functions.https.onCall(async (data, context) => {

   var customerPaymentMethods = await stripe.paymentMethods.list({
       customer: data.customer_id,
       type: "card"
   });

   if(customerPaymentMethods.data.length > 0){
       return stripe.paymentIntents.create({
        amount: data.amount,
        currency: data.currency,
        payment_method_types: ['card'],
        customer: data.customer_id,
        payment_method: customerPaymentMethods.data[0].id
       })
   }
   else{
       return "no_payment_method";
   }
    
});


exports.createCustomerWithoutCharge = functions.https.onCall(async (data, context) => {

    return stripe.customers.create({
        description: "A Quizzer Customer",
        payment_method: data.payment_method
    })
    
});

exports.deleteCustomer = functions.https.onCall(async (data, context) => {

   var response = await stripe.customers.del({
       customer: data.customer_id,
   });
   return response.deleted;

    
});


