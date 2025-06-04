Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BE1DED6D
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027350; cv=none; b=OGMp3u21lMm7xVs/p6A+AMx5nI23N6l9Kztef8hYYs8aUQd0vxHa+dF8ex9A0tJZB9NeKCzid/WUkBntXLMmTzouCjN2CG1MTHf8fqy9edgtRI42MwMss4xpdbLT5r60bQIj/mzVIc7iqAi5+UaZwcnm3D6Dxj+Xc8N46MKFj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027350; c=relaxed/simple;
	bh=kobPPUEAAfS7+2sRgxlo8foABZXoKkSiwucOq66MWJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwYjywwhxzHXkzxUHXsubZGPhOLgd8N7he4EU2pbLzRfKFuEoohqi0Bm1Zr/dOk9YPBtnEEw7BhbsAFJHo9tlkw5JXYj/YGB8uO4mOT8/BCHuZVIqo4ItKt7nTLk6bzI2SyMGqUducSKsXcXHtFVNagVGajQhoz7mXgEw6HuBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C3v8fidS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C3v8fidS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a367ec7840so4579974f8f.2
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749027346; x=1749632146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txWsZdY/j2eCvGNwWqWYzdxsjKCyeCghlNrrPm8TRYk=;
        b=C3v8fidS4iiXPU9mb2q/In8c34Xjc2X5n391siEMeHbPPznMsGfkMNGrkcolkaNacC
         JRCGHcj+OVxyDNoqD9a6Sr5ZsIIJ+cPBOkYhjO6sJa1VU5p233eKnyBySzPt30wPECNx
         axzR0OE8wG7twAS7jMcES5b0l2n5zAuue9tHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027346; x=1749632146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txWsZdY/j2eCvGNwWqWYzdxsjKCyeCghlNrrPm8TRYk=;
        b=MxHw4g7su/e0ih0KJ/zO2vvdq0GFLsjKaKwb9xHa34HbPWI2wmMHG4A9duNwFQgW1b
         wci/bx1r+f8XdOe0ruTPw5xP2YjjKFWQMQ3ZN7NdZtQzXQ+tSrkRxfSaonq+Ia7lAKki
         75Sv2rkA4StIRhDv9zjj3/noD2mwKbymu4l3mMc7tvvsW7z3fLLVfYOIHKf42zG+xYcG
         y7ldYya96exTyB6KhFXymjDbJ+2wmWO67wNPydPYuMVUWew6nnXln5veHaHDqrKWMywK
         B7m92Z16V+liEqybFjmOkZSsWi63PgM/MLcxoeaTR8+SRs3ouK1scHCjRJ++/jvyMgLj
         nSoA==
X-Forwarded-Encrypted: i=1; AJvYcCX5xticb/ChInO1EmbZ4Lt4riGUNM7sqO5NhXr+d2q7aL6zkvpg/OwBbCPlCGfo/j2aFG2/9V3Xs4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa8S/6+c5ZrTM2ALL76C7DJXG5xe9oLC2OWSwftigKJbb58CGh
	AOACznW9l0suO8N9k6n/s+LoEkBWp5XFiIjzskinP2sUuaRe69tL0F4vnINuToURJOQDSLIydeG
	Y4c5Nbw==
X-Gm-Gg: ASbGncsjaEioM6Lvv+JLmxX4qNFu+Rxh/h8gmGnxN/4G9lELbc5cY7cr06pj5/8ySVN
	1P5ebCLX/w/E/gXwnxkhVls0mRM4DthWfisCoLqmEux4qdIoVAGPAlvftXgNkjthIQci/8Yks/Y
	KBb4wdaJRwctiBKZtJEMUDnoMOHpZR4rHgECD7ZGExUN6rjqaC/XCkpb3nmVNF+EEPi98aRdQgG
	nHvoDha0bqEyCPmXsmhKFwXLfA+7xy8WAjALcaHY494UfNtfHR845OG0aEdVuFgTvTVgRjYqL4h
	7RjsVBMboS3+P7g99GK/J1japVWkQAhisGmY2M/UJWCFp1JdLrBWWDHOiwOTymv2E5DuqG2/VKg
	PIePp2WPJ+OItPv3Jdgm5kSRm8S2cyOQ=
X-Google-Smtp-Source: AGHT+IHBc9A7qhONZIeU8GfRbrUtUNGSHBHen2pxv3ub+R4FjzMp/AhQCa7Advc1++iHB0hsTptHkg==
X-Received: by 2002:a05:6000:2409:b0:3a4:ed4c:422f with SMTP id ffacd0b85a97d-3a51d96e1d7mr1461784f8f.44.1749027346566;
        Wed, 04 Jun 2025 01:55:46 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb09a3sm189165695e9.24.2025.06.04.01.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:55:46 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFC 1/4] wifi: nl80211: allow drivers to support subset of NL80211_CMD_SET_BSS
Date: Wed,  4 Jun 2025 10:55:35 +0200
Message-ID: <20250604085539.2803896-2-arend.vanspriel@broadcom.com>
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

The so-called fullmac devices rely on firmware functionality and/or API to
change BSS parameters. Today there are limited drivers supporting the
nl80211 primitive, but they only handle a subset of the bss parameters
passed if any. The mac80211 driver does handle all parameters and stores
their configured values.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 include/net/cfg80211.h       | 30 ++++++++++++++++++++++++++++++
 include/uapi/linux/nl80211.h |  4 ++++
 net/wireless/nl80211.c       | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index d1848dc8ec99..8f9338c1e976 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -2326,6 +2326,30 @@ struct mpath_info {
 	int generation;
 };
 
