Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD6544BC94
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428526; cv=none; b=HMLXyfOBIGGYNktO4DAwKIBRF+MUnGZvBDMKjVeiU7d/Zj6N5PB5lrhBdsyEjOk4J5d2wXPIybGyPdKQHmH85qvrCcZdb2D1ga07onT0fP31fb8eNve+uZZDgD4PAcAHXjr4nrjFrCrP/ZfKNLnPZ0GkTypbZEErxT6PEAwsT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428526; c=relaxed/simple;
	bh=/RZ3/Y/ZlOJg5G1yVeQGiGHh8zDUuB5gPSaN4Pn9iwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxytgeA/7Pqn+H29e/bPso1LGp8waxrcszt7A+9W/hghcvERjjW/jfpigv/htxGZ6vXLToBYi3GroYIFjwrd1s19JsWXHumxajmnVBUj3JLwZVgAR4kB7xHAwhuSV14gFqRBYxcQCwZak3yYqWEt7wmSZVlDgTXr4SAFsIfCGkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTr1Y9ZT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTr1Y9ZT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-849f2f32facso7986b3a.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428524; x=1786033324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtE+fcyTa/nEHTvbkkFzvfqX94g1NeErZWdBjlXHpz8=;
        b=TTr1Y9ZT87WtmRM6J9K/eTW2FNNBJ6h0DXBOGNiP+SP6ghxvIZn5sS5OMfISEcWRrt
         iRpR+ODdCbzBgtya99EFrA36OuBtJMHevr4vH4m4Yao7OBGgJEzXRX4vnUVkWCjncvwQ
         h6w0CwrqZL4Nt8EAVoe0dPEpXvNTXhSFSMfSeTpZIBrsVkQ4rMzr0LFYY90ZqZeI37VU
         Irjfge04ZsGkwm8cwIaZQGg1bbekJm6npLWuxv9GaTHoO9/axvS/rmMedenjqKA5NBOl
         lvIdBP9DrQgEQtoaqz9oPZF5W+NGWfi5jM6tgYNixMrxT3suDFRWgMk9INnp1Zhv6gBT
         YCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428524; x=1786033324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtE+fcyTa/nEHTvbkkFzvfqX94g1NeErZWdBjlXHpz8=;
        b=Z+cDyYyO0+tSUnBYIf39TnJ7doVEasrxbj+sqSpqIwrx51WsYDOupR2WLTQL0NOWU9
         xrdlmD8pdyibsOOisMMY+fOR3tuunL6Jl1ScTg9WSQi/OP0CdGAZUOfI9MMsQpzfs8uD
         zzvw/iABnTdtUpz5C5nO6F1JZ3s+cEK+vpKSP8M09xVpsmrDmdCnwKHJM1cKeKc8kwI+
         tsDVEvL3Q8ZiIZNoG6nh7vv0I54BEwWhquOBeZLIOVtr/SlbwM9jzGxhS9vQHhzhCzrI
         2lls9G0E91hQRzJlsQgu2WlIpaAtxbWL+hDzc8uVj2J2HcTgvhb63LumzGQYbTanaso0
         l3pg==
X-Forwarded-Encrypted: i=1; AHgh+Rrxu32WL3RWNr32qwya9SGRWWHLDfgNnX2Bs7aLrYzMrx8Q6HXzPH5S5RFohbX/zL6xK9CQSGGI3TA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgptr90LO9riZiTdySyFaGZOZSWpRN4WSMeuiRFaoCYLv6p2Kk
	XVohYoCqtW3CmDKGSj5AWw5ii7mwzC62Cc6Xhp5jXEAe/EdPdlr3sOvw
X-Gm-Gg: AR+sD12iyWbpgRRvVHvZ8Uk4f6DzenivmMCtqWj7nZtKpPjLvqCq5HaMRfbk+oR+xZU
	GCcEqjCxUwpeazDkLH0qksUKDi3oVKZwLEarP5mmV/EN7m72do+zRQjuKI3qfbA3I/PYK2FgmkN
	BpNhok61tXYZgB9uQVu0EaQfd0EWHaNFt8v4yL+k7+6tY0ejqZ1wnz4sX9xbThCbrj45dzS6UlV
	k7O3CG0x3XltZXAwdZIljJLh7pn21kU0ByYDher+qSeiSd+P1oUhzolmCo0weZhUGPpc9dqc9Ne
	2iUdiM7efW4Lijf2/8/hFoZyHK+VfLGIeC019YpcUHOGiKZNxwz9FOdYUfTtxM5Ilp97bmra+2C
	EQ+pX1BOVaNsQORdqEGiMfHLnMo1SuHu+KyNSchqSEXR+qw0h3zdAZ+mTYY9PkuDknIkZWVjgZX
	Kp+y2yg/YrbFElAihL9Xpx8Ao1cCIYwDoSqIm9HNWgPBCyD/nvheAXv6+kIkcpTxWzX2R8+jxPa
	ys=
X-Received: by 2002:a17:90b:3c50:b0:38e:549:9e04 with SMTP id 98e67ed59e1d1-38fa7f28d64mr893861a91.1.1785428524560;
        Thu, 30 Jul 2026 09:22:04 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:22:04 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 8/8] wifi: brcmsmac: ampdu: clarify standard compliance on QoS change
Date: Thu, 30 Jul 2026 16:21:11 +0000
Message-ID: <20260730162135.12278-8-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730162135.12278-1-shivesh@example.com>
References: <20260730162135.12278-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Updates XXX comment to properly reference IEEE 802.11n requirements
that all MPDUs in an A-MPDU must share the same TID.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c  | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..3fd8bdbd35e5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -516,12 +516,11 @@ int brcms_c_ampdu_add_frame(struct brcms_ampdu_session *session,
 			return -ENOSPC;
 
 		/*
-		 * We aren't really out of space if the new frame is of
-		 * a different priority, but we want the same behaviour
-		 * so return -ENOSPC anyway.
-		 *
-		 * XXX: The old AMPDU code did this, but is it really
-		 * necessary?
+		 * IEEE 802.11n standard requires that all MPDUs within an
+		 * A-MPDU belong to the same TID (Traffic Identifier).
+		 * Since priority maps to TID, a different priority means
+		 * we must close the current aggregate and start a new one,
+		 * so we return -ENOSPC here.
 		 */
 		first = skb_peek(&session->skb_list);
 		if (p->priority != first->priority)
-- 
2.53.0

