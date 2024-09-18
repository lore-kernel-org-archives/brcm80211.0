Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287E1CA6AB
	for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726686689; cv=none; b=YBZITd3ZUAyS+XwIRH1pogmiRnWAVMKs+uoViMXnRbGpRK0KgQUNBgQKzWMab4a7O3JhEHmOrlpqv7xBW4NY4SvZOWv/Reb5V/oAq/0zRxZP7Er+kJDFkhzLPQw0jqyJJE0fAexUghA58YSssAMlSFZcAEW9KFJnoKBZ6pz4EtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726686689; c=relaxed/simple;
	bh=z1ApUq7/iTxtQ0TDsv1mvl27Cnhr5TF0C9tFP1g9YQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jzwosafoCZlOMjuDnNPvyX8U7LOq4m2zCy/H+UuG3FUfrwuH+K3o8ujwasqlDZxCaE92kXXQ0V5UG3HIrJdDub4MpBhC2K00Mr9LRkAei83MKPWaICKVkbkGQJvlvYRnK+tVXRUFFWWAHxwF8pSa7C1Tuyf2Y1LQL0C9jPOTBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UWyrHPq5; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UWyrHPq5"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5dfad5a9c21so74513eaf.0
        for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726686687; x=1727291487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED/M16yR+lXr7ViSvhCHwCaDzEEhUxZQFCnfrZ9b5KA=;
        b=UWyrHPq5HUV0LGQpp/7S/8LPBBqKmqlJUifkhtnFsOZbK+3xse5f5xjKSfvyQnR5Be
         Xc7DK9jTSgKoOSn0PCFgX3kpa2L26iMMFcOmGSORKfGCV+c2t9r92owczxrZFE6t2Mhr
         Ia/2OzEcArB8/QJiRr/rh+SL3Mg+ePM7/Pgq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726686687; x=1727291487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED/M16yR+lXr7ViSvhCHwCaDzEEhUxZQFCnfrZ9b5KA=;
        b=LaoE8/kmFyFP1ozeWWc/aHW+CTqPMPC+DkNuTZ9IJPx6iuETPl3gXzdkUiDveiu8XY
         Ihr8Iizb0bZGG3EgABL9x6odl80TNLQcCdqFXq5LBtbVvlItbhvuX+MGV8TIdA7BRxbE
         vkmlyJ5Sxfet78QRbMwWJXzIBMEEsid0q7OX4dZl86lGZLblEmS2pR1Q6LHdEjHhiUmH
         rS5P3RlC80XBgG65G3f3zWcjD/gN497Vu+z0u2WBskOb6stor9KcNKF0kjxkV2zwxbqw
         dIYBRosCQ5JP/mEr7dcIocJQV2ucWTl9BJ4DBdkU/GyV9yIos4fJA0NPOZNaTh+/GIN3
         ovcw==
X-Forwarded-Encrypted: i=1; AJvYcCUFuUQHbs0SNE9FZChFo/LUt0bfXvYnG/7P8Q9EPGcyJQxixSpfrxDvaWO9k0mL9OohUmvn+kZcfZE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1B1xiiIIcIvODUQtyDBZwtX6tIWnHntvgEDQpCROclY38CAC6
	KbcSp4DknxYf1xBc8yyO2BEivqHVjI2nHwIDxMh/rI/cb+O0y8rBnkQySx5IPw==
X-Google-Smtp-Source: AGHT+IE+wHgej1KbyWURYuoSm5uZ/KlC4kPtU3qVpyDsLJPw+v74tF00XWAGI+ZJ751C5UBt6AqVDw==
X-Received: by 2002:a05:6359:4ca8:b0:1b8:21d6:6034 with SMTP id e5c5f4694b2df-1bb14e0a0c4mr1215771955d.8.1726686686901;
        Wed, 18 Sep 2024 12:11:26 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08dae51sm2275885a.122.2024.09.18.12.11.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2024 12:11:25 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT v2 2/3] wifi: brcmfmac: make per-vendor event map const
Date: Wed, 18 Sep 2024 21:11:08 +0200
Message-Id: <20240918191109.41960-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20240918191109.41960-1-arend.vanspriel@broadcom.com>
References: <20240918191109.41960-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event map is not intended to change so make it const.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index 9ca1b2aadcb5..b8c773db8158 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
@@ -337,7 +337,7 @@ struct brcmf_fweh_info {
 	struct list_head event_q;
 	uint event_mask_len;
 	u8 *event_mask;
-	struct brcmf_fweh_event_map *event_map;
+	const struct brcmf_fweh_event_map *event_map;
 	uint num_event_codes;
 	brcmf_fweh_handler_t evt_handler[] __counted_by(num_event_codes);
 };
-- 
2.32.0

