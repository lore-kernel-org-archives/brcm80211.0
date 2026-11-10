Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352379;
	b=2ZhVeajAfjSoLgGQiWKZzy5+0cVtIE3+A+XIgPLk6ccKW84VR4/DxkxmoVlHCAoeKglU
	 a5WoYfqZTRmGTBDdGOqeIbKCELdocJyPzKQVELKudaxKqz50GSTgPI7tqQBAlQdqxC9nn
	 CX8q+aEW55Gsqa2yV0MEfFZQ91qO/ceGv4htd0YKsQZ6pSEwn3AIEWKkDPS8lTXbOcMoF
	 z7h3XF4jgrlbJ1AMBE+yKqoe5nOGw8WhY63hfUBs2igrOWDfuiTnoJC1HZJ+iv2xGSp/r
	 LzxFVT1kqg282kUBkyQb6z7lUKpUUsp73m1Hj1zkKHgOOuEImfvIX39L16aRDEGxdFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
	b=JVWj/WftcEi1HzhDic92+170Mp6XVc6fx5htFFnJZVXLyd2frkG4cwKjT9NZ93NuA/bn
	 EdY47XWw1fr+3HqTl4n7OoZ0XyD52BsUX/2QWa5R/C1O/Ou5fpHcE+FSjqJIt2qxeedCx
	 UJzhdoKuUw49pSEUlmPBlQK6eyBjGEUAGBSlsg2nneF/T//zHL5gQIDQEc+owoSZMLEeG
	 jL6OmpBM4HaUUr8kOHTaYYeqOV1wySoJ6nwFrGeQpEBM6q8mX4OFhe7GmGqXLDA9aW6mf
	 pvTsIDpHYvA0UU8xTxgJYmUuizp3Bv47SP5eKEQrfQn02EtdUZyD8mVl+74adRJiVjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqDRS10z;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9009606A321
	for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 23:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9009606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqDRS10z
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4011508a12.1
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352377; x=1794957177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=iqDRS10z6xZEvN64EkFDLw3fWbHaNF+HrB46rz5T33gWpJlMBTnZEoR3AWzhGM2xt6
         OBK0Ls1dBzYJHAye/kYvPR8YNaJ3G84QUhJvaPwZGdw1OzZWqXWNwtxPS6Q9zycvDD1r
         j908/+jHK9D1aw066HpVh9aafX+Sss75WpIIAJAYP0Y6u3prK/IiqbM9NRgEuzTg6xyJ
         mMdPTUbSo8UsRuklYQmEZQWL83vTnqhoZ/LYYfFABxjvwo3QKCeGspWqX8I1iNtriGrF
         UDIpPw8/DfrTPpQRNWm2NnlZAh7RdJH8UNyec6bskdIQ1kM571qgqEM4JGrdAFt1Xvmu
         WtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352377; x=1794957177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=tkFmzZl3HYIEad2NhTMTaZaDNLQpZDTajRnI9QVI6Sl2kpcED59+g2h2SzFMDtd+/3
         Mc5P3ee/Q6Bn7IXlYAU1SXsRteFuWKwUGLfehQ28dXLOIC4mJb3VMOX/QPaI9NUk4AJR
         Y5Q6Wdl/t1XfMhf/iZvOn/X+EmEKNiJuL97bF31RmRpD7TiMJOp7jP1dPDKf2LUF3Q5A
         guX5GAcpPqVC7QQkcwhuF1fqihlftXPIg052WEdFARIE3YsWb3qym0zKf797M4fU9INR
         kxIbFw+nKTFPOczmu0XOykRZbmfeKCS0Pl1AxbsP57vYL7MfGgS/pQIUe+DJYvGtXxyo
         8NZg==
X-Forwarded-Encrypted: i=1; AL+hErGXQFK714DrbOwCK5ujQTTzpvqWSThCm8n/rssSXc0G8P+HkywWKXVSoAtbEQKDkrZlom66yJ5gk7A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+MPRs3rlqM+Ju+aMzXN800MJ66723Orf90yzdMXcjxGCq+fEOY
	KMG2WLSp9/dbBwVrWmeo8wdyYY5JmmQU/2jh80WV2Be3YyBngMux8QE8
X-Gm-Gg: AYBFou1ha8piHrlzxaCxQ6xZ8nt4SuSWigfe9SPW+NAq7NKOkErZPvKeu7KGELgwugd
	bpJfT2dKXT/JjjNhIYMu+Jmd+4N1HKPA4LPUY4ZDioF6pFND75o6wnE+HZ0EEnqop8XoySXtAv2
	BX0cTEXwfl0iQ+xYI+CqzcLlYXgjJvSwSy5Ayp8FQxTsPlc18eLEW9X61j3Kfuq5XBbgu92MMV1
	hoxFIttKYAIzqNXjszRRF8bGHC2FoPfp2n2J5Cx6Vtfvuk1J980vc5i6C6uQwOen0nPMQwI0LWj
	cU5EuU1voWHol/owLDULI6O/DBCwju4WAX1nXgocILHIPftEqWWtal50Bx4QLdaGBAHU3Uuu1bz
	msu4TnLzqCON0CbX30DoormxjIBeU57Xp30DZ4fugrZWNH1CRginQ9yqmeYuHBH81m25C5bZ0v1
	LVVBDl/+AyHow6dH9QJ851/yJtBVrNDupnZxbf96PK1lJ4CSmMcaoDNa7F+W8hQ1GdcFALOX93z
	ey/a91uOjKEBKC7J5KyQhuIs+oHQK4QNS/zkA/4OP2FC05PV7aQ+juE3IjXSEHOpAeqSPHIWf94
	OOFTOHZAeZpZvI0WCwB7V+oe7WQQQ3BjGYMdS6w4I3wksLfBHrA25iE=
X-Received: by 2002:a05:6402:4506:b0:6b5:7886:c450 with SMTP id 4fb4d7f45d1cf-6b77781b377mr528054a12.40.1794352376981;
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1750018a12.31.2026.11.10.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
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
Subject: Re: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Wed, 11 Nov 2026 00:12:47 +0100
Message-ID: <20261110231248.206892-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-5-dev@deq.rocks>
References: <20261107154810.89780-5-dev@deq.rocks>
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

On Sat, Nov 07, 2026 at 15:48 UTC, Andre Eikmeyer wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request.

The same happens on a BCM43684 (firmware 17.10.188.75, an access point
with about 15 clients on two radios; this chip also needs patches for
its BCA firmware that I haven't posted yet). In 10.5 hours the wait
timed out 23 times. 2835 frames were still out when their flowring was
deleted, and every one of them was completed later, at most 81 s after
it was posted. No pktid was lost, so the 100 ms wait did not help here
either.

What I can't tell from these numbers is whether a tx status can still
come after the delete response. If it can, it lands on a new ring that
got the same flowid in the meantime and decrements its outstanding_tx,
which also drives brcmf_msgbuf_schedule_txdata(). Do you know how the
firmware orders them? In my tree each tx pktid keeps the generation of
its flowring for that case; I can send it on top of your patch if it
turns out to be needed.

Kordian
