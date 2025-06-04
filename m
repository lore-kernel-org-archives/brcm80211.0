Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113F1804A
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027353; cv=none; b=YQveKliqhRhFf/MbP9mb3yLCeaytLhJSVWdZ60/RWaoyUwTILoizsCfvcstO3GacJkGY/ZuDp/Ua2b53ZeWwFH9MUCMdwc0svd8cPUbLGhhjbBSWsLB3mRShigyXfx0SpQANVeBC9YKiwVAEtyzxBRDF0612TCFOz40zFAVAysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027353; c=relaxed/simple;
	bh=1c5LrK0Fk1EO/Adw+bATD3TdniSWOomw3Bv3lR7Xj8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZFYrKrfChImBJyqvaznuYCTOA31qTtaGEFcZMm12R8TlaSBf1OECVq5qY6qHE9HWMmr81ducPc1ggnOkwKdDMhKEwW5+3Fyskv9CN63n8siF191DbBs4seHEifoyDw7fTdWvULUV3F8La7Jhz58H4/QUPYUdwB3vpC/Q3j8xX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GXg1kRYV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GXg1kRYV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2619334f8f.1
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749027349; x=1749632149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTKtpwY/vyufTi7bF9eaoXcaPKcDU3kFUjpnUiApBsQ=;
        b=GXg1kRYVKiUbO5sw1nKAAOmbgg8sU5d2D6N+47i52JezqasEq4gKCIR+tjC62A4lYz
         U6AuvPBoNML9Mw+2pEaqPIRHRNrA6YUU0kyb4jwLRpNawqcvnuM11z26T3FAufRtt238
         M3EIYvQvy8yHzWe3WkeRVYUspBVeUg6O8SqP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027349; x=1749632149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTKtpwY/vyufTi7bF9eaoXcaPKcDU3kFUjpnUiApBsQ=;
        b=L5mWmBRknKIeHg24VvJ6NU8awYd5p+IWjaDRSDJquUOVAIZXdECLTlj97kAYTh2y0b
         fJSZq+53hBXbtJAx5gZF4lipmfJr2AJ8sJLLyeMsFp3lCKjD+6S+PFe0FJ8E6X7vssBv
         HvsZz0WW5MXtVVXNuzLKUn4GcsnNzL8mlQXWPbEKgPoBJJSvmJKWxE1M4Y2FM42sJ08W
         mRLAu+YG4qRJa8cPJ+rTZOxTbYcfoScPZejaqNIJGDSUuQh3twkW1k+ftJrU6Q+wzlJZ
         E+HDLaBN5e9Yjmd8dM6ySciSvJZSj3WUrWHrgF0c4SoNe95qv/9XqQkLwOwkEMpx0/2H
         UoBA==
X-Forwarded-Encrypted: i=1; AJvYcCW1FYSXsF0U/BzLrPIsm8mD9sN3gjvLhphYRS0kMCdlskadmd8sJ8rIk7mB/GMJ7rjZQzVajjOGaco=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6j+FsEdA1Pcv7Lin+7t2/XJHXs/QyDQ49JLXqLU+7WuU8+k8q
	Jm4JKww1AzcOeRVvVDv1zGiYUs+uYYI+xYQg51PxRYseTGnHKSTqzutqItMcldqa6w==
X-Gm-Gg: ASbGncspErl3gLwc8qFgrkocNI1Ouq5MYg2GO1/XmpPqnNa1sUkmP2+2Cnu/3rYoO3k
	iN3Efrrf8kp2SAOlO6w6W3ikydVDFp8YmIdeYzdUPkMEMGvt/MG0wkE1OwdVIvWoViW53CpTgSb
	iS4fmSvup15W++zXk1rip18UHiOdXT7VyOIyYhLrhrAe4FWbtlmnzf0FECqhZPt1g83/v+d08Um
	sWA8cDY+yVlzCA7bmttGri8re3o38WnDF2hE41/030ESg343l9nj4ntf++L33VNfPuUja3pfl3k
	RiBR3GnPf48Y5z0h49CtLDqmXTGdA5b3YQ/KOjsMpjEe+o4mvDVcI++7vUbQ7wjHtPfIoPxceo1
	9USMfACq0zzDTG9qdQoGmTWKDsgfgOVQ=
X-Google-Smtp-Source: AGHT+IFOG5jsvfEG+3Qtg2+eovRo9reXR3HCNL86SGho9AKwOLeAFQrE0THQGreYykN84ZMixAnNrA==
X-Received: by 2002:a05:6000:4205:b0:3a0:7d39:c23f with SMTP id ffacd0b85a97d-3a51d92987emr1460203f8f.21.1749027349365;
        Wed, 04 Jun 2025 01:55:49 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb09a3sm189165695e9.24.2025.06.04.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:55:48 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFC 3/4] wifi: nl80211: strict checking attributes for NL80211_CMD_SET_BSS
