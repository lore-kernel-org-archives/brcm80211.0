Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73A3B3C1B
	for <brcm80211@lists.linux.dev>; Mon, 17 Aug 2026 07:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950095; cv=none; b=GrvqdKarO4PBRF81ngLI4XBFVTLDPBU+acesuvYnOoQszBKVUiVZKIvsvFW4GHEPSHMkYkVgHcNUR4dSyZQmOGsLwQcPl6n+8EHICxEjvql4JoBI4FgQ+ko+V9pMtM+47VjkA7Ylrnsg4Srgk6didEtlYSRwT/7sYrUQZhNDpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950095; c=relaxed/simple;
	bh=6kWVZxkaJrP2alMq9sRei0KuXnZM3rimkkYv/KPNMvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uCzPQoxHFIU9d+SnIzRT48Fts7zpgZGgc/9BS1JShgyxkbJop1HQ1pH2KPmb1S/piGjt1Hh0l3sAcXSHyQ3fcHkU8lwtEd8ogzJlFjFifyvskGpsiD1ywTTr6W0BJxsZNlfucMx3CuAMtmyuU89tZvPCgi4yqu4BkypEkKk2McM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/MVp2bs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/MVp2bs"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so300537e87.0
        for <brcm80211@lists.linux.dev>; Mon, 17 Aug 2026 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786950091; x=1787554891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nFik9rvis0EY9a3fH4rtoEYKyrkMbT6h34IIsACnTo=;
        b=S/MVp2bsY/cnOayD/N1CVT+HPGq6KNywR7RI/d7J3abcs9VBMEA3+qG8B1EynbJ6pZ
         XJF2Bb3lfDmeFVagP03R4lx2rwdXGVgTqfyKYlFnqOr/Ier7DHj6em8n9CqVTHrUdo2D
         OdQFBKx91WKu5vNSW9qO0ZhRMIAno2U7UYe4KhwAh834HIP7FL7WVZ4+9/M6LcAKqRd6
         F8hvvwKtBfeXalPzg0fH1CxQIt/bT9rWcvnkIQ/dbbMyXsVPSR+vk5ioOX4irhC5NhY1
         C/BXs4NhjtKU0PHRgTfD/PCBR9yW2caIuwaOSA3p6sQw/71X9ya/49+TBN1Zfj48Opzd
         8nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950091; x=1787554891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nFik9rvis0EY9a3fH4rtoEYKyrkMbT6h34IIsACnTo=;
        b=o7mY6m4OAO1W1Mrh8/s49tY71uSWYH77jVi1LhYh8c6pkPCq0qaEi9OKAXdV99vVcp
         7laiMatc99S+ybPw9Wc8gCDJtwOT194liBhqBio03gj04dTBY3w5O3F/x6/wvVAtAG30
         RtmuzsbP2Hql/2uuNryon14vL4EM7lTtRzqQiQD17OnZaWNGUI5Peb02Mwd5/WUvVbMY
         sPXIbBknpQy9rqXzVfxnSn2B64JZ1+ybUCTaFFxz6+f5gpcgHviQ04HN+fQKY+fU4fYv
         MB1YaskMiVVOAHngobSpI9skJYxkZOaPq/E8LqF/GLuPG0JIGwI4Kk4C6vLhBzBfivSR
         FumQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5uqZyDs7jnz8IWzTLZP8ihsZ/prD3oTzUeZpN6VwtGvnay1jGQfywgrG5LykzFKp2+VihNSSqmdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNrUHMkHiES+L6FC8RZQKWHdtiVxML3GiEAYZj3QIbh8peYJ2i
	mVldZqDPkNSVdXgRF4vhNHMItKq4JDDAK8LZCzkTDVSRKEvahJEXLJX4
