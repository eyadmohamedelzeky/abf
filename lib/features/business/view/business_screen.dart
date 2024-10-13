import 'package:abf_ather/features/business/controller/business_controller.dart';
import 'package:abf_ather/features/business/controller/business_state.dart';
import 'package:abf_ather/features/business/view/widgets/custom_business_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessController()..getBusiness(),
      child: Scaffold(
        body: BlocBuilder<BusinessController, BusinessState>(
          builder: (context, state) {
            if (state is BusinessLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BusinessSuccessState) {
              final businessResponse =
                  BusinessController.get(context).businessResponse;
              return SafeArea(
                child: ListView.builder(
                  itemCount:
                      1, // For now, we're displaying just 1 BusinessResponseModel
                  itemBuilder: (context, index) {
                    return CustomBusinessCard(
                        businessResponseModel: businessResponse!);
                  },
                ),
              );
            } else if (state is BusinessErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
