Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C198374E7A
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093973; cv=none; b=ioxDBJ/ga7pNdxj0pymC79d84tlz4qY9tNEBBupjQckqyeEVLCcvzdRrp187KnaqYZPq8l2vwTptAlD5VdD1XUrbrKV/6PeSvY+CcGxX6GYwX+U9u/WcuFzQCqhmBGqIJk6qPhJwBWZqcLx+l/3GWSrt6dAdX0E9w1JUUkKBLbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093973; c=relaxed/simple;
	bh=wIz+3euQACHcMtzoe/1WVQoQpiunxZW+Fc/WKDXM5WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLMNXnn7RnQVaUxgXKJXmM2An3UKxR32pvi538OuBGHAAsHKRmRAoakts4iR49SeTPsvhJeHUrJx6xnS1LNBotz98V71VIqxD1AS7btIHu6OaQGyBp3hqqo2Y6GgUjyb9EpalD03iNjR1xZaKDLLwZ8trtTLebP8XTA8s+sikc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=I/FzGVP+; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="I/FzGVP+"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2caea3f742bso25506475ad.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093971; x=1785698771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=HKEpaPvSZmnl15TjYYswc9RnZ/rKdeBg2/kD5J7AjUxVK19hQkPPARSqAx4Jbk7/S7
         4KbfPBL04luvEP2xKs5ttZXBlnxYw1TPPP+2kQkVegv0eLrVIl6BsZkF9E6orDulCmnQ
         ORnUWC2L9N3IvfPW3oaIS/8se8IOhBxr0JD9OypvJqZWEXdxj24wESDnomqluVGvII82
         Rhg9SNyFwtuePAoInrWuDBD39j8AVmcyhFEIjujTVWP0V8UkqAKmCgXq0msf39SolJA3
         ypq6qJ5gTFSp7MbXesNg1R07VL24B1Keroyhj7ul1fwQzpi+tDfATaTZxtabI8rmAHAR
         2LtA==
X-Forwarded-Encrypted: i=1; AHgh+RqJCE6WOj3NQEMME7HRi8r/btZQwoIvxK/N31R+TAUQAFeidRcOQkR9wPOfXxqrQrz/ItKVgwDbWkw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8xgxmuQ+rp5YiFG8QeY/el9FDrOYdl8vWL3quiS+fQNhDvcA8
	JFZ3/nWlHqcxpOlQTD7V65jNp1icZUotJ5CjK7dF5nm1e7jlnFHn815eEmrsJDY0HGvHgKNz+80
	HIt5S7yIigTKJ1N4aABMW/eh+rtiMorXK885Hq7bxMPIVInBnEADS04TTEGbd1R+EOqO5jRV91P
	OJGmMZz4EofkTYCnhz2VM3a9u9TCM6qRt3uoRpqwf/qRADUhtqiGE8tLKOwX8TJzErxkue7+EAZ
	cocvNqwWUpn33oQ90eInw==
X-Gm-Gg: AR+sD11eURx5HGZFw7QaPI1k9p6TV2SEeihinYAqf5UYRd1Mzwqa8Tgq8wITsfKz2hd
	mbqI650LfVZeCeTUq4FjjvIbfgRt0DzD1vtpMirNdCSRM4GpqBIn1EFcF5gD5NN5sCwBxhxVAPS
	1AnIzQ1sSlaljvh11idrOLhN1tkr5BiXtHO+IRf7rmuaebirfsQG4eZwSzxgghEcVM5GqCiz6QB
	dyNDeBzsPFC2MtjZuaqix/nh85iiZlIIS9qiHNlR7lHWiHNxnZ5rscw3cQUVEYbvvYLpQQH9ahs
	s3MrsRj5bceGZDHBS6UG6ZkbUPq270C2Z376la1pIeDhpoZf5QsVUNWXe3gSZjXx4Vnjh1hY5IN
	TRbA6UdJ7LeR9Ib8lB7vP04NUNLIklQXYODbGnb9IL8/945sgCungvx76PQ+6YXlxlWVeFOHZsz
	ROrbtLGo67eNE8kJQJO8Zw5VG4MWcE1jLHHMEBAqM=
X-Received: by 2002:a17:902:e544:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cfde8253b7mr58911045ad.24.1785093971496;
        Sun, 26 Jul 2026 12:26:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde78fdb5sm5548535ad.34.2026.07.26.12.26.10
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so2604709a12.3
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093968; x=1785698768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=I/FzGVP+DeExq0DboWfWZtkWhZw1AunvMMoKs4LND2ynZFZUBzZIVyPcu4H33c9eVS
         /t2fKgFm5FOz5rvqW8gHg/uCqkcrUeSivlZr/dwCz/s1ulw1OtVG/RQREra/NZnpDnnS
         zMCmz7WRtDKG5P3/uyWMPdHu/ETCsC2ZhHvdE=
X-Forwarded-Encrypted: i=1; AHgh+RqGD7EUg20OUVcS6db8SRVNSG2D/SiHbaQqu6Hs+O0Gua8sue/A76WV4klhZSeAvUHhbKSwfrL3dLE=@lists.linux.dev
X-Received: by 2002:a05:6a20:12d0:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3c67dae9754mr5310985637.3.1785093968570;
        Sun, 26 Jul 2026 12:26:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3c67dae9754mr5310973637.3.1785093968087;
        Sun, 26 Jul 2026 12:26:08 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:26:06 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 08/10] wifi: nxpwifi: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Sun, 26 Jul 2026 21:25:39 +0200
Message-ID: <20260726192541.2816743-9-arend.vanspriel@broadcom.com>
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

Stop calling nxpwifi_roc_cookie() to generate cookies in
nxpwifi_cfg80211_remain_on_channel() and nxpwifi_cfg80211_mgmt_tx().
Use the pre-assigned cookie from cfg80211 instead.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 4f9e20f72811..198174ac754e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -212,7 +212,6 @@ nxpwifi_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	tx_info->pkt_len = pkt_len;
 
 	nxpwifi_form_mgmt_frame(skb, buf, len);
-	*cookie = nxpwifi_roc_cookie(priv->adapter);
 
 	if (ieee80211_is_action(mgmt->frame_control))
 		skb = nxpwifi_clone_skb_for_tx_status(priv,
@@ -277,7 +276,6 @@ nxpwifi_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = nxpwifi_roc_cookie(adapter);
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
2.54.0

