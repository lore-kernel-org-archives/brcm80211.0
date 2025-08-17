Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503121FF26
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755457499; cv=none; b=jc8cD1apESiE95mLMAF4fBuIpf/cwUnBg7U+keZzYSY0lH5dZlhx0BMkhRLiX8Rogf54MVkbfIozthqH5WblAOZiZHu7VSTYxZRmN8nWPt53TwMuOb6IVkRr7Cc3elJqtUyeSkFspmZcr+mLgbGb0bRNuLQHf4uJz0zxo+4mBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755457499; c=relaxed/simple;
	bh=vEFVbB2SmisgIXJoaMjaiuVu+dXZ4m1ouQNidypipqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1lXjbIvSdzBg0rXLltMsE0B6i8tSbBqk9kXnCtff5nhfHk+3IA8dvclJfB/zypznjGSL8YSl7UikaHMRJ6fcVvXMQc7SmgdWms9mh7zfN3ejDnZCKOBjOvTAtkilMEhNwM8svfXhrpz1efkuXGfbAnCwRdgncI9z4JAAmIACWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A6VUhNK4; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A6VUhNK4"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b133b24e66so6443721cf.2
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755457496; x=1756062296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0K9F9stUcHItMGPx2gd9JWX+dHSLyDbc7/NXa2s6Tvk=;
        b=A6VUhNK4z+pjadEXOt4RQYG4wJ8qIrGwSkySGwOo3qD8RQOx/pLBrjFhFT8vGcAeaN
         TbxudgMormLZyTxCTIugkD0ru2KlSeRvTUWThfS/THXDiVaFJfmckG4nxKVDioIUkIRU
         Z7meyfRPm56X8vbsHROQuAiMK1jglTvCLA9xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755457496; x=1756062296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0K9F9stUcHItMGPx2gd9JWX+dHSLyDbc7/NXa2s6Tvk=;
        b=lMKm7Q8i616VX0cxqMVoodfz3UnY75qZEHVB+vzmaNkhH7z+OG/48vFOj40x4gzb+Y
         GjNromovIzVf+/gFfA1DiTLnoaOhWoax+IkWCNznyN/6rHxzOAQZowZYxDwENTZzdvVo
         BcLqGAjA5OK08liVU16+o8mC6QwUij3Pj6tTeDxSEYRP880LkyMBalopXGF3bui2+hh5
         t5ARd69ePwbiXfFN+FynDXyF/I1cdI4sErSc5WzSqnO8KukFDUj/Jv4vupnAN+yUZwPy
         WK8bDk7qgdWRAPN9A0spdPp2cCG9VLUntUMrtcEAHX9/Xw/ApSD3bNTy1TWGdkGn4aNL
         Jf3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgoecdoMNM5kE77g8P8ZDIsiDkv0HOGD8n9p2w53b4cX7oywu7O7C9rfpV0jdT8u5pPewZrzBKwH0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0WYezIBk/RUgeTYBDpPpru6jtJjGQoOYSgIBuS7OFk7VnGh+t
	Vp26WkZQryoIjgSCM2KsdmgGLjqH0yk1pRYqVuF+ZahcPgrPYGqp5SDotRGajUpCGzgvkmSCc3d
	QunQJ+WjW
X-Gm-Gg: ASbGncuTzIPXV/p2SuWJgj6ETJkc6V/DuUKYU2YI/ybA/K+KXNErtK4x/9LP25g6yCm
	Jz7ksTAmtt2xMcEW3nyNaRiW3ggmYqNuOQUJFjFZCGSirTQQE1j4iMvZbrP/Yyi+J+s3DxIhV+h
	Lpr/Yyy8Q1fioF6APSwEeuLmr9/whbwYtVGc7NG8utNT5ZI1CbG69QADlkf43PiQqZ9DYMfANPv
	QAEeexLlb2tSjpVhgi3V2C8bq4ox3zbjdcQqi98lMB/D/mLIdBrSdQlDTglszofazichz4yGtaf
	OYhCojkWgzghcff9O6kdFe9pPbEZvC8t7u5xvmhsaiSRDl3NKpDYUcFKoSl1C4Dvi9xHdIl9bV4
	YX+qS0N7mzLj5xdL59K/uYS86QjpC+bOmSe1tpv3I8WR4tLPcTWk+ghgstC+FFuRAKuroR4scHl
	XArOSagQ==
X-Google-Smtp-Source: AGHT+IGi9Zj7stGLJybSRddb3OnvwILzVShuwQyRhJS2TSWURorhoA2bJxWJb8jYjrjKAMzlED6Quw==
X-Received: by 2002:a05:622a:4a1a:b0:4ab:9586:bdd6 with SMTP id d75a77b69052e-4b12a3afe95mr100367011cf.53.1755457496500;
        Sun, 17 Aug 2025 12:04:56 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50b31sm40382461cf.51.2025.08.17.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:04:56 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 3/4] wifi: nl80211: strict checking attributes for NL80211_CMD_SET_BSS
Date: Sun, 17 Aug 2025 21:04:34 +0200
Message-ID: <20250817190435.1495094-4-arend.vanspriel@broadcom.com>
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

Assure user-space only modifies attributes for NL80211_CMD_SET_BSS
that are supported by the driver. This stricter checking is only done
when user-space commits to it by including NL80211_ATTR_BSS_PARAM.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 include/uapi/linux/nl80211.h |  5 +++-
 net/wireless/nl80211.c       | 52 +++++++++++++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b27614269d98..9e0427ecaf3c 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2929,7 +2929,10 @@ enum nl80211_commands {
  *	@enum nl80211_s1g_short_beacon_attrs for the attribute definitions.
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
index 379c6d40b650..66b58a1d43db 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -871,6 +871,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_S1G_LONG_BEACON_PERIOD] = NLA_POLICY_MIN(NLA_U8, 2),
 	[NL80211_ATTR_S1G_SHORT_BEACON] =
 		NLA_POLICY_NESTED(nl80211_s1g_short_beacon),
