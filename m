Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD292217F27
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755423680; cv=none; b=p2DevBdNWt1FlpP5azuC9X6ThjnENqCp9Py8nWZ0UEulrMSstOaaCIxQgzwTeCQ4rlO9yyCcTRV/HcPyk2LBG1MUY+Vrn8mntvg5wUtJGxkIaHP/AGN84x6Vi1XTVLLlbDrgyJZ1gGt9NLxY0enUEl7XG4cmBF75onapjCNu2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755423680; c=relaxed/simple;
	bh=bm9ameICTWAWG5Jy1ubG2c1dgMT+WE7ecK44cg4vl18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4CGr4GdinxVvY7CLwgFEsYUEqMqstSlyUnkQINixSBOfLX4Fi+clTlyhnyofY1uU7WOUk44t6Be+5iy3oXeats4fckSBhnb2amm5KieW/JOuHplkA+jfl1VKQWV+bRVFvp8syCfhfrb5PmTKO2ZHCgp9EHB2Ky/1Nuk/HpCiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IZoaTGR9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IZoaTGR9"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87031f560so475448285a.0
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755423678; x=1756028478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrqQdkvjTypRq+PS6iMhtbiTSOtVjO39vKdw57QER4U=;
        b=IZoaTGR9nEbIhnrw0fpilZv0yViYYq8Uw49sNvulJkKz6BWcYxP50fjP9y+TE2TGEs
         hW6P4YIYd4sNrXWNST/IcdSTJ697sAhcBgo6v43KHFX7y/GU7H8cMBC044K1aEq0Ut/0
         xSN83jcFl60xVuujqEx1nTl4uPjF+hURWXOj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755423678; x=1756028478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrqQdkvjTypRq+PS6iMhtbiTSOtVjO39vKdw57QER4U=;
        b=QELMrEi0lYVdWK/fPwbpOGz7smYerqv9gCHI2oEiekT/0fMxrjRMTvE4/PjNOfYSoS
         N9JP3slJO6RxV+WAusEUiD+cem/lCzbI974xOoZ13hsods4tNsKAjvLKN/Xq5N8SJiTZ
         p4uWeIpyva5jwu1+9aczPNX6UOMwChnkQridjdp5jb0qerKoKxzwPvJdNhijJtBkupBy
         zuTfKHYYtWzOc/8ulMJU+oGGwghZ2WxZ4C2gVoR0OskUkFi/Z5zTD/rZpQZMon7XtXNS
         wHIZA6tGdlIlad7qJ+ap16zcWD2Cq6Z+33YoP7ne+kFn0tFT+dw7Sm6a3b/uhuVB3Uor
         m+pw==
X-Forwarded-Encrypted: i=1; AJvYcCU7VtoDKlCe9RB4R8n8PMLDmh/ZqyNeG/W4sR/j3qCC7KICQRaNeODU0sbgUqTgQDGcidED0dzopK8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi3Od7afPpqN3nX5fsr4OY1jK91mdvSz5Kus/Y2Zfiek/OAQ1g
	CipHNx1BjpVpigDywMitvYQN1S8WaweSPoI38gOgrq2npPWLA/K6AydespjJqQoqig==
X-Gm-Gg: ASbGncuXprI4Cf863F6XtBYVXk21X/JIpkEabj6ZPtii3+5/3prY5b2umWLzAy/GUdr
	2T2EsmMjh5TLWTJUAwzCVJ/7FKV3G23iqadet0KDjdO6JfT8XzLfV/UzDmSWkl7HIykyKY8OUJY
	bQP5pXGbjymdYnQOoxWwv3fgttpD6wgCo4QDfRY2MStM4xwsBJMZQZ8z1hXbu8Ke/wyAGomTUg7
	gF9V00KCbsckwEIt8vpRi6J52O7QA7ggemea4EPZtwO3yvFHB2jcc8Pp84a9Vb8F/3L+Utr66sJ
	HwyaedGXmmKCynG5uWAjvf0/aouT81U1WQHI2EecqTbe+7HGxnP9L4NH/PW/LsofOpCvviCSqwh
	TKkUVE+NkGEXxoPnKczsgvo3pDVIOBEgV+s2rB/S+uozxaWxi2K1wrZfYiaTGXaM6nUOhCCylXM
	UcRv4lERoMJ0Pxx3Fc
