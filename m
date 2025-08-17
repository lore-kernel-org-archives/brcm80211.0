Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF321770A
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755457500; cv=none; b=A5yedJ9Ulkktt39/YphmwUsaw2p3R3ycFBjGi6HyZ17KrWHx4rQ/Rg8/ZelH7fyhVg6EJOzjSbMQNiYQAVhgFj00zp5sKJGj0fK75dlImrNPoxMtBRwH9g0v1elsuLnGT++z59t2/z5RrmdMnl/ro4+JLKtjtYp5sDOsuqP+66k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755457500; c=relaxed/simple;
	bh=P9eYuguAdZNzFRTrX57uaX3Xip1RK5VzuqN3gvKRNMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0fIMNZLnPo7KKCvSKJuHpcElvEqijlXE+CjpoqTY1+xNyGeyI00EA9gdwOhC9hNlcLfF4V4Xgw34xkdWDwOEwqebiHxb67ljLAYzziw2xyan3POsfA93PvoNxOboZA81/cSBiMGaPisDkTIg3paoNI6Lnh0kFsBQsCs52cllPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IpsamEg7; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IpsamEg7"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b109c58e29so60517071cf.3
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755457498; x=1756062298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vppjgRt0sdRKtKXtygDz2yLmHtOPZjyKaaW7vcL4qfE=;
        b=IpsamEg7hdv7Bcd7ZrDI7WiCY5tt9UhXqcIUaEYGTtJGR5ZtGlhOzzVibIgqeFkV0o
         jecn/UG7ZMovFzfqNEFGmaXuVwe82EbMkBKaQCBvSYkLpJ32slXbbnNrTXbezO17aGvl
         XqUN81KlL3a4Z/bomLxlo4Zlnoe0jnHrQ2cWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755457498; x=1756062298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vppjgRt0sdRKtKXtygDz2yLmHtOPZjyKaaW7vcL4qfE=;
        b=XU/1vyulDYAo5EV230CRrGlHs2Ak6YJMf//JIynqa+0/8w5LMg89EbqU2N+V1Qk6Hr
         d2PB2qiENaJVZP2GxqAIcNtCMSMxR3F0plenPF/IQ+QSHUSrUiER2IaOzhiQMLN4IwM0
         0JW7R9SYnvfDfNaciHCtSadSOD0y2JZdFYmj98abQKDg2ttoMFPJIKIS5/eowYTdo5sQ
         QrygzZSh1+ORoSGVxlq/kYKrYOOnOzoAN0Rmx+9fWY89/Ucqiya/HJjD5HXqARElfCGS
         wFBnM38JX/MQ/UF9Sm38Yn9wtQkHz68JsFqHFjEpR9AEzc7PlvEOQl7gKBKg1gxFX0e6
         QFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjtZPui3bSa6HmzBYziaqv36hPnmM+8FBsnVxdJq/HwjMe6Kfpck9Cc32ClRBi/+ecxOSSMBZlRKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxJ1Vz3NleATSAW0rU77ch15ZzieZWPETS/eeggntELaSFNasi
	i8oMHwZ0lEMuxlfnKaZ3XS97CV4mD3dv1odbc5EK7iFeYmO8bmkcDu/JsfH4l829gQ==
X-Gm-Gg: ASbGncsArgIfPcUolQmOjmvR77CLD2mDiTihtst4JOJ7XiAhu6NxzTP6ipXDPPCxc/I
	7SH/lMUel4y4TjbrRpKMVT+FUucOYjdUs+jG1tU9zQi85NQ9W+Lzq3/8wq3lUxxg4gJ2VhyG2bD
	FEWjzuwson5s88TTmthe4lPGULLwdTNdRRFN/vK4DxfUNEM8LE2USW5I5FK7sRoDqiKpi7dN8kx
	jN6isT+dT7K5LTNo1ivx0S/xqYPedOvawDGP0AWMsKSvl3YTWkp4kc1/OkXmI+O6uTkFDx2c+qz
	lhMusVft2WhCXC6Z6w7c1VVsF/+ULlT8j9AAnY4QQEmPuPUOCjK2UsRsz5o1HEDxcbHMifw1Wvf
	kabSaqYlQvxn7LNZ6f+VUY+kEibjpRGMSYyJ1pMNhdcNLleN8bklkgmHwCCcxPPVGfc1X2ntkDG
	NZAwVRqzG92B2TwOVa
