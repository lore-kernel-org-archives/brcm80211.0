Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CEB28C5C9
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027354; cv=none; b=o4z5seLxQvu9YHCISNRyAT9zGcwyuy2g5GHLrbvgTSaz+nDQa+VsNFSIzRkfxJg6wc6nD/q/n7B8tx4l6vCUYLX1MIpdWTU2UzR57jh+xcXpyoRx8KFkffbcOp6+HS7roLpRkQ+VdB0r3Uc4qrfkuVTxwCX8upOESKWItpTHL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027354; c=relaxed/simple;
	bh=z6WEaSRRzmSUi0Q6zekoyJ82yGWKQJ5PgojomGPJGfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLdYoiv6nAc+yzGNRoGgC3YbHU9M43eGuIMNNCYg06ukEd66FI1E5UT4WQLbhp4uOw3QsSTsSoEVAoeGSVClOkt9UXuUXEepipF1AkJmYeT41wLHJOaWL76Ps4tJoutx/sfKdHUOVeTgn9p9dpWconVm1bJpmEktopB+HR5Q2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g18Bz5+h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g18Bz5+h"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso59646985e9.2
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749027351; x=1749632151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npln1rqDrgl1K+9nJWKc53Wj/RcZI65TJQM3/tL+eGk=;
        b=g18Bz5+hjuYM1qhsIB+RBGv9v/X0Or3Eq87SkrtEFS95TzIJnBmDj/14cFih8LrdQZ
         U5GPeqdLIPY5W9FaWCKjPJNcKM2UtE9GWsJHZdSNdqSS2GvS+lhkojpux2PXiMO0sOlT
         MYcv33GjXq9lG/mDgNpP+jBvh4pEUzx3hQfAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027351; x=1749632151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npln1rqDrgl1K+9nJWKc53Wj/RcZI65TJQM3/tL+eGk=;
        b=uwug7B8EKsENq+gr0O8HijW1GW7jDL/U6b/BEhPHWEJgFATc/t5L09lIlAVzHIz+3M
         XpmJP2JBk8pePpydMkN5gQ3sQXS37Ral4zY3Xjm146iVV3sgTmFpqZmhAvoRNIsz9BMi
         ZOwbVwQ7cSWloySk6mqwcbtFBBJeid4cpSoG04H7e4OEd6Ov1dkIyH+CiGhwc3LpSTjH
         S0zGEC5OxrFmnv9W9s2prql5Jwsl/n9YnfydH9JfLhHhDmbDTkEZk/JI0EEOVSnPoZhN
         8dHBxj0V1f71rAglG6BPf1vGFrwVDPZkLyOydHyUyxJdz+1LadH206kIiUh5rN2Od9th
         cw9A==
X-Forwarded-Encrypted: i=1; AJvYcCXbMCOgeFDUpd7GeCNYNk2tMR93EzjSrtL1EmdrL8xuWYrTNapidH9zCfXm8Mu2FQuedSM0sR2VnpM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywafcj0s/iwPy3l04X5KAH418FjZ0IcuC+SQlXPjbWIIZgYyh5i
	6RqaA/i1Pv01iVSj5l7rm0m5IcAEvvEclM4hJzjN/GDkLj2lYiE+zpMUIpk2NtBK1g==
X-Gm-Gg: ASbGncvab2IaWV62Y0J49X2Lw74yQmFokccBZ3TrnxylO1rxlzyOAUD2+RPhDzbGp+N
	6j72Mi1oGWYQXdDtvgZK0X7a5iuG1hK0uke2sowKZfpJrG4DDOBS+oPFbW6F5pMyOsGxeRfsdnM
	x4wnQdlFFF1ISuviEGbGGQ8Of3IF18tjdPazt5N+6WHBMT5v619HRBfrF3vdlZgSjk+dm26Ctw6
	LB3zovnNXdqzbUXPFT0tdB2k3fORJt8j9gZYbAArl4nxZYl1XHR6Gzn2ERHt/ZT1fdAeKXZ3H+C
	qNz0kgAQzDl7r5c1shm0KdDUwyKV585LUPxd6XdBrTNR1r60+JLXiUeyjiveRE3OkBianp4+kxb
	PaZU+fmZHXHlZVZDlQ8bifQKMXJ7RAqM=
X-Google-Smtp-Source: AGHT+IGTMDZ6DOndio2bUo3XCz1JdKR3tgUwpoqpklu4SnkC8jdsv/XAXk7JuUEjc4UpllYz/1Udbg==
X-Received: by 2002:a05:600c:a14:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-451f0b3d270mr14442625e9.33.1749027350745;
        Wed, 04 Jun 2025 01:55:50 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb09a3sm189165695e9.24.2025.06.04.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:55:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Wright Feng <wright.feng@cypress.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFC 4/4] brcmfmac: support AP isolation to restrict reachability between stations
Date: Wed,  4 Jun 2025 10:55:38 +0200
Message-ID: <20250604085539.2803896-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
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
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index dc2383faddd1..d6c8ad7ebced 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5933,6 +5933,26 @@ static int brcmf_cfg80211_del_pmk(struct wiphy *wiphy, struct net_device *dev,
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
@@ -5980,6 +6000,7 @@ static struct cfg80211_ops brcmf_cfg80211_ops = {
 	.update_connect_params = brcmf_cfg80211_update_conn_params,
 	.set_pmk = brcmf_cfg80211_set_pmk,
 	.del_pmk = brcmf_cfg80211_del_pmk,
+	.change_bss = brcmf_cfg80211_change_bss,
 };
 
 struct cfg80211_ops *brcmf_cfg80211_get_ops(struct brcmf_mp_device *settings)
@@ -7634,6 +7655,9 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
 				    BIT(NL80211_BSS_SELECT_ATTR_BAND_PREF) |
 				    BIT(NL80211_BSS_SELECT_ATTR_RSSI_ADJUST);
 
+
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_AP_ISOLATE;
+
 	wiphy->flags |= WIPHY_FLAG_NETNS_OK |
 			WIPHY_FLAG_PS_ON_BY_DEFAULT |
 			WIPHY_FLAG_HAVE_AP_SME |
-- 
2.43.5

