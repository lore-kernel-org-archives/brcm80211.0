Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231083CB2E9
	for <brcm80211@lists.linux.dev>; Mon, 22 Jun 2026 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782144183; cv=none; b=BTf33r+rqjeyi1o6yeI4vekZb5+uC8sCeQHLKZUvN17qIYzhMlcaP1hqLsF/G7soJp29m68TLLS9QmmnoKISup6KRLsaAfX9Ukw2iDDsHcVLhucJBAlfU/eIhYWhmBSIa3T4WP5XA/mcSRF4gQFoAI32wh0TsEFUxWw4igfaqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782144183; c=relaxed/simple;
	bh=+5VtcywrfYSETUagn4J9ivVLSqQ5OKfTp7Oz4HoZsG8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k7jz37Kj94Qa7Narv633nR5zuBnhj1L6Chw/DxKmS+a7o0SdTrrSEg1CtqAsoEHksDU0EtU2fjjFVHlTrsgqUZ3qHRoitnInlutqROlSrLFrkTRiCDMgBFJsc0FYQCZLurf48iwj0L9Z8RxsI+3iRTNiHt3LQlspn9TQS1zx9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBQWrCOH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBQWrCOH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c77d52bec4so136085ad.1
        for <brcm80211@lists.linux.dev>; Mon, 22 Jun 2026 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782144181; x=1782748981; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLQ9EFjJ0O0sXXVX/p0kgIxm/pfqnXagQ5iqRb72qZY=;
        b=hBQWrCOHKQIyu7GcrdfUHKYIHdMlpuaHX59lP4Nh3P+b81iYuPIllEJXlBBdwetZlN
         rDpw0VEf6P9BnD1k8Gw8vTxwZmgZwyavK6sHD4QwrpWykWZa6T1LQOPutHPvn1Wl02yi
         2hUphc+LDIJy7Yaac2WEUNr/M7qPYvfQTYZUVSeN3c1VJ79fvNWETnwmJNIaKO1Yt4CU
         sROIUAbggFxLX5h38sLr8b3h/Au0qrbfHgd7MDCPgfywHd78Q1BgQ7prKsrDsikM3dzp
         K/4ZCzvJESyUkcDUQI09D4h+WnKproeJ7i+T4yg3UZQHrz8vJBrZXkmOAmRqPwKYjDq7
         g/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782144181; x=1782748981;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLQ9EFjJ0O0sXXVX/p0kgIxm/pfqnXagQ5iqRb72qZY=;
        b=D0j60VWM1jtBRfI7CXmvsSAg1aWK0FXGWCWvR1uyZMyTN7EV3WBJLAN7QKG4JHHmJS
         KdkqKrHT0o0rT2pkq5Q+7OfDwfcN7hlr+exvQB6sj/XCjcYWnJoHSKio9kk830LCj4Db
         ERe9sDNAjh9Tt/0hcZw1DOk//4bjjp9BgcN7b8YANzixwGYakA4RxvS+OX8CHmZ27AxP
         lrQXVlspZX2SxKl6tvu/Qa3mxwKy6vi3XC4tNgF6E1iU/3CzU2O/kc2xctoh2wSQ7HNT
         J3GBpy6szE7Ois0ljHaIo22WTp4C+5qoJJWJHfvq58uU4gOOZl4WB5qp6PFRYJvdl0hw
         nKTg==
X-Forwarded-Encrypted: i=1; AHgh+RpdZCcxJx9VkL6eCV1GqT3ngAtkLfPexr+SkCsbAVzsJp6e5834d2BnFqpGqtWXJtSpO5K4LSa6Ks4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm+PLFXPhfUkdIgUsNizgzLeb5zrYVYZxs/ESn6O6mBdHY3X3V
	GNS/7iNY8wW00+XbehjfoBCWeJVYMvqDtvgHwZAbkhtwiTabsoi9W8nu
X-Gm-Gg: AfdE7cnHxLBLe+VC/2bQnMTC9V4cEmINQnVGhlK8K783OOG9SfTxmHiw9q8a6js9D1f
	rhtVxJMhEKsx9oru1MhCVpLZyEjYsfUl3XxTcUZ0JTY7uD0atF7WO3zIEvwnXAm8Q/6l+5PvYQj
	0EPnjVUVPdXfaA6oBSFrqocnO/umQHB3f0xFRdIgloAzajbhfDP2nAHeek5ooxcrzGVAVlD526l
	NjWdRUJOiBR/5F9jK10xekjla2qnjkT7WJqIpdChudykctQoI3WzIphFBmU+tpqaC7vjKhl1fTT
	R3FyfIiOL2z8IKaY7iQr8YKlqh2kcuIvGdMqLm5MtXsyVROlTYFu+LeNTgpXdhZ3fF9FLwgdtgO
	u/bgmt1ie14N9JNqyQfDkMHkTtO9IpCHjQqq3foKkB71ghTKAGryNl5w6uEt0rU2ByyYL4KWsx1
	MLRm/SX3N826RE3JmUM+tmki/zTQW2L9M8xH9r0A==
X-Received: by 2002:a17:903:19e3:b0:2c6:b429:f100 with SMTP id d9443c01a7336-2c7c3ece247mr489955ad.15.1782144181230;
        Mon, 22 Jun 2026 09:03:01 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8d11sm87049995ad.43.2026.06.22.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:03:00 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 brcmfmac: heap overflow in brcmf_notify_auth_frame_rx() on a short auth frame
Date: Tue, 23 Jun 2026 00:02:57 +0800
Message-ID: <178214417708.2368577.16740907093694208834@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I think brcmf_notify_auth_frame_rx() in
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c can overflow the
heap when the firmware reports a short external auth frame. I would
appreciate it if you could take a look.

The handler takes the frame length from the event, then allocates a buffer
for it.

	u32 mgmt_frame_len = e->datalen - sizeof(struct brcmf_rx_mgmt_data);
	...
	if (e->datalen < sizeof(*rxframe)) {
		...
		return -EINVAL;
	}
	...
	mgmt_frame = kzalloc(mgmt_frame_len, GFP_KERNEL);

The only length check is e->datalen >= sizeof(*rxframe). So mgmt_frame_len
can be anything from 0 up. The frame body is then copied with a length that
subtracts the management header offset.

	memcpy(&mgmt_frame->u, frame,
	       mgmt_frame_len - offsetof(struct ieee80211_mgmt, u));

offsetof(struct ieee80211_mgmt, u) is 24. If mgmt_frame_len is less than 24,
the subtraction wraps around as an unsigned value to a huge number. The
memcpy then runs far past the small kzalloc buffer. That is a heap overflow
driven by the frame the firmware passes up. A malicious or malfunctioning AP
can make the frame short during the external SAE auth exchange.

The p2p path in the same driver allocates with the header offset included,
so it does not have this shape.

I reproduced the overflow on 7.1-rc7. With mgmt_frame_len set below the 24
byte header offset, the subtracted length wraps to a huge value and the copy
faults.

  BUG: unable to handle page fault ... in memcpy_orig

A check that mgmt_frame_len is at least offsetof(struct ieee80211_mgmt, u)
before the copy would close it.

Does this look like a real bug to you, and is that the right place to bound
it? If so I am happy to send a proper patch with a Fixes tag and Cc stable.

Kaixuan Li and I found this together.

Thanks,
Maoyi
https://maoyixie.com/
