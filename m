Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910328B51E
	for <brcm80211@lists.linux.dev>; Thu,  2 Oct 2025 23:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759447224; cv=none; b=Sbbl6+CoFujM0eKPr3J2QlL62kPykfRs8VvATjOkV9+YUORXpIsoeJEgFcVCt+jTLptiz0J9BGoKe6PAPi+7x+4bI+36G61i0yEoz9O1dPdXjCM8SesuA5YYIFjEtfK2UIoE6sthErMUx5xtrq33FTNGYHosdiyaC+zoBHXr8m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759447224; c=relaxed/simple;
	bh=oauH4H5fAhE9YQilFd4Uh+kG+na5T1OTLmpjiT3+6CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMd63n8ecpj7tKrGAgBqlsC1Z0ZYv7blw0t7X0UuDbRx4zoz228gS+8fk9XCPMMVi/gVi7nCXp1uXXfbwkBcimfjh7kwaWeK9i6N/U8et/vUAMXZJNIWeQcB3e+s2bP4/xUl2RRrhcJO8GGx3MnnVMC+WSDhV8oF9SucbfqOQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai; spf=pass smtp.mailfrom=govivid.ai; dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b=ENRxv0yl; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=govivid.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b="ENRxv0yl"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-636d5cefab2so2318029d50.2
        for <brcm80211@lists.linux.dev>; Thu, 02 Oct 2025 16:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=govivid-ai.20230601.gappssmtp.com; s=20230601; t=1759447221; x=1760052021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vEeRe4D2iYgy2mgRonuW34c4fqpWoMFMo0z9bQP5aY=;
        b=ENRxv0ylyeHmluBE4xyp0tqTX1rRj8oZ/mwgilmdySYen8Gj8Y1EwEFi6qCNMGQd3N
         qo0CF4It0+nbuZKVVMalItxSlt83bf498DnJ1PIJGb4S9WZDEdDDnp6TFsjPRUHsi0sn
         5Ek1O+J/QM5cKYVot+GSkFo1cjzgwcRsikuemReDl+rihCbMTc087NH8MU54DMNbjQLy
         nJuNEUYn7i5u9+kq0aFCPRhnxGIHzy8reztRYJw8REks7rC3Idzt+P0eNEwm3iTIb9Se
         kjto+/f46q1eT5I1SWgIQIx+/9YTxX/xaA8s+1YPdUAeoJNUXyjjs77vWmCd3eSdvQqQ
         ODhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759447221; x=1760052021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vEeRe4D2iYgy2mgRonuW34c4fqpWoMFMo0z9bQP5aY=;
        b=eZtB9Luce1//XiRcSaM/aZ4OAQgqAXlls164ZdCzHv+akYP0VlXXTGtQyOnA9vnTkP
         W6Ewc5ayFzKRdto7Pawvy9aUHawRRY1zgDw5Qoec2Xe/GVWy3xFkL0xINgj2PAYezbkK
         ocwHlUWJNEricn1C/m9s9XzKD3PrgfVbveUOfPBDoe5Z2BXD8lRXu+RkKw4VikfA5bmp
         6ChV4dGd9FBvAxXr515Ipwxpw4gQBSDbDS5SrduY+56QTicHWL5GjgiTzJBOROeM9qnW
         dVLPegM40eGEIUqPCV4xwsqlaLULT6NbMv0X/aol1K2wAE6YHKGzo/+LB9XFDsd+f0/p
         aeog==
X-Forwarded-Encrypted: i=1; AJvYcCVuuo4pEM88fAZpRljGUvlZaqbQjSe5YAcW7Tq3B8g/1pVgCitGlL7gn4+TPlpKOXQnFCcMGwbOEOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLR4AQiV//G73FlOPLwl8GHir6Ofc8ku9VxWQ/60QXvqVdhrcu
	9hTQgxr2uEf6QFg+ADdlQskkXnbjmtUyLuWob2QP1Ua/+QjOCYS5p4HhwY+FzpcpFI4=