X-Google-Smtp-Source: AGHT+IHUMkAK6BwidCsZPGQssLj0B/NoURQu+mf9bEy9g+tXqmDKGvXjG7+tfqkShGYV6sXz0pdlKg==
X-Received: by 2002:a05:622a:4d4d:b0:4af:c0b6:b297 with SMTP id d75a77b69052e-4b11e363f7fmr149063871cf.50.1755457498216;
        Sun, 17 Aug 2025 12:04:58 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50b31sm40382461cf.51.2025.08.17.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:04:57 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Wright Feng <wright.feng@cypress.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 4/4] wifi: brcmfmac: support AP isolation to restrict reachability between stations
Date: Sun, 17 Aug 2025 21:04:35 +0200
Message-ID: <20250817190435.1495094-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250817190435.1495094-1-arend.vanspriel@broadcom.com>
References: <20250817190435.1495094-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wright Feng <wright.feng@cypress.com>

hostapd & wpa_supplicant userspace daemons exposes an AP mode specific
config file parameter "ap_isolate" to the user, which is used to control
low-level bridging of frames between the stations associated in the BSS.

In driver, handle this user setting in the newly defined cfg80211_ops
function brcmf_cfg80211_change_bss() by enabling "ap_isolate" IOVAR in
the firmware.

In AP mode, the "ap_isolate" value from the cfg80211 layer represents,
 0 = allow low-level bridging of frames between associated stations
 1 = restrict low-level bridging of frames to isolate associated stations
-1 = do not change existing setting

Signed-off-by: Wright Feng <wright.feng@cypress.com>
Signed-off-by: Chi-hsien Lin <chi-hsien.lin@cypress.com>
Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
[arend: indicate ap_isolate support in struct wiphy::bss_param_support]
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 8af402555b5e..8afaffe31031 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5958,6 +5958,26 @@ static int brcmf_cfg80211_del_pmk(struct wiphy *wiphy, struct net_device *dev,
 	return brcmf_set_pmk(ifp, NULL, 0);
 }
 
+static int brcmf_cfg80211_change_bss(struct wiphy *wiphy, struct net_device *dev,
+				     struct bss_parameters *params)
+{
+	struct brcmf_if *ifp = netdev_priv(dev);
+	int ret = 0;
+
+	/* In AP mode, the "ap_isolate" value represents
+	 *  0 = allow low-level bridging of frames between associated stations
+	 *  1 = restrict low-level bridging of frames to isolate associated stations
+	 * -1 = do not change existing setting
+	 */
+	if (params->ap_isolate >= 0) {
+		ret = brcmf_fil_iovar_int_set(ifp, "ap_isolate", params->ap_isolate);
+		if (ret < 0)
+			brcmf_err("ap_isolate iovar failed: ret=%d\n", ret);
+	}
+
+	return ret;
+}
+
 static struct cfg80211_ops brcmf_cfg80211_ops = {
 	.add_virtual_intf = brcmf_cfg80211_add_iface,
 	.del_virtual_intf = brcmf_cfg80211_del_iface,
@@ -6005,6 +6025,7 @@ static struct cfg80211_ops brcmf_cfg80211_ops = {
 	.update_connect_params = brcmf_cfg80211_update_conn_params,
 	.set_pmk = brcmf_cfg80211_set_pmk,
 	.del_pmk = brcmf_cfg80211_del_pmk,
+	.change_bss = brcmf_cfg80211_change_bss,
 };
 
 struct cfg80211_ops *brcmf_cfg80211_get_ops(struct brcmf_mp_device *settings)
@@ -7659,6 +7680,8 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
 				    BIT(NL80211_BSS_SELECT_ATTR_BAND_PREF) |
 				    BIT(NL80211_BSS_SELECT_ATTR_RSSI_ADJUST);
 
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_AP_ISOLATE;
+
 	wiphy->flags |= WIPHY_FLAG_NETNS_OK |
 			WIPHY_FLAG_PS_ON_BY_DEFAULT |
 			WIPHY_FLAG_HAVE_AP_SME |
-- 
2.43.5

