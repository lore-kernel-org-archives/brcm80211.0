Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B5414A2C
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501334; cv=none; b=L370cb4E8c8F66vthjy9nSEXNXSB4bSbTx+pmqsRJYxnOR/iqwlBOQWYdt7wg9pzMarHLMJRCTMq9OFOrFv/OSf29S71iDDAK4dbN5a6QvEu28JIDq71HWQRAt20S/hdH5ICDDapHpoT31OkaQCIRCFq+dKu3V+J1vwZWQdjHFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501334; c=relaxed/simple;
	bh=I3aadDL+9qPkWnU0DtywGPXm6Z+XaLqLu1JHFcrTfHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpQNW6pPxFQz4Oiz7yLeW/g1GRWV8YCzH0ObCmc6RkXcJ3kcIk9rCPcqa43qGk2ulsJlg8kvf+1AN11/BfKxX9UwsCW7GY5WW8BPZBuCneXATyKbUqKO7xthV9FtRGoysuPBPYNOn+CXV8A5RMSslM0k5JtliBdx2DFSthDIFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y3EoZplp; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y3EoZplp"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2caea3f742bso10016275ad.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501333; x=1786106133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHW+hZWYhkatdbcvERYAFF4nyTSnep77JL8vaFLl32I=;
        b=DDEplUIGrKv8JjEC/KQjfW8ySua/tQ3YYLcsi2CK0WBX1T0MnCJMlf55cKMItw2cqV
         AyBA3wxacERTA/C6v4WhPjQ6Day9ARk1hnkKVBPhZ55aPpGDGe6cBVfm/0eg6wdjvzJy
         k9XvtC9LS1J3INf3GKSYCslixYOS7uXVHdED1ODJp7QsxkQjf7Rk0hEVxOwPiQZv0bUB
         aE1azSmyjsA7uqN7xKmZ4ljmCxNvSuJxR0RuoJMBeIJcRqXWgw/W+vOfVQpmPTmeuGm8
         /cm4hpUnyNKyzX2WvFIHV4wvfGoM7QZ/xcsRY8BLSKK4iAON9lezg5CtS2cE5TQ7d5CP
         nDlA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4DzxGTtW4VojWHwQyKXPyFy4tHk96DzyiVFzxPTOvBtWitlyvswgAeUScT8Np8kWY3cEtcmytzrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzuYnR86EkBTx4IOgxOJZLlH82G0JV5pT45K214HYTy9/WHf6Z
	bizL4F9LwBwmk9Lqbdhuf0k5GnvHlQ43z93lLCs4z80FsVEDIyByMKywFPooASZLVIQauRL47yc
	xSwgh0NpHEesMErhiHRBeCBCTOWQjdtpYj7G0IY86LvhsU9y9VYTQqaxYcPC3XKmCb0XHsWE+kK
	zLvuNnLOjpZV+NdgRUXNpHo44YCYur06gGu3sHf6KznpsYMmRVe4pkzud4vVmaX3TRggmnorvRO
	uma57/OotWH8V/lrDuFdg==
X-Gm-Gg: AR+sD13IbjFvrPFJO4qAkD9P3M/KRNpsZ/RBmI6zLECAoCTR3UB86d+lG6avGhciaCi
	f9mZJG7r3oEduZMZfSaKJYYssJj3J2CjFR5VVzatDFn8ul/cY/xPMQrDr2q0u9Jl/g5X3IcR67F
	qJnkg07NDepOKYKhw4K2fDMW4AHcyRnAG8cmxxhCiUkz9KrcdH7rtTfraAUU6D8tANh6p7BfK97
	3cFXnWcppg0ZTYsxZ6MHFGks9m8zyvPL40TqeLe1qp5KU+1qaNRlX5IEiYSAxFNuC//24FJ/+7B
	TxCXIY526Ld+PJtUYoTfOWGq+VngfLqGSjsH5qNag9rUDFyxKNWrhJYTJoDSTji6zdUaHIzSFak
	+FgQP0iwBp9YYB3xNerzPRC9EqIPDyYl+pzddAAIpfnIDympek0tkG+lRX/Qabe41VWtXrNBBJY
	2GCGc65K/ywFfs0UddGzO5iRZVreYsfrt1iJ72FI4=
X-Received: by 2002:a17:903:1b6f:b0:2cf:477f:57c5 with SMTP id d9443c01a7336-2d046d5aee6mr19357595ad.1.1785501332502;
        Fri, 31 Jul 2026 05:35:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04b137a44sm937565ad.37.2026.07.31.05.35.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1177712a12.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501330; x=1786106130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHW+hZWYhkatdbcvERYAFF4nyTSnep77JL8vaFLl32I=;
        b=Y3EoZplpGT2KHyuv0Ug9zQmP6uGdSL0mpcpXR2Fnq9M1YBZ+n9L3diFSMdWSpO2S/X
         BQ3YzGiDpAECQAhQrO825njFnnbyJ79y+a4vO2+ZUQZDisqSIYvUlRRM6FpmyFXbh2lu
         nhsQ5x0q8CaPhAdyG8Vi2JyozLcXxstIpzHA4=
X-Forwarded-Encrypted: i=1; AHgh+RqUbviXrR469DUuQMfY7cDAmXzgMO667kUe0Cf2XcskeO80ol0mZS4yiaiwLhFS5OAYz0XiGOHPJNE=@lists.linux.dev
X-Received: by 2002:a05:6a21:3941:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c91b319392mr2001270637.38.1785501330342;
        Fri, 31 Jul 2026 05:35:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:3941:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c91b319392mr2001244637.38.1785501329904;
        Fri, 31 Jul 2026 05:35:29 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:29 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 06/13] wifi: mwifiex: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Fri, 31 Jul 2026 14:35:02 +0200
Message-ID: <20260731123509.1975281-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
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
index 8ec2d22a8c33..102321cf8542 100644
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