Date: Wed,  4 Jun 2025 10:55:37 +0200
Message-ID: <20250604085539.2803896-4-arend.vanspriel@broadcom.com>
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

Assure user-space only modifies attributes for NL80211_CMD_SET_BSS
that are supported by the driver. This stricter checking is only done
when user-space commits to it by including NL80211_ATTR_BSS_PARAM.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 include/uapi/linux/nl80211.h |  5 ++++-
 net/wireless/nl80211.c       | 30 +++++++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b81dffad2f8f..ef35c49c3478 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2900,7 +2900,10 @@ enum nl80211_commands {
  *	in the kernel or device.
  *
  * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
- *	which indicates which BSS parameters can be modified.
+ *	which indicates which BSS parameters can be modified. The attribute can
+ *	also be used as flag attribute by user-space in %NL80211_CMD_SET_BSS to
+ *	indicate that it wants strict checking on the BSS parameters to be
+ *	modified.
  *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index bf3cd044de13..686592fabe82 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -854,6 +854,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_MLO_RECONF_REM_LINKS] = { .type = NLA_U16 },
 	[NL80211_ATTR_EPCS] = { .type = NLA_FLAG },
 	[NL80211_ATTR_ASSOC_MLD_EXT_CAPA_OPS] = { .type = NLA_U16 },
+	[NL80211_ATTR_BSS_PARAM] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -8265,6 +8266,8 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
 	struct net_device *dev = info->user_ptr[1];
 	struct bss_parameters params;
+	u32 changed = 0;
+	bool strict;
 
 	memset(&params, 0, sizeof(params));
 	params.link_id = nl80211_link_id_or_invalid(info->attrs);
@@ -8277,26 +8280,38 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	params.p2p_ctwindow = -1;
 	params.p2p_opp_ps = -1;
 
-	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT])
+	strict = nla_get_flag(info->attrs[NL80211_ATTR_BSS_PARAM]);
+	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT]) {
 		params.use_cts_prot =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_CTS_PROT]);
-	if (info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE])
+		changed |= WIPHY_BSS_PARAM_CTS_PROT;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE]) {
 		params.use_short_preamble =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE]);
-	if (info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME])
+		changed |= WIPHY_BSS_PARAM_SHORT_PREAMBLE;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME]) {
 		params.use_short_slot_time =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME]);
+		changed |= WIPHY_BSS_PARAM_SHORT_SLOT_TIME;
+	}
 	if (info->attrs[NL80211_ATTR_BSS_BASIC_RATES]) {
 		params.basic_rates =
 			nla_data(info->attrs[NL80211_ATTR_BSS_BASIC_RATES]);
 		params.basic_rates_len =
 			nla_len(info->attrs[NL80211_ATTR_BSS_BASIC_RATES]);
+		changed |= WIPHY_BSS_PARAM_BASIC_RATES;
 	}
-	if (info->attrs[NL80211_ATTR_AP_ISOLATE])
+	if (info->attrs[NL80211_ATTR_AP_ISOLATE]) {
 		params.ap_isolate = !!nla_get_u8(info->attrs[NL80211_ATTR_AP_ISOLATE]);
-	if (info->attrs[NL80211_ATTR_BSS_HT_OPMODE])
+		changed |= WIPHY_BSS_PARAM_AP_ISOLATE;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_HT_OPMODE]) {
 		params.ht_opmode =
 			nla_get_u16(info->attrs[NL80211_ATTR_BSS_HT_OPMODE]);
+		changed |= WIPHY_BSS_PARAM_HT_OPMODE;
+	}
 
 	if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
 		if (dev->ieee80211_ptr->iftype != NL80211_IFTYPE_P2P_GO)
@@ -8306,6 +8321,7 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 		if (params.p2p_ctwindow != 0 &&
 		    !(rdev->wiphy.features & NL80211_FEATURE_P2P_GO_CTWIN))
 			return -EINVAL;
+		changed |= WIPHY_BSS_PARAM_P2P_CTWINDOW;
 	}
 
 	if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
@@ -8318,6 +8334,7 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 		if (params.p2p_opp_ps &&
 		    !(rdev->wiphy.features & NL80211_FEATURE_P2P_GO_OPPPS))
 			return -EINVAL;
+		changed |= WIPHY_BSS_PARAM_P2P_OPPPS;
 	}
 
 	if (!rdev->ops->change_bss)
@@ -8327,6 +8344,9 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	    dev->ieee80211_ptr->iftype != NL80211_IFTYPE_P2P_GO)
 		return -EOPNOTSUPP;
 
+	if (strict && (changed & ~rdev->wiphy.bss_param_support))
+		return -EINVAL;
+
 	return rdev_change_bss(rdev, dev, &params);
 }
 
-- 
2.43.5