+/**
+ * enum wiphy_bss_param_flags - bit positions for supported bss parameters.
+ *
+ * @WIPHY_BSS_PARAM_CTS_PROT: support changing CTS protection.
+ * @WIPHY_BSS_PARAM_SHORT_PREAMBLE: support changing short preamble usage.
+ * @WIPHY_BSS_PARAM_SHORT_SLOT_TIME: support changing short slot time usage.
+ * @WIPHY_BSS_PARAM_BASIC_RATES: support reconfiguring basic rates.
+ * @WIPHY_BSS_PARAM_AP_ISOLATE: support changing AP isolation.
+ * @WIPHY_BSS_PARAM_HT_OPMODE: support changing HT operating mode.
+ * @WIPHY_BSS_PARAM_P2P_CTWINDOW: support reconfiguring ctwindow.
+ * @WIPHY_BSS_PARAM_P2P_OPPPS: support changing P2P opportunistic power-save.
+ */
+enum wiphy_bss_param_flags {
+	WIPHY_BSS_PARAM_CTS_PROT = BIT(0),
+	WIPHY_BSS_PARAM_SHORT_PREAMBLE = BIT(1),
+	WIPHY_BSS_PARAM_SHORT_SLOT_TIME = BIT(2),
+	WIPHY_BSS_PARAM_BASIC_RATES = BIT(3),
+	WIPHY_BSS_PARAM_AP_ISOLATE = BIT(4),
+	WIPHY_BSS_PARAM_HT_OPMODE = BIT(5),
+	WIPHY_BSS_PARAM_P2P_CTWINDOW = BIT(6),
+	WIPHY_BSS_PARAM_P2P_OPPPS = BIT(7),
+	WIPHY_BSS_PARAM_MASK = (WIPHY_BSS_PARAM_P2P_OPPPS << 1) - 1
+};
+
 /**
  * struct bss_parameters - BSS parameters
  *
@@ -5638,6 +5662,11 @@ struct wiphy_radio {
  *	and probe responses.  This value should be set if the driver
  *	wishes to limit the number of csa counters. Default (0) means
  *	infinite.
+ * @bss_param_support: bitmask indicating which bss_parameters as defined in
+ *	&struct bss_parameters the driver can actually handle in the
+ *	.change_bss() callback. The bit positions are defined in &enum
+ *	wiphy_bss_param_flags.
+ *
  * @bss_select_support: bitmask indicating the BSS selection criteria supported
  *	by the driver in the .connect() callback. The bit position maps to the
  *	attribute indices defined in &enum nl80211_bss_select_attr.
@@ -5817,6 +5846,7 @@ struct wiphy {
 
 	u8 max_num_csa_counters;
 
+	u32 bss_param_support;
 	u32 bss_select_support;
 
 	u8 nan_supported_bands;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index e9ccf43fe3c6..b81dffad2f8f 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2899,6 +2899,9 @@ enum nl80211_commands {
  *	APs Support". Drivers may set additional flags that they support
  *	in the kernel or device.
  *
+ * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
+ *	which indicates which BSS parameters can be modified.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3455,6 +3458,7 @@ enum nl80211_attrs {
 	NL80211_ATTR_EPCS,
 
 	NL80211_ATTR_ASSOC_MLD_EXT_CAPA_OPS,
+	NL80211_ATTR_BSS_PARAM,
 
 	/* add attributes here, update the policy in nl80211.c */
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fd5f79266471..bf3cd044de13 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -2996,6 +2996,40 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
 			    rdev->wiphy.ext_features))
 			goto nla_put_failure;
 
+		if (rdev->wiphy.bss_param_support) {
+			struct nlattr *nested;
+			u32 parsup = rdev->wiphy.bss_param_support;
+
+			nested = nla_nest_start(msg, NL80211_ATTR_BSS_PARAM);
+			if (!nested)
+				goto nla_put_failure;
+
+			if ((parsup & WIPHY_BSS_PARAM_CTS_PROT) &&
+			    nla_put_flag(msg, NL80211_ATTR_BSS_CTS_PROT))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_SHORT_PREAMBLE) &&
+			    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_PREAMBLE))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_SHORT_SLOT_TIME) &&
+			    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_SLOT_TIME))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_BASIC_RATES) &&
+			    nla_put_flag(msg, NL80211_ATTR_BSS_BASIC_RATES))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_AP_ISOLATE) &&
+			    nla_put_flag(msg, NL80211_ATTR_AP_ISOLATE))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_HT_OPMODE) &&
+			    nla_put_flag(msg, NL80211_ATTR_BSS_HT_OPMODE))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_P2P_CTWINDOW) &&
+			    nla_put_flag(msg, NL80211_ATTR_P2P_CTWINDOW))
+				goto nla_put_failure;
+			if ((parsup & WIPHY_BSS_PARAM_P2P_OPPPS) &&
+			    nla_put_flag(msg, NL80211_ATTR_P2P_OPPPS))
+				goto nla_put_failure;
+			nla_nest_end(msg, nested);
+		}
 		if (rdev->wiphy.bss_select_support) {
 			struct nlattr *nested;
 			u32 bss_select_support = rdev->wiphy.bss_select_support;
-- 
2.43.5

