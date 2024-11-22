Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E14A0C
	for <brcm80211@lists.linux.dev>; Fri, 22 Nov 2024 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732309470; cv=none; b=PVodeFOirpW7gLVcFMQid9pXQ09Scu/5Zzd7QGOeU0z28xZKB+4+lOwY0C0Ky+7XPfiiZ3z1jM2DuuOOmPpyfH0ie8NhlrD3PPa3f+YrVDlAWGDnaFVf7RXUu/0IZi13VEKBG/0jXPjX5nZnIK5H2o4nQRGdXt6ODn7YKAOZ3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732309470; c=relaxed/simple;
	bh=F+v1Ru0uni2FPXIKtFvxarAFHqaEna9u93F4JIgKyaM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tV5gnH0E29SfYQGUYD/Z+2hjTyPulYpZCt1iFqAUz75df5muPYBsVVYo6X844Fx0Pw1Iyd4p0a0Ff1A/lukrIbUuszwszfkg5cnd8eL4G06FoedJR4TtlUtfu7MsNTgh5c6HXOMOpEompY2IIC2VMkw9+F5G1aXGQKjs2Cif+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY0CLTO+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY0CLTO+"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso30977441fa.2
        for <brcm80211@lists.linux.dev>; Fri, 22 Nov 2024 13:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732309467; x=1732914267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9ZyOhR/EEzpu2AnEc2F9Koo0OBv6NsVpKPmnIREooA=;
        b=iY0CLTO+wyk/OnahQOlC2C0DvIPeznyPSn0X31Qc9TRbHpQH5Q8o0CEFFsy/71BVTF
         KZ+Sa5rb7If7+OteFGDtAbKK/ltJ23s6qoSlTYOtyHGfmzTYmkd+BgdyN0bYBnXOfraL
         WY5rTin2PHptyUOFKME5RS6D4isYDviMa7SKSid8AQg2xtFb017Daaymsz7J3B8zrjwV
         k9AHs4cXHJoxFUgR5hfUAKZytatMRfVHgCC2SmQgIJjobC3bJBjxnUluZE9gIZNI+LaK
         0Sitclx5DqJu3xNwJbwj6aCRynQdmP0rE877dHtiJzN5qVPNq6ypC2V9elZEVXgDounb
         KE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732309467; x=1732914267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9ZyOhR/EEzpu2AnEc2F9Koo0OBv6NsVpKPmnIREooA=;
        b=Pc5oW5Uhi49AFx0yj97+7GozcYy8RYbAraGOpNPs+YyRRA6TEMa/gZ0tA/xaf6z6WQ
         lNQOAHE18c5BJUlmThlOQ/CvRuONWpGYtypzhXWvyyD96MzPZ0Dy2rwMyuRvrsmA2WcZ
         SgPcVlQ9ro8X5AgI983KHMSc5o1EtaeXCxY6tXXVX20TKby5wms03mblNQt+cvc5P4zi
         E8GqPiKVvpP1SiXhNokYFSpcU8HQqK+dbHgZLkLVlgjFHxyHq+0/SRtdse2Y/k9A6DcD
         vAMDBuC0iJOC5OT1wRTuMDk3NRJKpfp2t16OrtUZt08ZMBCO2HX3N1c8qVLWwtRbKhQT
         wQTg==
X-Forwarded-Encrypted: i=1; AJvYcCUDkvEGPA3vguE27PWpBzcnGdPBzHg3SZqQJ5Duu+TjcI5DqzyddVAKLps+gC3o4SHq0D4cC/pk5DE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyChrBEW06wkjTzvN5tqeogbz6BARyRrwg5Jgr0PADEHV+TrC2E
	odkWRjzi4NkDSRMWKnueene1ytOWH7Q02lLRyuoPKIhoKVStnlri