+	[NL80211_ATTR_BSS_PARAM] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -8864,6 +8865,8 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	struct net_device *dev = info->user_ptr[1];
 	struct bss_parameters params;
 	u32 bss_param_support = rdev->wiphy.bss_param_support;
+	u32 changed = 0;
+	bool strict;
 
 	memset(&params, 0, sizeof(params));
 	params.link_id = nl80211_link_id_or_invalid(info->attrs);
@@ -8876,26 +8879,54 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	params.p2p_ctwindow = -1;
 	params.p2p_opp_ps = -1;
 
-	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT])
+	strict = nla_get_flag(info->attrs[NL80211_ATTR_BSS_PARAM]);
+	if (info->attrs[NL80211_ATTR_BSS_CTS_PROT]) {
+		if (strict && !(bss_param_support & WIPHY_BSS_PARAM_CTS_PROT))
+			return -EINVAL;
 		params.use_cts_prot =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_CTS_PROT]);
-	if (info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE])
+		changed |= WIPHY_BSS_PARAM_CTS_PROT;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE]) {
+		if (strict &&
+		    !(bss_param_support & WIPHY_BSS_PARAM_SHORT_PREAMBLE))
+			return -EINVAL;
 		params.use_short_preamble =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_SHORT_PREAMBLE]);
-	if (info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME])
+		changed |= WIPHY_BSS_PARAM_SHORT_PREAMBLE;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME]) {
+		if (strict &&
+		    !(bss_param_support & WIPHY_BSS_PARAM_SHORT_SLOT_TIME))
+			return -EINVAL;
 		params.use_short_slot_time =
 		    nla_get_u8(info->attrs[NL80211_ATTR_BSS_SHORT_SLOT_TIME]);
+		changed |= WIPHY_BSS_PARAM_SHORT_SLOT_TIME;
+	}
 	if (info->attrs[NL80211_ATTR_BSS_BASIC_RATES]) {
+		if (strict &&
+		    !(bss_param_support & WIPHY_BSS_PARAM_BASIC_RATES))
+			return -EINVAL;
 		params.basic_rates =
 			nla_data(info->attrs[NL80211_ATTR_BSS_BASIC_RATES]);
 		params.basic_rates_len =
 			nla_len(info->attrs[NL80211_ATTR_BSS_BASIC_RATES]);
+		changed |= WIPHY_BSS_PARAM_BASIC_RATES;
 	}
-	if (info->attrs[NL80211_ATTR_AP_ISOLATE])
-		params.ap_isolate = !!nla_get_u8(info->attrs[NL80211_ATTR_AP_ISOLATE]);
-	if (info->attrs[NL80211_ATTR_BSS_HT_OPMODE])
+	if (info->attrs[NL80211_ATTR_AP_ISOLATE]) {
+		if (strict && !(bss_param_support & WIPHY_BSS_PARAM_AP_ISOLATE))
+			return -EINVAL;
+		params.ap_isolate =
+			!!nla_get_u8(info->attrs[NL80211_ATTR_AP_ISOLATE]);
+		changed |= WIPHY_BSS_PARAM_AP_ISOLATE;
+	}
+	if (info->attrs[NL80211_ATTR_BSS_HT_OPMODE]) {
+		if (strict && !(bss_param_support & WIPHY_BSS_PARAM_HT_OPMODE))
+			return -EINVAL;
 		params.ht_opmode =
 			nla_get_u16(info->attrs[NL80211_ATTR_BSS_HT_OPMODE]);
+		changed |= WIPHY_BSS_PARAM_HT_OPMODE;
+	}
 
 	if (info->attrs[NL80211_ATTR_P2P_CTWINDOW]) {
 		if (dev->ieee80211_ptr->iftype != NL80211_IFTYPE_P2P_GO)
@@ -8905,6 +8936,7 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 		if (params.p2p_ctwindow != 0 &&
 		    !(bss_param_support & WIPHY_BSS_PARAM_P2P_CTWINDOW))
 			return -EINVAL;
+		changed |= WIPHY_BSS_PARAM_P2P_CTWINDOW;
 	}
 
 	if (info->attrs[NL80211_ATTR_P2P_OPPPS]) {
@@ -8913,9 +8945,11 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 		if (dev->ieee80211_ptr->iftype != NL80211_IFTYPE_P2P_GO)
 			return -EINVAL;
 		tmp = nla_get_u8(info->attrs[NL80211_ATTR_P2P_OPPPS]);
+		if (tmp && !(bss_param_support & WIPHY_BSS_PARAM_P2P_OPPPS))
+			return -EINVAL;
 		params.p2p_opp_ps = tmp;
 		if (params.p2p_opp_ps &&
-		    !(bss_param_support & WIPHY_BSS_PARAM_P2P_OPPPS))
+		    !(rdev->wiphy.bss_param_support & WIPHY_BSS_PARAM_P2P_OPPPS))
 			return -EINVAL;
 	}
 
@@ -8926,6 +8960,10 @@ static int nl80211_set_bss(struct sk_buff *skb, struct genl_info *info)
 	    dev->ieee80211_ptr->iftype != NL80211_IFTYPE_P2P_GO)
 		return -EOPNOTSUPP;
 
+	changed &= rdev->wiphy.bss_param_support;
+	if (!changed)
+		return 0;
+
 	return rdev_change_bss(rdev, dev, &params);
 }
 
-- 
2.43.5

