Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489554;
	b=ybDB5OhkJOrF/BvbMwYbCW/Nxm0vY7fyjJd9MCOMf3XFdyYJckdBtzowLK1nNnP1uYau
	 wELS/LMz1ZR9GPyR7ZejtE2Bt930L/WNL+lQT9AcGc5imwMb7owGbEpSIhJ/rMQqmzmER
	 +FLoR9ZwLBP/S3OdLjbQuK5ggCHA207Hqzy/CjNWOch0jWM6P8xwnLRiTK5yQIKSExOUZ
	 43AUm/9Dib48YgzYUs505U2FyFjpGjRYru+X9Kqz/EyhU2Ek9xUz1va/0lLySHs8ntZYF
	 NzKYveGpaodUlnmd3t3EGRgm8WEKcWfI88IrYcQNpaq5yJj4QcmRHm41O6VUt2NoJ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
	b=hDPEdy9OQhuAqho7Crq3bwVxqF/WKKMfYS7l3Z8R7n9tNLTDsY+IhtmzxXkDSw2FolNw
	 3/SgWiFKjgxYXdiKJOPjaCMvpxQIDjLXqJu6fBd8tYSDmPISXVy/A6s2pRjRWU30pkMNl
	 hDbSY31fBbsVithB7RXCsuWUrfFWLp8iBvZl5GspTXmqADAS+8WbwAiq7V8oyMKkq/+aC
	 YRS4M+mC8aGJ+V56aJbkfNIPhpGe7rcsYVqjPPBtZQgYPnrpSTQZttm3GP51+0VIfwdKG
	 Piv4hKgcnKutUPuR151BT4EVIqwvkCleuxL066zr2YAdpfRV06s8aHLFKaaR7BnQrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HguDbWEy;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71978606A31C
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71978606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HguDbWEy
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4c9abc1824so600894966b.1
        for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489553; x=1795094353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=HguDbWEy47TqKOw2jDZeOtrYY9hq1u4jXl2QHOA4+2vd3YTMfxns/KikA6VLz0f0Lv
         RNO54VlKT1apFnaM9T6fcFXsd0U/hzsZPlcGB/tv5uDWGvBivFr9JIlVueOBfyOSaY+t
         F1+wgjxM0T0pItxVl7CJqRRWga6rUBBHMXhFuPHQECeuqLi7n0x8HQ5n/asqkHlmRlq8
         gogxwK991hzHiB2NfzQLFuqb7v2IVsWsCtjiH8nmfWJPJK+O27BJ/IoMd6ohWQ3izwR5
         nNz1koCZOyc/9N/eIJ3qorR05N+/krmVTUFLKYgcum/hm4Sm+lIDovIpk9oGBkHUtzdZ
         Mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489553; x=1795094353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=iD7NrzV5q10HvE1ryavr4V31PwfiqQzT0KGay9hMY2RgbMBvSy9k4P0bIsZ2yFF7Ch
         N2iWCansuaIGJ+AWLUWacdMCtmElERCfKcp4x18ZAPyhcPMf2mYLTCzrzhUPYBY3u2ye
         Ujba22iFWe+Q04sC/WsKpj0ozwImyWpBJMr3PqdAhDIOJ8APW/IwI0IPUFmh75kMiebF
         jpP/SIUTElcwAlzn60MQhNLjtUnF4ztvzjNEVdnz5wuNo9474HKcB46SYfSMeoTrESJM
         ot5JBr0M13PKAR24DdHqc0AsysjbEqmX/AfG+sx9krhW6blkz5CSa6WLTlUzqYtwNDYd
         yqCQ==
X-Forwarded-Encrypted: i=1; AL+hErFOPYAI/ztm+q/tEVA99MsL9pJr0vKFqekZ7XKhGJn9QdRRJLfF6WwhOTrhembSP89m7+atW79fJSA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+N1zM+2ra085LfVwVDX68uyyJk8/QRduARksB2Rbx4FMTgyo2F
	DtGlnTTVV339laTNXLnFiVh9D9UIf1+UsU2j8EPUoO5hyxJRiFRbdKTS
X-Gm-Gg: AYBFou1BmzGyCmIRZMUplTmcG7tDBhMwHvweqXShxA9nwyjX4/Y10BgcM+6UrSyqMRU
	WPiEwHdg99BRNhWY33oEulQOxZ27ewrWTAxOthssFVSX/4+xQV5CMKLwQH/Ahd5zL/QfXoKb+Gv
	kQrWSDadqHWgkdiwE4nRKewh40Xm/ngrce4YRuz5TFDoVwpMVDO/C6X7NBEOMdmY9oywTlac9x7
	DD2iyJZKEeWEGxFuJ4V42XMbVUMzPs55e1yDko/C5GOhdrtIvuR3nRnGxR2yrLPK6/p4UUtOHLP
	y7DWq8uTH7z8VT0SALlH0ozobW73BVOKy0y3hPGS0TooDdVrc6mOlw09hlTRe4c39SZ3h5Zl43f
	NjdIZb9d04sTW2QGD0w5jLwLi0LHcQNyCQvUCHu72Pz6opX28SxrDboflTU9OEq9iv+7E/QfWdY
	2noz1nZv9aAGjX8gdgtWeN4JFvutPjUMwgzf09iCvGdUL77bW4AfyB3obl3TE/m4Hu8Zfyb8jNC
	GpPc9v7qOOlGFVTq8eRQe9OdCY3Ud7kIOF0VHtMaaAphmrg6HPMsDybZzFYsQSjZs0O/cnWA2yn
	dxjVacWnKIYsN2vwmC8AqCeY5tKqIit7zaD2Zn9yjzyE+fpatUjgILg=
X-Received: by 2002:a17:907:9811:b0:c46:8b51:c17c with SMTP id a640c23a62f3a-c5066a83305mr467351966b.17.1794489552581;
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6dc3sm350140366b.6.2026.11.12.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 14:18:59 +0100
Message-ID: <20261112131859.339060-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195559.160650-1-kudzo51@gmail.com>
References: <20261111195559.160650-1-kudzo51@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

I have now run it on a BCM43684 (firmware 17.10.188.75) as an access
point, with the logic of your 4/4 and this patch ported to my tree (its
tx status path is the BCA one, with the flowid and generation kept per
pktid), plus counters for the test. The AP sent a client a 150 Mbit/s
UDP stream while the client was deauthenticated 60 times.

In 62 flowring deletes, 2130 frames were out when the delete request was
sent. The tx status of every one of them came before the delete
response, none came after it, and outstanding_tx never went below zero.
Here too the host saw every status before the delete response, as in
your BCM4377 trace, and the generation check did not trigger.

To see the case itself, I then held back the tx status of a flowring
being deleted for 3 s in the driver, so the host handled the delete
response first and the new flowring of the reconnected client got the
same flowid. With the generation check, all 531 such statuses came for
a reused flowid and left its counter alone: at each of the 15 deletes it
matched the frames still out. With the generation check turned off, the
counter of the new flowring was wrong at 14 of 15 deletes, by 787 frames
in total, and went below zero.

One wording fix in the patch: "This happens whatever order the firmware
sends the two messages in" is too strong, it should say "This can
happen". Without holding a status back I have not seen it.

Kordian
