Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460327;
	b=z2Gmiu+Pp/hKMZ2zIKdy9I3R/Tk/kOsclJZ6vl5ME9PNIJ+y7SWgQRWIJecuVj2ra0tk
	 YNyP9iFat/wvLtb8FMunr816OELSBtQ+rvsSL36/0bV/cSM6aVUHXa2XmKb7UeduIePlk
	 6/3n7oNJEDMY3rJ33hNOmj743xqCtAA4nVy1KsUvjRDIsNkTcMxBmGVyXaA65U95svv1e
	 IWavUidq7gQnOPxizqHRSnT2memf5hdrDbISvCFGowAwTt9XMV94nJZdMx02nDG1SCntT
	 tjsBDDTdmZxQfQjTd8JhW+shYJxby1iDVB7r47ioU9YqGCV6Oh+jbh0koyfAelW3blw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
	b=CQSnpBejwK2qHrNDcy29W0hUZkqFp+8aoDeE/5mRfvF9CzAiwdTnhIyML5Hc3LAlas6K
	 jToi43woUE710TRZ8yC242898Do+KYOk68r/ondKaWLk3IJI1Wjt51BmNBJy/FJ3oN9zP
	 GcbJ4Ri2rCn4O1OhRkdivkoZZi72ywhbljyTfq8GnTvXiCkXO8m2PVKk5UPYfPS4WfhQR
	 JpxuEFNrwXeDZ7J0IPYYsmMcMjXRhuMRKA295Gpt8gQsWO5DUaQ1QN1du3IeKq3EKT+hw
	 C+668YS8KF4Yv603Xy4c4yWtALXJjdHWu5BGfq9WvcYPVJM6zoZ60bioEYxlV7LEa5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVlDjt5K;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A7606A898
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888A7606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVlDjt5K
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f6295304dso4617282eec.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 21:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460327; x=1795065127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=CVlDjt5Kvkgbp1Cy4+uILQo5QnS3kFlbqDcUkU4guK/2mhTJ0Sm7iTAD4VpAFAiK+U
         yHeQgDE+382lGxhgvX4N1JGPAbI/gT62Bjwno/9IPxNJ6Tljc96p10GF2HPMEPRGVDbZ
         +Bi072B4D41/bCiik5xpLJYB0MgAcQWmj7sjo9AyLKHyCYpE44UHB3X+iSUMLJtZ0fCA
         BUZHxr0wKMxoWKvDeoQchzXaUOOmwmQ+nDWG+QQs5rS16K3l7ZEVJ/P8FMGplD0TpcgQ
         I1ePK0mNX5OJ4IPPaPLMQRNEx8bR5JdmgmXcEbtLy+x06rhPaWgC2sivc2+OmuxRwIc4
         SgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460327; x=1795065127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=urFBxKJ8tNTNDsVZ4NvQA3VTq2AqCwPYkJXTk9Uo0U/XF3jT1giLNl8PnFHnE6Zy3x
         ARtfmVPTS8rI8yraRH6+lPTVDOtLVCNf2aOeHeuABOEJxBhA1S4OANHL3yS4Dv5PeZ3/
         PLgXAqKTXyFveZGQ2BDQKsbq9hIn6Te5po/8eTm8hvuB2lsMNJN191xvCRz/XPwFPjZK
         6Jk15xaUzElRJmUA56BaP+5LROXC1l+0M9zMY+3FYvvFCBPFlFlSYApt/koEEOICFnDI
         nAk9CaZ/znoOxBhq896OwnXZuSM45En4aLBLmcQzlJgvVHuscaRh+XcBoiemotzUOohj
         6LYg==
X-Forwarded-Encrypted: i=1; AL+hErE18f3ytrsx64rnMb4AHX053qw3AyR/M/kSAicwgiZdrA7AIrSh1DBuLF2LPA0SRn83MlW41A+v1Z8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LUwp3/vx8pG0rcc5Y4CwD0pH3jAZVn9N+yYSpcNafKEIkoI5G
	QPRCmz47V/r/VNG3vk+OHV1pjQT485BqH/BfUXHubKmdRaRQghVdZ0Ci
X-Gm-Gg: AYBFou02Bs+b+shdI4xeyn4bzHudPeIOIGRMo4hGZ4H/oKc4nPA9hfV0GixL/B6zDlf
	CchYqqVpGECo6SG3y2OUgUwZLw2ztSE/rUVeYokUn/Z9wwTe3AiMhCO9XRP6gE07dPjISs5DymG
	BUlLWKKZuTAYTtEkqeG3Kt+K5r+p369db0g4Gqo/fC5k9ioMUi5OeSgkFelOC9JAi95jr5BGzSl
	51Ix8Kbju48YLnKcG37B4IonHWAXcGyhbXGp7jae5zWtJW3QaKlGXc8NI4BouzqWRgv4DRL+iuq
	Vj+7AYVM85NWLAcHUwZBWZF21y84pY/jDt5ON+ATmA+CM9Fw0eWIbNX3IOt97Rnjqi/Ptmc+wMS
	Sl8k8gJoS+0L82CwAMG5OJJfWSYTpbAX+gZaTQEOhDlDnysuzuUk77CcZokiGcFL1OAf1r0aDQM
	UjdwLCfUH8nPVNIlVBt9ZPk4cvdjG3CVfLgXDMh84NK1EkufE8yOyqTjOuadF2StPtzZok8oZ/+
	Szna8FCQ2yW+ev+/gTcdqO8UhmJ21BZeVF1/4ax1GuYW+a99MseTmCV2GxGda/heiJfmbX2gCes
	wZG67jqq/RYf0nh7CmU5oRo3zUL0vllAKpxHR7qnH5IjISoDRDYqbqWigMmIq1WtKDe0bmjpvxb
	t
X-Received: by 2002:a05:693c:4081:b0:377:678:231b with SMTP id 5a478bee46e88-37706782701mr3839735eec.25.1794460326598;
        Wed, 11 Nov 2026 21:12:06 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:06 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Thu, 12 Nov 2026 13:11:30 +0800
Message-ID: <20261112051142.2797529-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7e..d519e950ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f519..c5aaaec434 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc0052..ac577c8e85 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e2..7c1d43323a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