X-Gm-Gg: ASbGncvXjpuCjyXKJxXK1kBv8qolvGdLQ8ICObdjB9/+v9ndodcwURKcuVE6y0EfPey
	Aimsm5XwwqFPf0Xbou+K+y4os0/ufydPeS66d9IEYDP+sRzyvxVBmOGG+u2n5CxhjjJKdNJGzCH
	7IiY0aollW3ZYvA7zvh2+eav0rkLAmY+5ZdGqeYuGwZMBh/JOBNj0gbofOH5Lzfoj3b6JnC74WH
	WnMHfUTJNtHowlWR+FHKIEhew7ALiUSwfVBYBy17MJ1MbZwW5M8zdxOOW45Uxc76iqZxi6iXyUS
	lzewiOEmLAIslr7W1SzT4sijIX4htMkPiq1t+8iyTLnsp6iSXDW4nPU5NieOcKjHsKN5ESGYwNQ
	mTBKb8CjWHq/vNEdeu59Nw5PHF2eCQMBLq1DL8w==
X-Google-Smtp-Source: AGHT+IHUT9ip7xSAFrwOkDS8HcSQ3yhtpEFu+6Rm5cFScpIZ6IFLNK6QOyaEwbV4IGE++pXYiQOi9g==
X-Received: by 2002:a05:690e:23c3:b0:635:4ed0:5730 with SMTP id 956f58d0204a3-63b9a11d957mr721196d50.52.1759447220908;
        Thu, 02 Oct 2025 16:20:20 -0700 (PDT)
Received: from pop-os.. ([12.41.86.113])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b845a71a6sm1156736d50.11.2025.10.02.16.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 16:20:20 -0700 (PDT)
From: Richard Reigh <richard@govivid.ai>
To: arend.vanspriel@broadcom.com
Cc: brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	chris@streetlogic.pro,
	linux-wireless@vger.kernel.org,
	s311332@gmail.com,
	wahrenst@gmx.net,
	Richard Reigh <richard@govivid.ai>
Subject: [PATCH] brcmfmac: Fix NULL pointer dereference in P2P action frame handling
Date: Thu,  2 Oct 2025 18:20:02 -0500
Message-Id: <20251002232002.124609-1-richard@govivid.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b2e0bf04-f149-4a23-aba5-cad55a8923c1@broadcom.com>
References: <b2e0bf04-f149-4a23-aba5-cad55a8923c1@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When iPhones query network information via the WiFi settings "i" button,
the brcmfmac driver crashes with a NULL pointer dereference. This occurs
because the P2P device vif is not initialized when handling certain action
frames.

Add NULL check for vif before dereferencing in brcmf_p2p_tx_action_frame()
and return -ENODEV when vif is NULL. Also modify the retry loop in
brcmf_p2p_send_action_frame() to stop immediately on permanent failures
rather than retrying.

Tested on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+

Signed-off-by: Richard Reigh <richard@govivid.ai>
---
 .../wireless/broadcom/brcm80211/brcmfmac/p2p.c   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 10d9d9c63..2c73156fa 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1559,6 +1559,12 @@ static s32 brcmf_p2p_tx_action_frame(struct brcmf_p2p_info *p2p,
 	else
 		vif = p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
 
+	/* add NULL check */
+	if (!vif) {
+		brcmf_err("vif is NULL, cannot send action frame\n");
+		return -ENODEV;
+	}
+
 	err = brcmf_fil_bsscfg_data_set(vif->ifp, "actframe", af_params,
 					sizeof(*af_params));
 	if (err) {
@@ -1857,7 +1863,15 @@ bool brcmf_p2p_send_action_frame(struct brcmf_cfg80211_info *cfg,
 		if (af_params->channel)
 			msleep(P2P_AF_RETRY_DELAY_TIME);
 
-		ack = !brcmf_p2p_tx_action_frame(p2p, af_params);
+		int result = brcmf_p2p_tx_action_frame(p2p, af_params);
+
+		/* if it's a permanent failure (like NULL vif), stop retrying */
+		if (result == -ENODEV) {
+			brcmf_err("Permanent failure, stop retries\n");
+			break;
+		}
+
+		ack = !result;
 		tx_retry++;
 		dwell_overflow = brcmf_p2p_check_dwell_overflow(requested_dwell,
 								dwell_jiffies);
-- 
2.34.1