X-Gm-Gg: AR+sD139dW4Q8drgVgmHP/L1ufB9cBEEdT8EfJYfOiC3IvmaCjNg29dXo2CxShWXQdk
	EYVPzp9YtWnDmduDQuR2OdmZDU2dx8N20P3Cs2ERMfKjH5h3jqF7JEaNRGYucNYGEoN/6avtaIQ
	1q4+BXx/BQWmz3yA3VbJzvs+K/TmiF6jIOAn/NUhB6YtnHBI0ELVYX/kDcXABQyPJVF+QXCZQ1w
	H8LKdU7U+zU/4ZSbPaybOiPNoZA7XHtS9Dx6A2RrwZXMm2o9eFFl+wuM6GXMsvExDVURtdB1/vc
	ELBjjg9cA9SAmonfkndAYpTPG0lBdKbhq3APLtCj5UltJaQnZDkiJCHP88d76+IaXv0pry11WZU
	+377Mj06/Rhmi/2UlemPQ2wFYYDPABl1wd6xDm/fFq5gDor6OOt1GUN1y8qufYkpWeVHspOC+K2
	ZGRsspmKfIJwbBFtRT9m8/HBuVNe6zpirjGr8kQs7oEoh5XOrdkhH50Qw8FtmU3TJbV+nZkpj6l
	5A=
X-Received: by 2002:a05:6512:63d2:10b0:5b4:59a3:c67 with SMTP id 2adb3069b0e04-5b459a30ec9mr1732291e87.3.1786950089145;
        Mon, 17 Aug 2026 00:01:29 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa87f8sm141201e87.33.2026.08.17.00.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:01:27 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	lvc-project@linuxtesting.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Kees Cook <kees@kernel.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Daniel Kim <dekim@broadcom.com>,
	Franky Lin <frankyl@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10/5.15/6.1] wifi: brcmfmac: initialize SDIO data work before cleanup
Date: Mon, 17 Aug 2026 10:01:12 +0300
Message-ID: <20260817070112.4828-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Runyu Xiao <runyu.xiao@seu.edu.cn>

commit 2a665946e0407a05a3f81bd56a08553c446498e0 upstream.

brcmf_sdio_probe() stores the newly allocated bus in sdiodev->bus before
allocating the ordered workqueue. If that allocation fails, the function
jumps to fail and calls brcmf_sdio_remove().

brcmf_sdio_remove() unconditionally cancels bus->datawork. Initialize the
work item before the first failure path that can reach brcmf_sdio_remove(),
so the cleanup path always observes a valid work object.

This issue was found by our static analysis tool and then confirmed by
manual review of the probe error path and the remove-time work drain. The
problem pattern is an early setup failure that reaches a cleanup helper
which cancels an embedded work item before its initializer has run.

A QEMU PoC forced alloc_ordered_workqueue() to fail at the same point in
brcmf_sdio_probe(), before INIT_WORK(&bus->datawork) is reached. The
resulting fail path calls brcmf_sdio_remove(), and DEBUG_OBJECTS reports
the invalid work drain with brcmf_sdio_probe() and brcmf_sdio_remove() in
the stack.

Fixes: 9982464379e8 ("brcmfmac: make sdio suspend wait for threads to freeze")
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Link: https://patch.msgid.link/20260619064401.1048976-1-runyu.xiao@seu.edu.cn
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 6ac2132c3064..5338d93e5b22 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4438,6 +4438,7 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
 	bus->sdiodev = sdiodev;
 	sdiodev->bus = bus;
 	skb_queue_head_init(&bus->glom);
+	INIT_WORK(&bus->datawork, brcmf_sdio_dataworker);
 	bus->txbound = BRCMF_TXBOUND;
 	bus->rxbound = BRCMF_RXBOUND;
 	bus->txminmax = BRCMF_TXMINMAX;
@@ -4451,7 +4452,6 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
 		goto fail;
 	}
 	brcmf_sdiod_freezer_count(sdiodev);
-	INIT_WORK(&bus->datawork, brcmf_sdio_dataworker);
 	bus->brcmf_wq = wq;
 
 	/* attempt to attach to the dongle */
-- 
2.53.0

