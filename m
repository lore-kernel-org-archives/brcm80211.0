Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554F5FDA7
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317744; cv=none; b=qWWLN2WriL5PlYnmSgVBb60bJpT83itPZK4vHsKX7SV8Tmsy/+pe/4/7lQ5NkHjtJBC1BZvWJwijMHezmxpYTrOzHa8LdCPUOFcFPDrX2Ww4x4wXU20/UFxBQ6veNPIIPBD3MOo7LSUD59/RBtUvSA/lUmpuHku+uUsxMBQD5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317744; c=relaxed/simple;
	bh=pYBUGJchd1hElAj2UWmVYIZx9SyIAUv5x+nT1cqtkEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DKo7q7jvm/kzuDYlX0GKWWnWnYLHqoqA6Xf+w2lQwIgJw/9uQukWnRSTVPs0XsU1IC+GDRH+uBQlJ5wTw8DR8jqadNnyYX+4abu0yN5Y2GeIJBs5/sd4jHs/NHlKeh2vVReLFRPa6rxsIc2BgH7MCsZC0S/j7ihRWMvh/yzrcxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+JEfmUF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+JEfmUF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso1363866a12.1
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317741; x=1725922541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfk/MB9MXj22xilQhLGF/TlMB4MUR+y/O/4pdlAdOYI=;
        b=O+JEfmUF0d2fo+q/9lcEZV2x0uCrXLOo/lT9IDuY4/e5B0gAAPAy/6Wh6BJ6HJmin4
         lZ5UBQ9z6zQbixJZ8wNCEfqnIzILzE5wytzyMls+9NXQzdcFb0QYQF63Vq0P2AgC1OSw
         GyhmvSGuU45xW8j4xBxIJ4gBCC9jemgCGp38AcYR7xI1zr1kZEDk79BYCR8Hr7xP0PRr
         aTMBIWIf3BDce0r8o33eQarCK1qSHjptJ5TZnbHXebVtIEkT8waUPJh/23kvMlOi1A80
         9wO0jXCjpKHUtDshff4q+HoodCwGocO8LHoPmPXdCpQtdnFWfgcLT2RVtCvxCR/U/7VV
         4XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317741; x=1725922541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfk/MB9MXj22xilQhLGF/TlMB4MUR+y/O/4pdlAdOYI=;
        b=O/b+VGvouDMMXXiT09wxqD3TS6ntgMfzfq7SNRfCNTjF0LJ9WcV18l/4qIUhHzFekR
         gf9GF8d93Zh2jLh1zmTfS83vcLJ3eE7H2bOWQVAdH0Zth19rRHESwfHR5/SD77ZXo3/f
         eCIs+RV6z5a0vmUN1JeDlEh47LnG22NV1+7G/ohdDynU85HKjJdoUlRytljBTPBr6Uh9
         9gSd/SHXqs0YNWYp8JX2Nh8TqaM93865FG4ZVGD0CRGorqbRQn6p5kLuHactRVOG5JAH
         JJswOCvvVYHrK/X67oqNA+kwrYriz5zxPSFaAtWhgugZMggN7fDt3zYPCgheXxvXjrfu
         dWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIonE1ys4vC+JbeVbwWxCNJA7/aV/DdzUej83RP9uOETJhkaFdf3HP654irfa4arZIOUrlqFJuWUs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvqu47ozjcq2ICbH5vt2OP6AI+a05xVbYOdkCXNUQ0WVkIcTCi
	zjQPKrH+9b30Lp7nPVaEiflbc/bqhMqsy5mwG/Uj3PkEfiDNaI3O
X-Google-Smtp-Source: AGHT+IF25SkxSsbO2kbhyGCDxnLoQCX4vYj5bEuTZ8TcvcUvs/vWx/woT8xGJV6bxwP3GllH69+tMw==
X-Received: by 2002:a50:cc4c:0:b0:5c0:c6ab:7c0f with SMTP id 4fb4d7f45d1cf-5c242f21db4mr5673859a12.23.1725317740262;
        Mon, 02 Sep 2024 15:55:40 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:39 -0700 (PDT)
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
Subject: [PATCH v1 1/7] drm/i2c: tda998x: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:28 +0200
Message-Id: <20240902225534.130383-2-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240902225534.130383-1-vassilisamir@gmail.com>
References: <20240902225534.130383-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type(irq).

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16..8dfcebec800e 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1911,8 +1911,7 @@ static int tda998x_create(struct device *dev)
 		/* init read EDID waitqueue and HDP work */
 		init_waitqueue_head(&priv->wq_edid);
 
-		irq_flags =
-			irqd_get_trigger_type(irq_get_irq_data(client->irq));
+		irq_flags = irq_get_trigger_type(client->irq);
 
 		priv->cec_glue.irq_flags = irq_flags;
 

base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
-- 
2.25.1

