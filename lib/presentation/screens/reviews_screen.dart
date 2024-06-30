import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.08),
                              radius: 15,
                              child: Icon(
                                  Icons.person_outlined,
                                color: Colors.black54,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Anujit Datta',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'fsdhv vsoivsdf vosdivyhsdv sdhvoyuhsv svhsoi uihgsdv fsdhv vsoivsdf vosdivyhsdv sdhvoyuhsv svhsoi uihgsdv fsdhv vsoivsdf vosdivyhsdv sdhvoyuhsv svhsoi'
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context,_){
                return SizedBox(height: 10,);
              },
            ),
          ),
          ReviewsCount(),
        ],
      ),
    );
  }
}

class ReviewsCount extends StatelessWidget {
  const ReviewsCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: AppColors.primaryColor.withOpacity(0.15)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reviews (420)',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight:
                    FontWeight.w600,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),

                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
