Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413422759D
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755423683; cv=none; b=bTgmNHpe7pZIyk6L86rrYc6X5e3msDECEG67+ru9mXB9a0ScxG7Ke7XPJdGCJei5SzMP1cPmOXYU4EJboGlJCgwwIFdQZFI9dnGRsCtnhhUcgyAfgNUehkWRmP7sPTaHivz/dOT6BMcMNjCnOubEfZn8rNBhEeTMSoILYuPJnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755423683; c=relaxed/simple;
	bh=IVqOq8VY5ykA1LxUNIZM4bi/9c2LjjftglL+rMie0sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9OkUJ442Ce392rLSDkLcrRYKgYZ/ZB0TPKNnTyBFKehIz7EFASiPds6v32SvPZ7iQ9eZ+BQy1gWGeY4UQMPsQpCPEwNWju/YbbdQsttY2ychWsM5jfDnjJLmcF4rHXOdOBHLiJ4OAD3OjNEwTs7F1hnwwP2/MwubGYMDYeIEuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JJYZATiJ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JJYZATiJ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70ba7aa1300so14814336d6.1
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755423681; x=1756028481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjaSJbfnGpWED1T1ZITbY+rdI/ejDCUJ/o2211bFNEE=;
        b=JJYZATiJvA7mAgebEAw7I0Tc6slpWnoQgxKNiXq2dynl/scvw31g2u0/NDWzFugNPs
         4Z2tun2ZJuOr/WhsrgoWanDoz1ljOKUSW6vGdC1BskXdQ2dx6RVtqJPqHpiDMUE+7s65
         46XImWeWvyzjooDlRFD7KIbpdZDphvzKSdd5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755423681; x=1756028481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjaSJbfnGpWED1T1ZITbY+rdI/ejDCUJ/o2211bFNEE=;
        b=nsjApVl3szUr9xsZfKhB3mcMAb71ucIgucZxXouHk34X2L6rewnuEvSqZHvcWrpCjJ
         43VNHocY8/kYno8eQUNjIfubwRa1GKSGOEciQEEhiqJ9slOsfmNYmFZKQ6X9HLv/vXKu
         kn4L2O73lCKlfXnpLXUyQ5Hmwz6pnWw8ooxH9nzgrXUoAjjmnhVb8DjUmkAl0Zti7vbP
         oAy2vqlgrzxv2EgEC0HMLsPpifvK54iQAikg/kZDvitHSFg2lMpeNDT/iK4gLvZ71b0H
         67BR+fP8/E/Gle+axsQk3HxgMwincdutg6rsLiaD8zsDilOj0+OxQklQzj0jKWZPz2Ev
         JleA==
X-Forwarded-Encrypted: i=1; AJvYcCW47/sxvcT9Ti8aGaNs+HUVze0QLMEkPG9cLJ+XbvsQNBJWJzb/ci2iYN6zZkRHPdu/GlbkWrWgLgw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB1YtVAFYWfmpIXQ8guW/nco1fj98yHdhJ/rrqKO+jpT97NHy5
	4k43dQW/7xpH7/poVnjvWsvMZYscBY4YcHnWcaa88bDxtPeCoVYEXywdUTwxfeRvug==
X-Gm-Gg: ASbGncvWGitDHxJnGpEQYCgJzyjQ1js+sb3Zhuni5waS1JynlABld/qoLiIsJSk5mAk
	HJmE+w4v+Z2rC76cEKs/pjqJ+JFhnnrYsVaJIE7z652WQOcU2PimtlIPfCZ0+QsWfj93llB6zZi
	LCn9ULsvjBPDmFWFmsWt9tOwy9KqqSRDG9sff8IWK9vVAenOgxnv1mYeEeMg1E32i28O+uj4Vuy
	IZc0RI2xgOw5SGFIl/0r+/OIRNBngMw1P5aamqEOd5ElD50YW0PrucyEADh9sdFkQFqxxutRrCf
	B6RNM3TEQhL6DSjI/qp+153NQTrGLK+ypEAQ5uOQVS2VnD1fnxSGiUB+difIq1Mo3ZyOP1Abtsk
	iWALqdzdcsxTlmLIZfSCysSA5CstalGtvddp2H8StPVai3SZ0mrP+MVDQA+OGs96CdtYYf7G3ze
	pcQ2YgYA==
X-Google-Smtp-Source: AGHT+IF0vKN518iR5gUvlTX7eR+3QrdPgnEj+Mwo8hE6UUQTw24S57Zi18GfgCIaVoHjHZuXY8FPbw==
X-Received: by 2002:ad4:5945:0:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70ba7cae369mr114044556d6.51.1755423680960;
        Sun, 17 Aug 2025 02:41:20 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f819sm35706346d6.9.2025.08.17.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 02:41:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Wright Feng <wright.feng@cypress.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wl-next 4/4] wifi: brcmfmac: support AP isolation to restrict reachability between stations
Date: Sun, 17 Aug 2025 11:41:03 +0200
Message-ID: <20250817094103.941090-5-arend.vanspriel@broadcom.com>
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
index 8af402555b5e..4fd25d916ff4 100644
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
@@ -7659,6 +7680,9 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
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

