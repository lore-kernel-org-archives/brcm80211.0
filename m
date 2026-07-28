Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8992200110
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249975; cv=none; b=MXe5LH1ejJZDMdi5y6ZySDr6c7047DU5pOW2zTleJZXDWhyS+xyhg/Ywy0Uh5KcxBGMVdUQ5Mwu5I0UI2cVLW4w4SlSMz8ReXTeU1ZsoVqSi8NDsEYZE5dBkidxxOdaShMvKn4rPR3BS+S9eoxkrUP40q+ON5q7ZkLok1/7KtN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249975; c=relaxed/simple;
	bh=1LOZSaWG2uzh/DCffSMH3rPaWMoMWYdMtKwtKAk9vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi3j7pibuSai8lhTIe/Uzq7BmCefHrZACQ+DAOHRz+Px/7HPLQro6H2SkWFVNgO4FgGt4xi1K54rJXQmsCGp8BM1Dk5isaLRn4LvCvZI3Owp9HY+WnnADWH7glIy9hJagp7zOsRf1TZqU7Tg/qOygIq4H624x0jkv72lMZaes6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DpU2H466; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DpU2H466"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso593991e0c.1
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249972; x=1785854772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=fSetvJkrNi7+8NdOoNpTclAq0P6w7ZfXQEf6Q4VmwQ7QUOIMXOAlc790uUNmcTeslo
         HYTPXQvwK4nWFXHAQmaWV9r+MjVlOzfAf2NuZROuty+E+yHGeMWiHe58yTdr3xaC1ir5
         5klkpo2qnlbPIhGNDGfOLi0hq181a1icGL8rTsoGo5UWkMbHdc6TSWo4QiJzelFGTcVB
         +HEELYxhES72Y5q0D/Sc55HpbVfJ/oIuPp3BH/IdZzMQ3Sg4PTjcm85ubrwQ65UNHD9I
         bUCU12GsRPREUhm2lDyHcZ9HQkJ1j/Y3cUN/bAGYqJ6zFDXG1phsTw5/buzlKO4F+Qui
         2xNw==
X-Forwarded-Encrypted: i=1; AHgh+RrHHBAL24+do75PJ7CfYsfD91eTZkLyjxJN9WoCWIWQHh84RdgA0KnHM2Pw0topPJvv8FDwxN4J3/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkrOPjSif2muxuWJgklbIu7bQ1csGfbC+735rk9r0Wr91I9V2p
	q5OD7Sv9H1Wwy8etDA/fH724BWL+ffeT70/x8VdqznNp2wAXu1AWiMnfllpqmTv+X8kpkLInNfo
	KMSepaUgsao3HbHwRV4XaHkfwKDdnU1MX/hnCLA7z5lXWf4E5JZf1ByjmbHQuz/E71elytmR5/b
	9tsz1XQzmlMDhIWYhjZXNO6aJ3+KwepD6BiAl+9WE4TiVdIYRAfuazzgEYprU//+B7NIRxYs1Gx
	cttbwg72MJ9RvAJ1dQ37Q==
X-Gm-Gg: AR+sD11eH/qn3ESZdXib/N3EZVe/6Imsn8OB6ZErWTV86/YYOnaOmtdunnC8a9dFg9Q
	3jRaRenPzIh8DZWcuW2ustCsRTINyLt7syLSDSOaPOcZCvXsQgC4yO92wdnlc6W9ZH+l1qcoxCP
	vDv5OQoBPzUhoJi/zb49o6+UDYrKbPtizUIHR2E8SHRlfziW92deGHakTbX5eD6mvZTN0x7Xf4r
	l7MTOT04OA8dZAa5hY2KXNnjDtYe0jEomzY6xatjrkJRSw0cxRXR4hRSzscU7vhbbrtB+OI/Vxh
	PIi279FocLJo31JIEOU0i3zE8FnP4Zq4/qyponarGp+NRuQ3s5hEPtBoLH0Jajwtwr24OgZktzd
	gCQgrY9ehpdKtRt9DyMY2szhpx0J7DeW762Ixb8t2IHmFpsxot6DgzETiHXKlOMxRjRssm1k1UX
	8PIixAWrSroUh3wrJeR+TxDVIqJ3FICtZQaoFVqJc=
X-Received: by 2002:a05:6122:6503:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5c33f9033camr777743e0c.1.1785249972494;
        Tue, 28 Jul 2026 07:46:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97774b1f218sm476468241.0.2026.07.28.07.46.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso118411785a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249971; x=1785854771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=DpU2H466ScGYKVnUCVZdhxuJueBJU29fz7FCEk+iDDg/gPOxjp3RBxCEVmuIHPIAYK
         /DbkZNb109oXQnNyqm1xzDk1RthQfxZtvWKBdkTe4Mkoo6xw+rdtn238U11HirYwADXz
         hhv0WaePkGzoL6OjKn8vwMFrLwIwcumYf/JU4=
X-Forwarded-Encrypted: i=1; AHgh+RoWFyUdXpGND5F0XrY14pFMHAjdsRVj3fEM+EICsTSOfXVD32NQnPTKqj28PFWEERl2aUnONYbR5ks=@lists.linux.dev
X-Received: by 2002:a05:620a:6019:b0:92e:5c59:f364 with SMTP id af79cd13be357-933026e0036mr237314485a.34.1785249970644;
        Tue, 28 Jul 2026 07:46:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:92e:5c59:f364 with SMTP id af79cd13be357-933026e0036mr237308285a.34.1785249969785;
        Tue, 28 Jul 2026 07:46:09 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 07/12] wifi: wilc1000: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Tue, 28 Jul 2026 16:45:44 +0200
Message-ID: <20260728144549.2207061-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop generating cookies by incrementing inc_roc_cookie in
remain_on_channel() and via get_random_u32() in mgmt_tx(). Use the
pre-assigned cookie from cfg80211 instead. Remove the now-unused id
local variable from remain_on_channel().

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 6654fce4ded8..7c19ad34fda5 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1106,18 +1106,13 @@ static int remain_on_channel(struct wiphy *wiphy,
 	int ret = 0;
 	struct wilc_vif *vif = netdev_priv(wdev->netdev);
 	struct wilc_priv *priv = &vif->priv;
-	u64 id;
 
 	if (wdev->iftype == NL80211_IFTYPE_AP) {
 		netdev_dbg(vif->ndev, "Required while in AP mode\n");
 		return ret;
 	}
 
-	id = ++priv->inc_roc_cookie;
-	if (id == 0)
-		id = ++priv->inc_roc_cookie;
-
-	ret = wilc_remain_on_channel(vif, id, chan->hw_value,
+	ret = wilc_remain_on_channel(vif, *cookie, chan->hw_value,
 				     wilc_wfi_remain_on_channel_expired);
 	if (ret)
 		return ret;
@@ -1125,8 +1120,7 @@ static int remain_on_channel(struct wiphy *wiphy,
 	vif->wilc->op_ch = chan->hw_value;
 
 	priv->remain_on_ch_params.listen_ch = chan;
-	priv->remain_on_ch_params.listen_cookie = id;
-	*cookie = id;
+	priv->remain_on_ch_params.listen_cookie = *cookie;
 	priv->p2p_listen_state = true;
 	priv->remain_on_ch_params.listen_duration = duration;
 
@@ -1170,7 +1164,6 @@ static int mgmt_tx(struct wiphy *wiphy,
 	const u8 *vendor_ie;
 	int ret = 0;
 
-	*cookie = get_random_u32();
 	priv->tx_cookie = *cookie;
 	mgmt = (const struct ieee80211_mgmt *)buf;
 
-- 
2.54.0