X-Gm-Gg: ASbGnctnwVG5CWhFj2yVonYC/Hw1fhOsfnNN6PxjSxkT9gnlNl+b1aNiPxaBTi22a65
	SPva+3n0Y482GPxdGMXZ1o3gasjEH5spvV1nmdWVss7LPHr9kXFNtUARbxNAUsFXxp4RhsmqmAz
	xC0bpOAKgqdda4ofV6kAFxH0zhvtREFsdo57hT2vFl/JxtKzpGFFdD/NgbN7+KR7oGkU3RLAxCb
	EAtpUaf8e0xCfpDhpEBMVbv/HeIXXr9AUBENV86iZKuSWjuRKdu5Jq8Y2E=
X-Google-Smtp-Source: AGHT+IFgi7IRzgMOCobKQO08D1Yo0MM15YLhVt2WwafSJCD+NT8rwDNMGy4Kzx1yLRSvIfJ9sNo3Xg==
X-Received: by 2002:ac2:5688:0:b0:53d:abc8:b6d3 with SMTP id 2adb3069b0e04-53dd35a53c8mr2834143e87.12.1732309467004;
        Fri, 22 Nov 2024 13:04:27 -0800 (PST)
Received: from alex3d.netup (team.netup.ru. [91.213.249.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2445850sm550072e87.41.2024.11.22.13.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:04:26 -0800 (PST)
From: Alex Shumsky <alexthreed@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Alex Shumsky <alexthreed@gmail.com>,
	Alexey Berezhok <a@bayrepo.ru>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] brcmfmac: fix RSSI report in AP mode
Date: Sat, 23 Nov 2024 00:03:46 +0300
Message-Id: <20241122210346.2848578-1-alexthreed@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 9a1590934d9a ("brcmfmac: correctly report average RSSI in
station info") it is required from firmware to provide rx_lastpkt_rssi.
If this field is not provided brcmfmac doesn't report any RSSI at all.
Unfortunately some firmwares doesn't provide it. One example is firmware
for BCM43455 found in Raspbberry Pi.
See https://github.com/raspberrypi/linux/issues/4574

Fix it by falling back to rssi field if rx_lastpkt_rssi is not provided
(like it was before 9a1590934d9a).

Fixes: 9a1590934d9a ("brcmfmac: correctly report average RSSI in station info")
Signed-off-by: Alex Shumsky <alexthreed@gmail.com>
---

 .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 349aa3439502..8fc10858e936 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -3125,6 +3125,7 @@ brcmf_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev,
 	s32 total_rssi = 0;
 	s32 count_rssi = 0;
 	int rssi;
+	int rx_lastpkt_rssi;
 	u32 i;
 
 	brcmf_dbg(TRACE, "Enter, MAC %pM\n", mac);
@@ -3190,15 +3191,16 @@ brcmf_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev,
 			sinfo->rx_bytes = le64_to_cpu(sta_info_le.rx_tot_bytes);
 		}
 		for (i = 0; i < BRCMF_ANT_MAX; i++) {
-			if (sta_info_le.rssi[i] == 0 ||
-			    sta_info_le.rx_lastpkt_rssi[i] == 0)
+			if (sta_info_le.rssi[i] == 0)
 				continue;
+			rx_lastpkt_rssi = sta_info_le.rx_lastpkt_rssi[i] != 0 ?
+				sta_info_le.rx_lastpkt_rssi[i] :
+				sta_info_le.rssi[i];
 			sinfo->chains |= BIT(count_rssi);
-			sinfo->chain_signal[count_rssi] =
-				sta_info_le.rx_lastpkt_rssi[i];
+			sinfo->chain_signal[count_rssi] = rx_lastpkt_rssi;
 			sinfo->chain_signal_avg[count_rssi] =
 				sta_info_le.rssi[i];
-			total_rssi += sta_info_le.rx_lastpkt_rssi[i];
+			total_rssi += rx_lastpkt_rssi;
 			total_rssi_avg += sta_info_le.rssi[i];
 			count_rssi++;
 		}
-- 
2.34.1

