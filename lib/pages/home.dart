import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styleme_thesis/pages/mode.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use Stack to overlay the image on the background
        children: [
          Column(
            children: [
              Flexible(
                flex: 40,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [gradient1Color, gradient2Color],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 60,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            // Use Positioned directly without Positioned.fill
            top: 330, // 40 pixels from the bottom
            left: 20,
            right: 20, // Expand horizontally
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/lines.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            // Use Positioned directly without Positioned.fill
            top: 140, // 40 pixels from the bottom
            left: 20,
            right: 20, // Expand horizontally
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/stylelogo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            // Use Positioned directly without Positioned.fill
            bottom: 200, // 40 pixels from the bottom
            left: 20,
            right: 20, // Expand horizontally
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.string(
                '''
                <svg width="216" height="69" viewBox="0 0 216 69" fill="none" xmlns="http://www.w3.org/2000/svg">
<mask id="path-1-outside-1_207_114" maskUnits="userSpaceOnUse" x="0" y="0" width="216" height="70" fill="black">
<rect fill="white" width="216" height="70"/>
<path d="M14.2609 57.8C11.7543 57.8 9.62094 57.4533 7.86094 56.76C6.15427 56.0133 4.7676 55.0267 3.70094 53.8C2.6876 52.5733 1.94094 51.16 1.46094 49.56C0.980938 47.96 0.740938 46.28 0.740938 44.52C0.740938 43.72 0.767604 42.92 0.820938 42.12C0.927604 41.32 1.06094 40.4933 1.22094 39.64H6.66094C6.55427 40.4933 6.4476 41.3467 6.34094 42.2C6.2876 43.0533 6.26094 43.8533 6.26094 44.6C6.26094 46.1467 6.4476 47.56 6.82094 48.84C7.2476 50.0667 8.02094 51.0533 9.14094 51.8C10.2609 52.5467 11.8609 52.92 13.9409 52.92C16.0743 52.92 17.7543 52.5733 18.9809 51.88C20.2076 51.1867 21.0876 50.28 21.6209 49.16C22.2076 48.04 22.5009 46.8133 22.5009 45.48C22.5009 44.0933 22.1809 42.8933 21.5409 41.88C20.9543 40.8667 20.1543 39.9333 19.1409 39.08C18.1276 38.2267 16.9809 37.4 15.7009 36.6C14.4209 35.8 13.1143 34.9733 11.7809 34.12C10.3943 33.2133 9.03427 32.2267 7.70094 31.16C6.42094 30.0933 5.2476 28.8667 4.18094 27.48C3.11427 26.04 2.26094 24.3867 1.62094 22.52C0.980938 20.6 0.660938 18.4133 0.660938 15.96C0.660938 12.9733 1.22094 10.3333 2.34094 8.04C3.51427 5.74666 5.1676 3.96 7.30094 2.68C9.43427 1.34666 11.9676 0.679996 14.9009 0.679996C18.6343 0.679996 21.4609 1.45333 23.3809 3C25.3543 4.49333 26.6876 6.44 27.3809 8.84C28.1276 11.24 28.5009 13.7733 28.5009 16.44C28.5009 17.5067 28.4476 18.5733 28.3409 19.64C28.2876 20.6533 28.2076 21.6667 28.1009 22.68C27.9943 23.64 27.8876 24.5733 27.7809 25.48H21.9409C22.1543 24.0933 22.3409 22.6267 22.5009 21.08C22.6609 19.5333 22.7409 17.9867 22.7409 16.44C22.7409 14.52 22.5276 12.76 22.1009 11.16C21.6743 9.50666 20.8743 8.2 19.7009 7.24C18.5809 6.22666 16.9276 5.72 14.7409 5.72C13.1943 5.72 11.8876 6.01333 10.8209 6.6C9.75427 7.13333 8.90094 7.90667 8.26094 8.92C7.62094 9.88 7.14094 11 6.82094 12.28C6.55427 13.5067 6.42094 14.8133 6.42094 16.2C6.42094 18.4933 6.82094 20.4667 7.62094 22.12C8.42094 23.72 9.4876 25.1333 10.8209 26.36C12.1543 27.5333 13.5943 28.6267 15.1409 29.64C16.6876 30.6 18.2343 31.56 19.7809 32.52C21.3276 33.48 22.7409 34.52 24.0209 35.64C25.3543 36.76 26.3943 38.0667 27.1409 39.56C27.9409 41.0533 28.3409 42.84 28.3409 44.92C28.3409 47.48 27.7543 49.7467 26.5809 51.72C25.4609 53.64 23.8609 55.1333 21.7809 56.2C19.7009 57.2667 17.1943 57.8 14.2609 57.8ZM46.1709 57.8C44.0909 57.8 42.4109 57.48 41.1309 56.84C39.8509 56.2 38.8376 55.32 38.0909 54.2C37.3976 53.0267 36.9176 51.6933 36.6509 50.2C36.3843 48.7067 36.2509 47.1067 36.2509 45.4C36.2509 44.3333 36.2509 43.16 36.2509 41.88C36.3043 40.6 36.3309 39.2133 36.3309 37.72C36.3843 36.2267 36.4376 34.68 36.4909 33.08C36.5443 31.3733 36.5976 29.6133 36.6509 27.8C36.7043 25.9333 36.7576 24.0933 36.8109 22.28C36.8643 20.4133 36.8909 18.5733 36.8909 16.76C36.9443 14.9467 36.9976 13.1867 37.0509 11.48C37.1043 9.77333 37.1309 8.17333 37.1309 6.68L43.2909 6.04C43.1309 7.48 42.9709 9.26666 42.8109 11.4C42.7043 13.48 42.5709 15.8 42.4109 18.36C42.3043 20.8667 42.1709 23.4267 42.0109 26.04C41.9043 28.6533 41.7976 31.16 41.6909 33.56C41.5843 35.8 41.5043 37.8533 41.4509 39.72C41.3976 41.5333 41.3709 43.0267 41.3709 44.2C41.3709 46.1733 41.4776 47.8533 41.6909 49.24C41.9576 50.6267 42.4376 51.6933 43.1309 52.44C43.8243 53.1333 44.8376 53.48 46.1709 53.48C48.0376 53.48 49.3709 53.0533 50.1709 52.2C51.0243 51.2933 51.5576 50.12 51.7709 48.68C52.0376 47.1867 52.1709 45.56 52.1709 43.8C52.1709 43.2667 52.1443 42.7333 52.0909 42.2C52.0909 41.6133 52.0643 41.0267 52.0109 40.44C51.9576 39.8533 51.9043 39.2667 51.8509 38.68L56.6509 37.56C56.7576 38.68 56.8376 39.7733 56.8909 40.84C56.9976 41.9067 57.0509 42.9467 57.0509 43.96C57.0509 46.7333 56.6776 49.16 55.9309 51.24C55.1843 53.2667 54.0109 54.8667 52.4109 56.04C50.8109 57.2133 48.7309 57.8 46.1709 57.8ZM32.1709 17.32L32.6509 12.68C32.5443 12.68 32.9443 12.68 33.8509 12.68C34.8109 12.68 35.9576 12.7067 37.2909 12.76C38.6776 12.76 39.9309 12.76 41.0509 12.76C42.2243 12.76 42.9176 12.76 43.1309 12.76C44.0376 12.76 45.0776 12.76 46.2509 12.76C47.4776 12.7067 48.7309 12.68 50.0109 12.68C51.2909 12.6267 52.5176 12.6 53.6909 12.6C54.9176 12.5467 56.0109 12.52 56.9709 12.52L56.4909 16.6C55.9043 16.6 55.2376 16.6267 54.4909 16.68C53.7443 16.68 52.9443 16.68 52.0909 16.68C51.2909 16.68 50.4376 16.7067 49.5309 16.76C48.6776 16.76 47.8243 16.7867 46.9709 16.84C46.1176 16.84 45.3176 16.84 44.5709 16.84C43.3443 16.84 41.9576 16.8933 40.4109 17C38.8643 17.0533 37.3709 17.1067 35.9309 17.16C34.4909 17.2133 33.2376 17.2667 32.1709 17.32ZM74.9247 68.84L69.0047 68.68C69.5914 66.8133 70.1514 64.9467 70.6847 63.08C71.218 61.2133 71.7247 59.3467 72.2047 57.48C72.6847 55.6667 73.138 53.8533 73.5647 52.04C74.0447 50.1733 74.498 48.3333 74.9247 46.52C75.4047 44.6533 75.858 42.7867 76.2847 40.92C76.7114 39.0533 77.138 37.16 77.5647 35.24C78.098 32.84 78.6047 30.4133 79.0847 27.96C79.618 25.5067 80.1247 23 80.6047 20.44C81.138 17.8267 81.6447 15.1867 82.1247 12.52H88.1247C87.698 14.2267 87.2447 16.0133 86.7647 17.88C86.2847 19.6933 85.8047 21.5867 85.3247 23.56C84.8447 25.5333 84.338 27.56 83.8047 29.64C83.3247 31.6667 82.8447 33.72 82.3647 35.8C81.8314 38.04 81.298 40.3067 80.7647 42.6C80.2314 44.8933 79.7247 47.1867 79.2447 49.48C78.7647 51.72 78.258 53.96 77.7247 56.2C77.2447 58.3867 76.7647 60.5467 76.2847 62.68C75.858 64.8133 75.4047 66.8667 74.9247 68.84ZM72.6847 57.72C72.3647 56.3867 72.018 55.0267 71.6447 53.64C71.2714 52.2533 70.898 50.84 70.5247 49.4C70.1514 47.9067 69.7514 46.4133 69.3247 44.92C68.898 43.3733 68.4714 41.8 68.0447 40.2C67.618 38.6 67.1914 37 66.7647 35.4C66.2847 33.5867 65.778 31.7733 65.2447 29.96C64.7647 28.0933 64.258 26.2267 63.7247 24.36C63.2447 22.4933 62.738 20.6267 62.2047 18.76C61.6714 16.84 61.138 14.92 60.6047 13L66.7647 12.76C67.3514 15.5333 67.9114 18.1733 68.4447 20.68C68.978 23.1333 69.5114 25.5067 70.0447 27.8C70.6314 30.0933 71.218 32.3333 71.8047 34.52C72.2314 36.1733 72.6314 37.8267 73.0047 39.48C73.4314 41.08 73.8314 42.68 74.2047 44.28C74.6314 45.88 75.058 47.48 75.4847 49.08C75.9647 50.68 76.4447 52.3067 76.9247 53.96L72.6847 57.72ZM94.1359 56.84C94.1893 55.6133 94.2159 53.96 94.2159 51.88C94.2693 49.8 94.2959 47.48 94.2959 44.92C94.3493 42.3067 94.3759 39.5867 94.3759 36.76C94.3759 33.9333 94.3759 31.16 94.3759 28.44C94.3759 26.36 94.3759 24.12 94.3759 21.72C94.3759 19.32 94.3493 16.9467 94.2959 14.6C94.2959 12.2 94.2693 9.93333 94.2159 7.8C94.2159 5.61333 94.2159 3.72 94.2159 2.12L100.136 1.48C100.083 2.81333 100.003 4.30666 99.8959 5.96C99.8426 7.61333 99.7626 9.4 99.6559 11.32C99.6026 13.1867 99.5493 15.1067 99.4959 17.08C99.4426 19.0533 99.3893 21 99.3359 22.92C99.3359 24.84 99.3359 26.6533 99.3359 28.36C99.3359 31.1867 99.3626 34.36 99.4159 37.88C99.5226 41.4 99.6293 44.84 99.7359 48.2C99.8959 51.56 100.029 54.44 100.136 56.84H94.1359ZM120.248 57.96C117.208 57.96 114.835 57.1067 113.128 55.4C111.475 53.64 110.275 51.2933 109.528 48.36C108.995 46.3333 108.622 44.0933 108.408 41.64C108.248 39.1867 108.168 36.6 108.168 33.88C108.168 31.96 108.222 30.0933 108.328 28.28C108.488 26.4667 108.755 24.7867 109.128 23.24C109.875 19.88 111.182 17.16 113.048 15.08C114.915 12.9467 117.608 11.88 121.128 11.88C123.475 11.88 125.368 12.4133 126.808 13.48C128.302 14.5467 129.395 16.0933 130.088 18.12C130.782 20.1467 131.128 22.6267 131.128 25.56C131.128 27.0533 131.022 28.7067 130.808 30.52C130.648 32.3333 130.435 34.1467 130.168 35.96L125.528 31.88C125.688 30.4933 125.822 29.16 125.928 27.88C126.035 26.6 126.088 25.4 126.088 24.28C126.088 22.6267 125.928 21.2133 125.608 20.04C125.288 18.8667 124.728 17.96 123.928 17.32C123.182 16.6267 122.088 16.28 120.648 16.28C118.622 16.28 117.102 17.16 116.088 18.92C115.075 20.68 114.355 22.9733 113.928 25.8C113.768 27.0267 113.635 28.3333 113.528 29.72C113.475 31.1067 113.448 32.52 113.448 33.96C113.448 35.5067 113.448 37.0267 113.448 38.52C113.502 39.96 113.582 41.3467 113.688 42.68C113.795 43.96 113.955 45.16 114.168 46.28C114.595 48.4667 115.288 50.2267 116.248 51.56C117.262 52.84 118.702 53.48 120.568 53.48C122.008 53.48 123.155 53.1333 124.008 52.44C124.915 51.7467 125.555 50.8133 125.928 49.64C126.302 48.4133 126.488 47.0533 126.488 45.56C126.488 45.0267 126.462 44.4933 126.408 43.96C126.408 43.3733 126.355 42.7867 126.248 42.2H130.968C131.075 42.84 131.128 43.48 131.128 44.12C131.182 44.7067 131.208 45.2933 131.208 45.88C131.208 48.28 130.808 50.3867 130.008 52.2C129.262 54.0133 128.062 55.4267 126.408 56.44C124.808 57.4533 122.755 57.96 120.248 57.96ZM110.328 36.52L110.248 31.8L130.168 31.64V35.96C130.168 35.96 129.742 35.96 128.888 35.96C128.088 35.96 126.995 35.9867 125.608 36.04C124.275 36.0933 122.728 36.1467 120.968 36.2C119.262 36.2 117.475 36.2267 115.608 36.28C113.795 36.3333 112.035 36.4133 110.328 36.52ZM139.608 57.08C139.662 55.32 139.688 53.3733 139.688 51.24C139.742 49.1067 139.768 46.8667 139.768 44.52C139.822 42.12 139.848 39.6667 139.848 37.16C139.848 34.6 139.848 32.04 139.848 29.48C139.848 26.8133 139.848 24.1733 139.848 21.56C139.848 18.9467 139.848 16.4133 139.848 13.96C139.848 11.5067 139.822 9.16 139.768 6.92C139.768 4.68 139.742 2.65333 139.688 0.839998L147.928 0.679996C148.302 2.38666 148.728 4.30666 149.208 6.44C149.688 8.57333 150.222 10.8667 150.808 13.32C151.395 15.72 151.982 18.2 152.568 20.76C153.208 23.32 153.848 25.88 154.488 28.44C155.022 30.5733 155.528 32.68 156.008 34.76C156.542 36.7867 157.048 38.7867 157.528 40.76C158.008 42.68 158.462 44.52 158.888 46.28C159.368 47.9867 159.795 49.56 160.168 51C160.595 49.5067 161.022 47.88 161.448 46.12C161.928 44.36 162.408 42.4933 162.888 40.52C163.368 38.4933 163.848 36.4133 164.328 34.28C164.862 32.1467 165.395 29.9867 165.928 27.8C166.515 25.24 167.102 22.7333 167.688 20.28C168.275 17.7733 168.835 15.3733 169.368 13.08C169.955 10.7333 170.488 8.57333 170.968 6.6C171.448 4.57333 171.875 2.78666 172.248 1.24H181.128C181.128 2.73333 181.102 4.46666 181.048 6.44C181.048 8.36 181.022 10.4667 180.968 12.76C180.968 15 180.968 17.3733 180.968 19.88C180.968 22.3333 180.968 24.8667 180.968 27.48C180.968 30.0933 180.968 32.7067 180.968 35.32C180.968 37.9333 180.968 40.52 180.968 43.08C181.022 45.64 181.048 48.12 181.048 50.52C181.102 52.8667 181.155 55.08 181.208 57.16L175.368 57C175.368 54.92 175.368 52.9467 175.368 51.08C175.422 49.16 175.448 47.3467 175.448 45.64C175.448 43.88 175.448 42.2267 175.448 40.68C175.448 39.1333 175.448 37.64 175.448 36.2C175.448 34.76 175.448 33.4 175.448 32.12C175.502 30.7867 175.528 29.5333 175.528 28.36C175.528 25.9067 175.528 23.6667 175.528 21.64C175.528 19.56 175.528 17.5867 175.528 15.72C175.528 13.8 175.502 11.9067 175.448 10.04C174.915 11.96 174.408 13.88 173.928 15.8C173.448 17.6667 172.968 19.56 172.488 21.48C172.008 23.4 171.502 25.4267 170.968 27.56C170.488 29.4267 169.982 31.4 169.448 33.48C168.968 35.56 168.435 37.7733 167.848 40.12C167.262 42.4667 166.595 45 165.848 47.72C165.155 50.3867 164.408 53.2933 163.608 56.44L156.648 56.2C155.902 53.32 155.182 50.5733 154.488 47.96C153.848 45.3467 153.235 42.84 152.648 40.44C152.062 38.04 151.502 35.7467 150.968 33.56C150.435 31.32 149.902 29.16 149.368 27.08C148.888 25.0533 148.382 23.08 147.848 21.16C147.368 19.24 146.862 17.3733 146.328 15.56C145.848 13.7467 145.342 11.9867 144.808 10.28C144.808 10.8133 144.808 11.9333 144.808 13.64C144.862 15.3467 144.888 17.4533 144.888 19.96C144.888 22.4667 144.888 25.2933 144.888 28.44C144.888 30.0933 144.888 31.8533 144.888 33.72C144.942 35.5333 144.968 37.4 144.968 39.32C145.022 41.24 145.048 43.1867 145.048 45.16C145.048 47.1333 145.048 49.1333 145.048 51.16C145.102 53.1333 145.128 55.1067 145.128 57.08H139.608ZM191.093 57.4C191.093 57.4 191.093 56.76 191.093 55.48C191.146 54.1467 191.173 52.3867 191.173 50.2C191.226 48.0133 191.253 45.56 191.253 42.84C191.253 40.0667 191.253 37.2133 191.253 34.28C191.306 31.2933 191.333 28.44 191.333 25.72C191.333 22.3067 191.306 19.1067 191.253 16.12C191.253 13.1333 191.226 10.52 191.173 8.28C191.173 6.04 191.146 4.28 191.093 3C191.093 1.72 191.093 1.08 191.093 1.08L197.253 1.8C197.253 1.8 197.226 2.33333 197.173 3.4C197.173 4.41333 197.173 5.77333 197.173 7.48C197.173 9.18667 197.146 11.1067 197.093 13.24C197.093 15.32 197.066 17.4267 197.013 19.56C197.013 21.6933 197.013 23.6933 197.013 25.56C197.013 27.4267 197.013 29.6933 197.013 32.36C197.066 34.9733 197.093 37.6933 197.093 40.52C197.146 43.2933 197.173 45.9067 197.173 48.36C197.226 50.8133 197.253 52.8133 197.253 54.36C197.306 55.8533 197.333 56.6 197.333 56.6L191.093 57.4ZM191.093 57.4L194.613 52.12H215.253V57L191.093 57.4ZM194.213 37.8V32.36L214.453 32.6L213.653 37.48L194.213 37.8ZM193.653 6.6L191.093 1.08L213.973 1.56L214.533 6.84L193.653 6.6Z"/>
</mask>
<path d="M14.2609 57.8C11.7543 57.8 9.62094 57.4533 7.86094 56.76C6.15427 56.0133 4.7676 55.0267 3.70094 53.8C2.6876 52.5733 1.94094 51.16 1.46094 49.56C0.980938 47.96 0.740938 46.28 0.740938 44.52C0.740938 43.72 0.767604 42.92 0.820938 42.12C0.927604 41.32 1.06094 40.4933 1.22094 39.64H6.66094C6.55427 40.4933 6.4476 41.3467 6.34094 42.2C6.2876 43.0533 6.26094 43.8533 6.26094 44.6C6.26094 46.1467 6.4476 47.56 6.82094 48.84C7.2476 50.0667 8.02094 51.0533 9.14094 51.8C10.2609 52.5467 11.8609 52.92 13.9409 52.92C16.0743 52.92 17.7543 52.5733 18.9809 51.88C20.2076 51.1867 21.0876 50.28 21.6209 49.16C22.2076 48.04 22.5009 46.8133 22.5009 45.48C22.5009 44.0933 22.1809 42.8933 21.5409 41.88C20.9543 40.8667 20.1543 39.9333 19.1409 39.08C18.1276 38.2267 16.9809 37.4 15.7009 36.6C14.4209 35.8 13.1143 34.9733 11.7809 34.12C10.3943 33.2133 9.03427 32.2267 7.70094 31.16C6.42094 30.0933 5.2476 28.8667 4.18094 27.48C3.11427 26.04 2.26094 24.3867 1.62094 22.52C0.980938 20.6 0.660938 18.4133 0.660938 15.96C0.660938 12.9733 1.22094 10.3333 2.34094 8.04C3.51427 5.74666 5.1676 3.96 7.30094 2.68C9.43427 1.34666 11.9676 0.679996 14.9009 0.679996C18.6343 0.679996 21.4609 1.45333 23.3809 3C25.3543 4.49333 26.6876 6.44 27.3809 8.84C28.1276 11.24 28.5009 13.7733 28.5009 16.44C28.5009 17.5067 28.4476 18.5733 28.3409 19.64C28.2876 20.6533 28.2076 21.6667 28.1009 22.68C27.9943 23.64 27.8876 24.5733 27.7809 25.48H21.9409C22.1543 24.0933 22.3409 22.6267 22.5009 21.08C22.6609 19.5333 22.7409 17.9867 22.7409 16.44C22.7409 14.52 22.5276 12.76 22.1009 11.16C21.6743 9.50666 20.8743 8.2 19.7009 7.24C18.5809 6.22666 16.9276 5.72 14.7409 5.72C13.1943 5.72 11.8876 6.01333 10.8209 6.6C9.75427 7.13333 8.90094 7.90667 8.26094 8.92C7.62094 9.88 7.14094 11 6.82094 12.28C6.55427 13.5067 6.42094 14.8133 6.42094 16.2C6.42094 18.4933 6.82094 20.4667 7.62094 22.12C8.42094 23.72 9.4876 25.1333 10.8209 26.36C12.1543 27.5333 13.5943 28.6267 15.1409 29.64C16.6876 30.6 18.2343 31.56 19.7809 32.52C21.3276 33.48 22.7409 34.52 24.0209 35.64C25.3543 36.76 26.3943 38.0667 27.1409 39.56C27.9409 41.0533 28.3409 42.84 28.3409 44.92C28.3409 47.48 27.7543 49.7467 26.5809 51.72C25.4609 53.64 23.8609 55.1333 21.7809 56.2C19.7009 57.2667 17.1943 57.8 14.2609 57.8ZM46.1709 57.8C44.0909 57.8 42.4109 57.48 41.1309 56.84C39.8509 56.2 38.8376 55.32 38.0909 54.2C37.3976 53.0267 36.9176 51.6933 36.6509 50.2C36.3843 48.7067 36.2509 47.1067 36.2509 45.4C36.2509 44.3333 36.2509 43.16 36.2509 41.88C36.3043 40.6 36.3309 39.2133 36.3309 37.72C36.3843 36.2267 36.4376 34.68 36.4909 33.08C36.5443 31.3733 36.5976 29.6133 36.6509 27.8C36.7043 25.9333 36.7576 24.0933 36.8109 22.28C36.8643 20.4133 36.8909 18.5733 36.8909 16.76C36.9443 14.9467 36.9976 13.1867 37.0509 11.48C37.1043 9.77333 37.1309 8.17333 37.1309 6.68L43.2909 6.04C43.1309 7.48 42.9709 9.26666 42.8109 11.4C42.7043 13.48 42.5709 15.8 42.4109 18.36C42.3043 20.8667 42.1709 23.4267 42.0109 26.04C41.9043 28.6533 41.7976 31.16 41.6909 33.56C41.5843 35.8 41.5043 37.8533 41.4509 39.72C41.3976 41.5333 41.3709 43.0267 41.3709 44.2C41.3709 46.1733 41.4776 47.8533 41.6909 49.24C41.9576 50.6267 42.4376 51.6933 43.1309 52.44C43.8243 53.1333 44.8376 53.48 46.1709 53.48C48.0376 53.48 49.3709 53.0533 50.1709 52.2C51.0243 51.2933 51.5576 50.12 51.7709 48.68C52.0376 47.1867 52.1709 45.56 52.1709 43.8C52.1709 43.2667 52.1443 42.7333 52.0909 42.2C52.0909 41.6133 52.0643 41.0267 52.0109 40.44C51.9576 39.8533 51.9043 39.2667 51.8509 38.68L56.6509 37.56C56.7576 38.68 56.8376 39.7733 56.8909 40.84C56.9976 41.9067 57.0509 42.9467 57.0509 43.96C57.0509 46.7333 56.6776 49.16 55.9309 51.24C55.1843 53.2667 54.0109 54.8667 52.4109 56.04C50.8109 57.2133 48.7309 57.8 46.1709 57.8ZM32.1709 17.32L32.6509 12.68C32.5443 12.68 32.9443 12.68 33.8509 12.68C34.8109 12.68 35.9576 12.7067 37.2909 12.76C38.6776 12.76 39.9309 12.76 41.0509 12.76C42.2243 12.76 42.9176 12.76 43.1309 12.76C44.0376 12.76 45.0776 12.76 46.2509 12.76C47.4776 12.7067 48.7309 12.68 50.0109 12.68C51.2909 12.6267 52.5176 12.6 53.6909 12.6C54.9176 12.5467 56.0109 12.52 56.9709 12.52L56.4909 16.6C55.9043 16.6 55.2376 16.6267 54.4909 16.68C53.7443 16.68 52.9443 16.68 52.0909 16.68C51.2909 16.68 50.4376 16.7067 49.5309 16.76C48.6776 16.76 47.8243 16.7867 46.9709 16.84C46.1176 16.84 45.3176 16.84 44.5709 16.84C43.3443 16.84 41.9576 16.8933 40.4109 17C38.8643 17.0533 37.3709 17.1067 35.9309 17.16C34.4909 17.2133 33.2376 17.2667 32.1709 17.32ZM74.9247 68.84L69.0047 68.68C69.5914 66.8133 70.1514 64.9467 70.6847 63.08C71.218 61.2133 71.7247 59.3467 72.2047 57.48C72.6847 55.6667 73.138 53.8533 73.5647 52.04C74.0447 50.1733 74.498 48.3333 74.9247 46.52C75.4047 44.6533 75.858 42.7867 76.2847 40.92C76.7114 39.0533 77.138 37.16 77.5647 35.24C78.098 32.84 78.6047 30.4133 79.0847 27.96C79.618 25.5067 80.1247 23 80.6047 20.44C81.138 17.8267 81.6447 15.1867 82.1247 12.52H88.1247C87.698 14.2267 87.2447 16.0133 86.7647 17.88C86.2847 19.6933 85.8047 21.5867 85.3247 23.56C84.8447 25.5333 84.338 27.56 83.8047 29.64C83.3247 31.6667 82.8447 33.72 82.3647 35.8C81.8314 38.04 81.298 40.3067 80.7647 42.6C80.2314 44.8933 79.7247 47.1867 79.2447 49.48C78.7647 51.72 78.258 53.96 77.7247 56.2C77.2447 58.3867 76.7647 60.5467 76.2847 62.68C75.858 64.8133 75.4047 66.8667 74.9247 68.84ZM72.6847 57.72C72.3647 56.3867 72.018 55.0267 71.6447 53.64C71.2714 52.2533 70.898 50.84 70.5247 49.4C70.1514 47.9067 69.7514 46.4133 69.3247 44.92C68.898 43.3733 68.4714 41.8 68.0447 40.2C67.618 38.6 67.1914 37 66.7647 35.4C66.2847 33.5867 65.778 31.7733 65.2447 29.96C64.7647 28.0933 64.258 26.2267 63.7247 24.36C63.2447 22.4933 62.738 20.6267 62.2047 18.76C61.6714 16.84 61.138 14.92 60.6047 13L66.7647 12.76C67.3514 15.5333 67.9114 18.1733 68.4447 20.68C68.978 23.1333 69.5114 25.5067 70.0447 27.8C70.6314 30.0933 71.218 32.3333 71.8047 34.52C72.2314 36.1733 72.6314 37.8267 73.0047 39.48C73.4314 41.08 73.8314 42.68 74.2047 44.28C74.6314 45.88 75.058 47.48 75.4847 49.08C75.9647 50.68 76.4447 52.3067 76.9247 53.96L72.6847 57.72ZM94.1359 56.84C94.1893 55.6133 94.2159 53.96 94.2159 51.88C94.2693 49.8 94.2959 47.48 94.2959 44.92C94.3493 42.3067 94.3759 39.5867 94.3759 36.76C94.3759 33.9333 94.3759 31.16 94.3759 28.44C94.3759 26.36 94.3759 24.12 94.3759 21.72C94.3759 19.32 94.3493 16.9467 94.2959 14.6C94.2959 12.2 94.2693 9.93333 94.2159 7.8C94.2159 5.61333 94.2159 3.72 94.2159 2.12L100.136 1.48C100.083 2.81333 100.003 4.30666 99.8959 5.96C99.8426 7.61333 99.7626 9.4 99.6559 11.32C99.6026 13.1867 99.5493 15.1067 99.4959 17.08C99.4426 19.0533 99.3893 21 99.3359 22.92C99.3359 24.84 99.3359 26.6533 99.3359 28.36C99.3359 31.1867 99.3626 34.36 99.4159 37.88C99.5226 41.4 99.6293 44.84 99.7359 48.2C99.8959 51.56 100.029 54.44 100.136 56.84H94.1359ZM120.248 57.96C117.208 57.96 114.835 57.1067 113.128 55.4C111.475 53.64 110.275 51.2933 109.528 48.36C108.995 46.3333 108.622 44.0933 108.408 41.64C108.248 39.1867 108.168 36.6 108.168 33.88C108.168 31.96 108.222 30.0933 108.328 28.28C108.488 26.4667 108.755 24.7867 109.128 23.24C109.875 19.88 111.182 17.16 113.048 15.08C114.915 12.9467 117.608 11.88 121.128 11.88C123.475 11.88 125.368 12.4133 126.808 13.48C128.302 14.5467 129.395 16.0933 130.088 18.12C130.782 20.1467 131.128 22.6267 131.128 25.56C131.128 27.0533 131.022 28.7067 130.808 30.52C130.648 32.3333 130.435 34.1467 130.168 35.96L125.528 31.88C125.688 30.4933 125.822 29.16 125.928 27.88C126.035 26.6 126.088 25.4 126.088 24.28C126.088 22.6267 125.928 21.2133 125.608 20.04C125.288 18.8667 124.728 17.96 123.928 17.32C123.182 16.6267 122.088 16.28 120.648 16.28C118.622 16.28 117.102 17.16 116.088 18.92C115.075 20.68 114.355 22.9733 113.928 25.8C113.768 27.0267 113.635 28.3333 113.528 29.72C113.475 31.1067 113.448 32.52 113.448 33.96C113.448 35.5067 113.448 37.0267 113.448 38.52C113.502 39.96 113.582 41.3467 113.688 42.68C113.795 43.96 113.955 45.16 114.168 46.28C114.595 48.4667 115.288 50.2267 116.248 51.56C117.262 52.84 118.702 53.48 120.568 53.48C122.008 53.48 123.155 53.1333 124.008 52.44C124.915 51.7467 125.555 50.8133 125.928 49.64C126.302 48.4133 126.488 47.0533 126.488 45.56C126.488 45.0267 126.462 44.4933 126.408 43.96C126.408 43.3733 126.355 42.7867 126.248 42.2H130.968C131.075 42.84 131.128 43.48 131.128 44.12C131.182 44.7067 131.208 45.2933 131.208 45.88C131.208 48.28 130.808 50.3867 130.008 52.2C129.262 54.0133 128.062 55.4267 126.408 56.44C124.808 57.4533 122.755 57.96 120.248 57.96ZM110.328 36.52L110.248 31.8L130.168 31.64V35.96C130.168 35.96 129.742 35.96 128.888 35.96C128.088 35.96 126.995 35.9867 125.608 36.04C124.275 36.0933 122.728 36.1467 120.968 36.2C119.262 36.2 117.475 36.2267 115.608 36.28C113.795 36.3333 112.035 36.4133 110.328 36.52ZM139.608 57.08C139.662 55.32 139.688 53.3733 139.688 51.24C139.742 49.1067 139.768 46.8667 139.768 44.52C139.822 42.12 139.848 39.6667 139.848 37.16C139.848 34.6 139.848 32.04 139.848 29.48C139.848 26.8133 139.848 24.1733 139.848 21.56C139.848 18.9467 139.848 16.4133 139.848 13.96C139.848 11.5067 139.822 9.16 139.768 6.92C139.768 4.68 139.742 2.65333 139.688 0.839998L147.928 0.679996C148.302 2.38666 148.728 4.30666 149.208 6.44C149.688 8.57333 150.222 10.8667 150.808 13.32C151.395 15.72 151.982 18.2 152.568 20.76C153.208 23.32 153.848 25.88 154.488 28.44C155.022 30.5733 155.528 32.68 156.008 34.76C156.542 36.7867 157.048 38.7867 157.528 40.76C158.008 42.68 158.462 44.52 158.888 46.28C159.368 47.9867 159.795 49.56 160.168 51C160.595 49.5067 161.022 47.88 161.448 46.12C161.928 44.36 162.408 42.4933 162.888 40.52C163.368 38.4933 163.848 36.4133 164.328 34.28C164.862 32.1467 165.395 29.9867 165.928 27.8C166.515 25.24 167.102 22.7333 167.688 20.28C168.275 17.7733 168.835 15.3733 169.368 13.08C169.955 10.7333 170.488 8.57333 170.968 6.6C171.448 4.57333 171.875 2.78666 172.248 1.24H181.128C181.128 2.73333 181.102 4.46666 181.048 6.44C181.048 8.36 181.022 10.4667 180.968 12.76C180.968 15 180.968 17.3733 180.968 19.88C180.968 22.3333 180.968 24.8667 180.968 27.48C180.968 30.0933 180.968 32.7067 180.968 35.32C180.968 37.9333 180.968 40.52 180.968 43.08C181.022 45.64 181.048 48.12 181.048 50.52C181.102 52.8667 181.155 55.08 181.208 57.16L175.368 57C175.368 54.92 175.368 52.9467 175.368 51.08C175.422 49.16 175.448 47.3467 175.448 45.64C175.448 43.88 175.448 42.2267 175.448 40.68C175.448 39.1333 175.448 37.64 175.448 36.2C175.448 34.76 175.448 33.4 175.448 32.12C175.502 30.7867 175.528 29.5333 175.528 28.36C175.528 25.9067 175.528 23.6667 175.528 21.64C175.528 19.56 175.528 17.5867 175.528 15.72C175.528 13.8 175.502 11.9067 175.448 10.04C174.915 11.96 174.408 13.88 173.928 15.8C173.448 17.6667 172.968 19.56 172.488 21.48C172.008 23.4 171.502 25.4267 170.968 27.56C170.488 29.4267 169.982 31.4 169.448 33.48C168.968 35.56 168.435 37.7733 167.848 40.12C167.262 42.4667 166.595 45 165.848 47.72C165.155 50.3867 164.408 53.2933 163.608 56.44L156.648 56.2C155.902 53.32 155.182 50.5733 154.488 47.96C153.848 45.3467 153.235 42.84 152.648 40.44C152.062 38.04 151.502 35.7467 150.968 33.56C150.435 31.32 149.902 29.16 149.368 27.08C148.888 25.0533 148.382 23.08 147.848 21.16C147.368 19.24 146.862 17.3733 146.328 15.56C145.848 13.7467 145.342 11.9867 144.808 10.28C144.808 10.8133 144.808 11.9333 144.808 13.64C144.862 15.3467 144.888 17.4533 144.888 19.96C144.888 22.4667 144.888 25.2933 144.888 28.44C144.888 30.0933 144.888 31.8533 144.888 33.72C144.942 35.5333 144.968 37.4 144.968 39.32C145.022 41.24 145.048 43.1867 145.048 45.16C145.048 47.1333 145.048 49.1333 145.048 51.16C145.102 53.1333 145.128 55.1067 145.128 57.08H139.608ZM191.093 57.4C191.093 57.4 191.093 56.76 191.093 55.48C191.146 54.1467 191.173 52.3867 191.173 50.2C191.226 48.0133 191.253 45.56 191.253 42.84C191.253 40.0667 191.253 37.2133 191.253 34.28C191.306 31.2933 191.333 28.44 191.333 25.72C191.333 22.3067 191.306 19.1067 191.253 16.12C191.253 13.1333 191.226 10.52 191.173 8.28C191.173 6.04 191.146 4.28 191.093 3C191.093 1.72 191.093 1.08 191.093 1.08L197.253 1.8C197.253 1.8 197.226 2.33333 197.173 3.4C197.173 4.41333 197.173 5.77333 197.173 7.48C197.173 9.18667 197.146 11.1067 197.093 13.24C197.093 15.32 197.066 17.4267 197.013 19.56C197.013 21.6933 197.013 23.6933 197.013 25.56C197.013 27.4267 197.013 29.6933 197.013 32.36C197.066 34.9733 197.093 37.6933 197.093 40.52C197.146 43.2933 197.173 45.9067 197.173 48.36C197.226 50.8133 197.253 52.8133 197.253 54.36C197.306 55.8533 197.333 56.6 197.333 56.6L191.093 57.4ZM191.093 57.4L194.613 52.12H215.253V57L191.093 57.4ZM194.213 37.8V32.36L214.453 32.6L213.653 37.48L194.213 37.8ZM193.653 6.6L191.093 1.08L213.973 1.56L214.533 6.84L193.653 6.6Z" fill="black"/>

</svg>

                ''',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyMode()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: gradient2Color, // Customize background color
                foregroundColor: Colors.white, // Customize text color
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                textStyle: const TextStyle(fontSize: 18, fontWeight: fontMD),
              ),
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
