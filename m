Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849D1E1C3A
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226609; cv=none; b=VePGMChZHUaJjxEFg3EKsGq3Tgs99GjANr9WBz/wa8N8VdxkGLLLP83jlzBQgyOF/SsTShwuOi7isqaoTxJosqetADjfkWhhpZ42mqCx/w2pLyVc1P0NbOK2RmKr4lmHUCWN7M3nNwbDYkmFfq574bxVAyyKj9ybcHeILT3mn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226609; c=relaxed/simple;
	bh=MZIqM2S8zhyCBa4HvVVVDg+twBlAXyb63bh7XrtIEx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVJgkRHD5GsidLHAG5VNcjKO9KSopqseqUfEqgLyiLbIbJWDWBToi+P4qYOxhsGrhfvfU8A8ejEJ4hVIFtoz0VCSBVE8tkmY4ljc/bpr5Er0ahwF72I4yGOuqpoy1bAhMALiVlLTvrB5fuAJ/IxZeQmCFL9zR5luvVNha1S2BUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/gJqOgH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/gJqOgH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227cf12df27so679625ad.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744226607; x=1744831407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
        b=T/gJqOgHzoAEeL7Qs15zY07+Go5Ec/JMoqz+f4e7OzbFD+Gb4SP0Xc7M1pFhKNuaU+
         0Ua2SBRpe2d2Bu9tApliLptuLmC0w5ffEtA5goyQ4lZKyuP7eYu6qKJwvNypLqyYggzi
         3NVnX883KgLRqVO51ZLvYwBkziuNrpiNLdyXXrn+tUqkFq23dvq3a8KVf0ceIDamF6so
         fuDCvF814lsMhns0/OdiB8svfK/BiTgYyH6VML3RkfUkjE3lo5MhzA/fEqOXK6SeQ1iY
         5FqoZdlnLbt/Uw9Z/ead/BZbWQ454sHlTc9OrgzLu5Zp25SC09b8gNzBaeEl6NDyx1ka
         GxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226607; x=1744831407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
        b=LnVRHxy1TuYlpKk3dDGOrSeB9UbTSRCFuaW0abhEsHosHooqXGdsY6zcDoaPmX2f3N
         SYvajaj8cXDn89DNCuWMwrZm2l771oSNboFbM++GFJaehHDlccnhaqye8s1KZZgB3iI9
         FKoxTvabkphIBctLjTxtNcBsUcgOxOewt4FkdQDypUdYqgkLyY3fK5sCl3VNhlRQ9IME
         TdVJlA1nK9MQeHVWsL6mgaezLMeTUeYUr2fpTVipZI+q0wpqUrQkFVswXlNnOhT+t7RP
         re7FhO1H646RVHe2f/y8JuyEXyqG55KukhaF7CU4XU2d1UsQKaZgwxoERmeuMRjZE0DQ
         3Omg==
X-Forwarded-Encrypted: i=1; AJvYcCW6sLxRVxjVixqdlXN3tVt6teC60mZ9q8uyqFysgIzNR2N5WtAuvDKzBEut9sn+0D6zLsI8km2WR0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YybDcHP3kPULhsBQE92Fm4VK08rYMO8cHsxGz1xHS4iMcvUkWCq
	AuxulymxYfnz+Vw1/0TjGWsW2uaitp24vLEG2sto81R/awo4miKt
X-Gm-Gg: ASbGncs8A8tUZylDpNn62k0oBD8mSQVWcnRWAwhnaJwvrB0TtIyQHWp/nqGPU2f9SXN
	ql62gsbfUL1HwnuMBx2VqPDiWQnps4dNo9F8rg5NoXuTw/oPQxmeK87cxnMnwqWsUCu+1QCMBzJ
	C5Sdvn5/J6WGKh8QAEzAHMomK5OzdZsa6939LAiu2MUga51Hv/SrC3a+8Hxe3Xp8oHpaGc0vvRL
	zu9TLrtiHJSobRRDvKrfRQsRw1KFdil0QucwYSgY1U8RwBEyBC9m0tJZbycG3mZReKXFR67E/DN
	EHKfkUMcKuoWs277/7BpEseW5GPk53lNHawu7zBigw==
X-Google-Smtp-Source: AGHT+IFL3XhQxmETFJky3U8LpnPa3gTvoNA7bcU/WI3ailvxU34USadXflyfbHs0+s3uYjppXMMUHw==
X-Received: by 2002:a17:903:90d:b0:224:7a4:b31 with SMTP id d9443c01a7336-22acfe92581mr8187825ad.6.1744226606945;
        Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cff4:8871:54bb:4c97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cbdfe7sm15862175ad.207.2025.04.09.12.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:23:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, 
	eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mchehab@kernel.org, 
	awalls@md.metrocast.net, hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com, johannes@sipsolutions.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
	akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net, 
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com, alistair@popple.id.au, 
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org, bpf@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, david.laight.linux@gmail.com, andrew.cooper3@citrix.com, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 07/13] Input: joystick - Replace open-coded parity
 calculation with parity_odd()
Message-ID: <mustacwfqzgmrrtxj23apezwp2ieavnmfa4myylvnojnpf2alm@enruxjpzr46i>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-8-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-8-visitorckw@gmail.com>

On Wed, Apr 09, 2025 at 11:43:50PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