X-Google-Smtp-Source: AGHT+IFvwVk+h7Dlcv6kOxr1LiU1wUTVHzxHjtA7I0O6GDc1+/eZr1qqiq6CuV/RlqsGmOgh1i8YVg==
X-Received: by 2002:a05:620a:178a:b0:7e2:23c2:e55a with SMTP id af79cd13be357-7e87e031be9mr860910985a.27.1755423677523;
        Sun, 17 Aug 2025 02:41:17 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f819sm35706346d6.9.2025.08.17.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 02:41:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wl-next 2/4] wifi: drivers; indicate support for attributes in NL80211_CMD_SET_BSS
Date: Sun, 17 Aug 2025 11:41:01 +0200
Message-ID: <20250817094103.941090-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250817094103.941090-1-arend.vanspriel@broadcom.com>
References: <20250817094103.941090-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command NL80211_CMD_SET_BSS has a number of individual attributes
and the driver can advertise which of those it will handle when it is
changed by user-space. For drivers providing an empty .change_bss()
the callback has been removed.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/ath/wil6210/cfg80211.c        | 1 +
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 9 +--------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 8 --------
 net/mac80211/main.c                                | 8 ++++++++
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index 7703a0933a14..7218fe70f3bc 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -2708,6 +2708,7 @@ static void wil_wiphy_init(struct wiphy *wiphy)
 	wiphy->n_cipher_suites = ARRAY_SIZE(wil_cipher_suites);
 	wiphy->mgmt_stypes = wil_mgmt_stypes;
 	wiphy->features |= NL80211_FEATURE_SK_TX_STATUS;
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_AP_ISOLATE;
 
 	wiphy->n_vendor_commands = ARRAY_SIZE(wil_nl80211_vendor_commands);
 	wiphy->vendor_commands = wil_nl80211_vendor_commands;
diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index a395829ebadf..a934b39c9b2e 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -794,12 +794,6 @@ static int get_station(struct wiphy *wiphy, struct net_device *dev,
 	return 0;
 }
 
-static int change_bss(struct wiphy *wiphy, struct net_device *dev,
-		      struct bss_parameters *params)
-{
-	return 0;
-}
-
 static int set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
 {
 	int ret = -EINVAL;
@@ -1670,7 +1664,7 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
 }
 
 static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
-			int radio_idx, unsigned int link_id, int *dbm)
+			unsigned int link_id, int *dbm)
 {
 	int ret;
 	struct wilc_vif *vif = netdev_priv(wdev->netdev);
@@ -1709,7 +1703,6 @@ static const struct cfg80211_ops wilc_cfg80211_ops = {
 	.change_station = change_station,
 	.get_station = get_station,
 	.dump_station = dump_station,
-	.change_bss = change_bss,
 	.set_wiphy_params = set_wiphy_params,
 
 	.external_auth = external_auth,
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index ac3d085808e9..315bab373729 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2441,13 +2441,6 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	return ret;
 }
 
-static int	cfg80211_rtw_change_bss(struct wiphy *wiphy,
-					struct net_device *ndev,
-					struct bss_parameters *params)
-{
-	return 0;
-}
-
 void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len, const char *msg)
 {
 	s32 freq;
@@ -2704,7 +2697,6 @@ static struct cfg80211_ops rtw_cfg80211_ops = {
 	.del_station = cfg80211_rtw_del_station,
 	.change_station = cfg80211_rtw_change_station,
 	.dump_station = cfg80211_rtw_dump_station,
-	.change_bss = cfg80211_rtw_change_bss,
 
 	.mgmt_tx = cfg80211_rtw_mgmt_tx,
 };
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 9c8f18b258a6..cfa3cc4dd446 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -862,6 +862,14 @@ struct ieee80211_hw *ieee80211_alloc_hw_nm(size_t priv_data_len,
 	if (emulate_chanctx || ops->remain_on_channel)
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_CTS_PROT |
+				   WIPHY_BSS_PARAM_SHORT_PREAMBLE |
+				   WIPHY_BSS_PARAM_SHORT_SLOT_TIME |
+				   WIPHY_BSS_PARAM_BASIC_RATES |
+				   WIPHY_BSS_PARAM_AP_ISOLATE |
+				   WIPHY_BSS_PARAM_HT_OPMODE |
+				   WIPHY_BSS_PARAM_P2P_CTWINDOW |
+				   WIPHY_BSS_PARAM_P2P_OPPPS;
 	wiphy->features |= NL80211_FEATURE_SK_TX_STATUS |
 			   NL80211_FEATURE_SAE |
 			   NL80211_FEATURE_HT_IBSS |
-- 
2.43.5

