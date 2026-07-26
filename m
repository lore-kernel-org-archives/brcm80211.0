Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25F377EC5
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093967; cv=none; b=FjNidoZwhZp4eeWlQL3uUERdmoeUMcdBmhBHgVtcedBYrCPGD1LXLzWtAfFPXRVMiTJ+vXi99/Hr9zLyWm50S1mX1dSaG+PtvDn5chThkfRkRkw/Gr5ObtV12sLYdLEwOoxCqr1Tzkb9F7PtKvaasY0+i27qPOnqGsFafBVegX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093967; c=relaxed/simple;
	bh=jjqnCmv9oDXIrOl1pvHuk1P9Bb5JrIDTD1Fg/jxkKco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4jJc7jjbpBgWW/6BgETc567Y9YvrAP9QEY33ANortr4BSWLkhMosrxXQ7I+RyXy7FAtHdYZ89egqLFsgK0A6D1avCOB3asoT0mu0RR0mO0nT2jWi5x1K0EGyFxNDNyMD12fluh+BgFx50GuOdzfNB9FKE4XZMrJdkqRKWlqHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bArD4sTc; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bArD4sTc"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso663832e0c.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093964; x=1785698764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTM33pxTJFajE0VLj8hw6g6BzNrwABVCyMkeqZSn7Oc=;
        b=oHlkn3JZy2q6xWELI7WyFvN+VJdReL16c6PtLzMDeuWHRvzrHU9G/xOGoqWbvqaviT
         oThTSc4gBSyE4ArJ1QxPFRvfdoZ/FDm8IKV8N7OCUDQJGnzhYih371M2hdzjecx40Ump
         w0LIgl33GWcCFo5dqeAU/N1/tg4VuOUDa8NEN/652RtJdKRfZPn3KfIjV5JufpEY4qiv
         cX99TIHjTE3L98CW+M8tSqq0xheFYzjZvl+rISNaeWwNyc+syF/ZfwGZ4bk4x9FPdiA0
         +uxRqx59kfMXAi+zyT4HQ4XMXOk1CRAs1EHhrTH3vRjqbX0y88xprnt9XeUVMQhfyVks
         IZGg==
X-Forwarded-Encrypted: i=1; AHgh+RrErch40SKRXXzDR+W+a/lRjTbQiVA0E/C1iLKpWNcxICJam5wpbQf6pt31j0EcV1Aad2Zlhxh+BCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBvGMTK9lzV8rOXFyrrLkJToka21cR8KZDBlyqKPq70GglUrjM
	yzUq4+x+rSdgt0sdijoXOTdrN5oBMOeoN61tq+cFdJxksMyTbqKJkUyDynAROfNxNjdWnIJP8aN
	akDa5b2EDbZ6kxFq7r2SosVi0MZmRAKC+rGnSY5ZqBNfLjBWETvV5p9X6DqoNiXp8+4xDQ8WZlN
	/RUm5fJfHVEj7Eu2iLghtdL1bnc4Il2HfBQjwFzyTmoXMAShwhcztq4ybrZlF5ORGNmnleVK63+
	/mWkTW4cly/uC+DkTfhlg==
X-Gm-Gg: AR+sD12738FYI7FkQ830Z+P5433235r/wELpGylvACEpS70ea3ogNbVJULNpIh+FGot
	K1ii/mf7udGjYBJwUJVpm4TvLuEG5PA9XuoVfT/yG2BkBBff7JUZ2SXDnulBuYdr5vOIjViZ99i
	DJsACgV8o96AAAC6YGWBPu2478758qBHJptJWhwVj9jXGEgSq4ccwuhZ2S1NrfZ4SbfqAVFI/hJ
	Cy9o1rxjVltmFNVbgWX/62MshjMhxsPJuRZIrU8Vvi4/eQmAJwcAsf6Dg9HDF1p+3Nu5zLuRpY1
	znnGo/9tNCWJRbwtzXEr1Ku/84AG7mnQXr57C2mJ0xc7HbB0gYfZWK2GqiWBLmqHkYs46Zfl0BE
	0zgZgJM/muzCjB7rwREsKX5YylsluOi64ciZFNxe0reVckGTZeY9cRmWHO42zXU6dnwVISwcOge
	trsbYJlHl+JGmTITz3xMDQDjufXJNAo7DEDmfmWlo=
X-Received: by 2002:a05:6102:80a3:b0:726:f965:722b with SMTP id ada2fe7eead31-750407c3284mr3270429137.21.1785093964291;
        Sun, 26 Jul 2026 12:26:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-75033469929sm373659137.4.2026.07.26.12.26.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so3227366a91.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093963; x=1785698763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTM33pxTJFajE0VLj8hw6g6BzNrwABVCyMkeqZSn7Oc=;
        b=bArD4sTcU7xdPvoB8oXwxWYQtYFVa6vgJG9ZVXmThO1c4rASFnRSkfOvQ6V3bDAjoH
         Gi3fsnodqAs2Wq4dzhi4C31IfJssVOJWBnXpQAskeWU0Jye7H+oQQMvq88P54etG2bhY
         Z2Ihuos7JDtlzNod4Qo/057yl2c1iqVfv60Yg=
X-Forwarded-Encrypted: i=1; AHgh+Rrl6tiSA65Ve7JkGc0zLE4oEKbOWlFBFT8nZSX06Ycdp+NsA9u2xoyp++1OrzVAIKceROIrxVcUmF0=@lists.linux.dev
X-Received: by 2002:a17:90b:3946:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-38f296089bfmr5394633a91.21.1785093963069;
        Sun, 26 Jul 2026 12:26:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-38f296089bfmr5394628a91.21.1785093962624;
        Sun, 26 Jul 2026 12:26:02 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:26:01 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 06/10] wifi: mwifiex: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Sun, 26 Jul 2026 21:25:37 +0200
Message-ID: <20260726192541.2816743-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop generating cookies via get_random_u32() in
mwifiex_cfg80211_remain_on_channel() and mwifiex_cfg80211_mgmt_tx().
Use the pre-assigned cookie from cfg80211 instead.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 99d96088e364..7f446a22a370 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -259,7 +259,6 @@ mwifiex_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	tx_info->pkt_len = pkt_len;
 
 	mwifiex_form_mgmt_frame(skb, buf, len);
-	*cookie = get_random_u32() | 1;
 
 	if (ieee80211_is_action(mgmt->frame_control))
 		skb = mwifiex_clone_skb_for_tx_status(priv,
@@ -326,7 +325,6 @@ mwifiex_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = get_random_u32() | 1;
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
2.54.0

