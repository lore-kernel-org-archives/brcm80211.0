Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7935FDA7
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317742; cv=none; b=m9E1aaN36psFpJfpdMx7/u+0i7yoFMKkOgWKtilMeqLc1FTMTA941e5BtWKjbVY5WNeTS5HfdIEDeKrkXDOnmgECXxXpafSUuGKCjE7tMDJbgW9cO96M14ZQLrffQrKDDU0AHHk6gaF5J3mstdNXebkf9YjRi8okHZz7cISPbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317742; c=relaxed/simple;
	bh=0yujmkWzIEBEbiPlXXYaWdyeb/4nfYm0KbRCPGu3xoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K+RNKEJNxVE7YLI7VS93VxvuiQ34mMdkfmCLVocUYiHIRWM89D8qjjEk4ypI8SZYyJcTBexzyEweSah3lKXBomhgUlaX/eTnRIN2KRYz0Ad8uxdcXc58Bs5eovdRW1zL4ZLD8Tpq9knw6CXmdgpePnC0jAKp6eseEJg7zzeClVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWb80DfE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWb80DfE"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so296125a12.2
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317739; x=1725922539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xu5CM91Lk2oZ+OxbDGkmejn194UlhGYuczl7M1O5rRM=;
        b=ZWb80DfEeNfrr5yPewYKE8wxcLtz6LxnRN+sjcKVlZsXLzpsFCAEvtW1LZrA6mepge
         /AQIwv1u2KzjQOSjx0dUvgiCZzujrfG0xxpjg+Hxzblb4PYjUgqmjHx1xIONcKmrOUUn
         4vG78YO0+YsHLlpXXJb7wBgFRsH7hEKudNqmUiitlXRvvecbQXM7HOQbzKSRWQfMfSLR
         1a8TXasGNwAme5QjJe6qpANJBiZ5eUpe4jjUX8YVdsRkdHf1KbvAZKHh0cKKJIgQSa+H
         RZMTKg0uvL5K/gSCvllL8jSvGh1P1A/aldra5STekwo9Ka/lfiNTTLQSNfX0aUpytCJC
         PLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317739; x=1725922539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu5CM91Lk2oZ+OxbDGkmejn194UlhGYuczl7M1O5rRM=;
        b=lfvV+saAeQXIfcHgJlnzloonmARRPOUoTh9j4jgPcylTL7LUr1MQs/Jj94DwYSoQ8t
         Sjdmi4JYGrK519tkvewlb64S34+RN2rLgFusOhgiNHeSdHkEbdCx9Ish2m2/NCETp7Lv
         PJTDhAHAODb4lpSMw7zF0yV4ERN+8trr3CdR7jNHDQwA5S2eu0Po5q/qnCRFY84u4sJP
         w4NIkNQvMWxjwvdUbYOk8vMpkkyXOcrAJkdkNQf3+rgghZkepnioI+OC/1beLCa4jkPl
         CzyvWL+3TofyQg8sA/Dt4AF6We5bnHalplHyLJgiOwump6mIcMKPy3c/9UfH9nTaGsv/
         DT8A==
X-Forwarded-Encrypted: i=1; AJvYcCXN94GUWbICLwcTbc6Og+mTrD3+DarwQQvTK1TQgessa1QWy/PN0Z1Z54x+xmJgbQTOksok9mtoLsc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT118Ecsaw7QPTRsRaCFcnT3TuVEy7/9AGDkol8o87hcvzwUdG
	vkJ0ZpoQgC7J24C8BqTKGyOvokIEQ3qLne9akDtnPgyMt+JYttAC
X-Google-Smtp-Source: AGHT+IEfE+c4/8xMLmmWu8kkZwnYE1HcqixXWH91x/35qPsp+687gR0j/immZ9Uoy4QrIFhv0iPBQQ==
X-Received: by 2002:a05:6402:268d:b0:5c2:6a73:d13b with SMTP id 4fb4d7f45d1cf-5c26a73d3c7mr1172896a12.34.1725317738594;
        Mon, 02 Sep 2024 15:55:38 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:38 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org,
	alsi@bang-olufsen.dk,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nico@fluxnic.net,
	arend.vanspriel@broadcom.com,
	kvalo@kernel.org,
	robh@kernel.org,
	saravanak@google.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	devicetree@vger.kernel.org,
	vassilisamir@gmail.com
Subject: [PATCH v1 0/7] Use functionality of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:27 +0200
Message-Id: <20240902225534.130383-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type(irq).

Inspired by: https://lore.kernel.org/linux-iio/20240901135950.797396-1-jic23@kernel.org/

Vasileios Amoiridis (7):
  drm/i2c: tda998x: Make use of irq_get_trigger_type()
  net: dsa: realtek: rtl8365mb: Make use of irq_get_trigger_type()
  net: dsa: realtek: rtl8366rb: Make use of irq_get_trigger_type()
  net: smc91x: Make use of irq_get_trigger_type()
  wifi: brcmfmac: of: Make use of irq_get_trigger_type()
  wifi: wlcore: sdio: Make use of irq_get_trigger_type()
  of/irq: Make use of irq_get_trigger_type()

 drivers/gpu/drm/i2c/tda998x_drv.c                     | 3 +--
 drivers/net/dsa/realtek/rtl8365mb.c                   | 2 +-
 drivers/net/dsa/realtek/rtl8366rb.c                   | 2 +-
 drivers/net/ethernet/smsc/smc91x.c                    | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 2 +-
 drivers/net/wireless/ti/wlcore/sdio.c                 | 5 ++---
 drivers/of/irq.c                                      | 2 +-
 7 files changed, 8 insertions(+), 10 deletions(-)


base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
-- 
2.25.1

